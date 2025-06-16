import sys
from PyQt5 import uic
from PyQt5.QtWidgets import QApplication, QWidget
from PyQt5.QtCore import QProcess, QTimer, Qt

class UpdateApp(QWidget):
    def __init__(self):
        super().__init__()
        uic.loadUi("/data/data/com.termux/files/home/RazX/dependencies/system/boot/main.ui", self)
        self.showFullScreen()  # Load your UI
        self.process = QProcess()
        self.process.finished.connect(self.after_update)
        self.setCursor(Qt.BlankCursor)

        # Start the update after the UI loads
        QTimer.singleShot(100, self.run_update)

    def run_update(self):
        print("Running pkg update...")
        self.process.start("pkg", ["update"])

    def after_update(self):
        print("pkg update finished.")
        self.some_function()
        QApplication.quit()  # Exit the app

    def some_function(self):
        print("Post-update code runs here.")

if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = UpdateApp()
    window.show()
    sys.exit(app.exec_())
