import sys
import os
import json
import subprocess
from PyQt5 import uic
from PyQt5.QtWidgets import QApplication, QWidget, QMessageBox
from PyQt5.QtCore import Qt, QThread, pyqtSignal, QTimer

JSON_PATH = "/data/data/com.termux/files/home/RazX/installer.json"
BASH_SCRIPT = "/data/data/com.termux/files/home/RazX/theme.sh"

class BashRunner(QThread):
    finished = pyqtSignal(int, str)

    def run(self):
        if not os.path.exists(BASH_SCRIPT):
            self.finished.emit(1, "Script not found.")
            return
        result = subprocess.run([BASH_SCRIPT], capture_output=True, text=True)
        self.finished.emit(result.returncode, result.stdout)


class Setup(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("/data/data/com.termux/files/home/RazX/Installer-resources/setup/main.ui", self)
        self.setWindowTitle("System")
        self.showFullScreen()

        self.progressBar.setVisible(False)

        self.start.clicked.connect(self.getstart)
        self.themeDownload.clicked.connect(self.themedownload)

        self.progress_timer = QTimer()
        self.progress_timer.timeout.connect(self.read_progress)

    def getstart(self):
        self.stackedWidget.setCurrentIndex(1)

    def themedownload(self):
        self.progressBar.setVisible(True)
        self.themeDownload.setVisible(False)
        self.progressBar.setValue(0)

        self.progress_timer.start(500)

        self.bash_thread = BashRunner()
        self.bash_thread.finished.connect(self.on_bash_finished)
        self.bash_thread.start()

    def read_progress(self):
        try:
            if os.path.exists(JSON_PATH):
                with open(JSON_PATH, "r") as f:
                    installer = json.load(f)
                    progress = int(installer.get("progress", 0))
                    self.progressBar.setValue(progress)
        except Exception as e:
            print("Failed to read progress:", e)

    def on_bash_finished(self, code, output):
        print("Bash Output:\n", output)
        self.progress_timer.stop()

        if code == 0:
            self.after_bash_done()
        else:
            self.progressBar.setVisible(False)
            QMessageBox.critical(self, "Error", "❌ Bash script failed to execute.")

    def after_bash_done(self):
        try:
            with open(JSON_PATH, "r") as f:
                installer = json.load(f)
        except Exception as e:
            self.progressBar.setVisible(False)
            QMessageBox.critical(self, "Error", f"❌ Failed to load installer.json:\n{e}")
            return

        self.progressBar.setValue(int(installer.get("progress", 0)))

        QTimer.singleShot(1500, lambda: self.progressBar.setVisible(False))

        keys = ["theme", "icon", "cursor", "wallpaper", "dock", "systembash", "bashrc"]
        if all(installer.get(k) == "true" for k in keys):
            print("✔ All components installed:", [installer[k] for k in keys])
            QApplication.quit()
        else:
            QMessageBox.warning(self, "Incomplete", "⚠ Not all components were installed successfully.")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = Setup()
    window.show()
    sys.exit(app.exec_())
