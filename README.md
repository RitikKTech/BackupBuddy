# 📦 BackupBuddy (Basic Version)

BackupBuddy is a simple and efficient shell-based backup automation tool for Linux systems. It automates the process of backing up important directories or files and stores them in a designated `backups/` folder with timestamped filenames.

## 🔧 Features

- 📁 Backs up selected directories into a `.tar.gz` archive
- 🕑 Supports automation via `cron`
- 📜 Logs backup activity with timestamps
- 💡 Simple and beginner-friendly shell script

## 📂 Folder Structure

backupbuddy/
├── backupbuddy.sh # Main backup script
├── backups/ # Folder where all backup files are saved
└── backupbuddy.log # Log file for backup activity


---

## 🚀 How It Works

1. Select folders to back up inside the script.
2. Run `backupbuddy.sh` manually or on a schedule using `cron`.
3. Backups are saved in the `backups/` folder with timestamped filenames.
4. Every action is logged in `backupbuddy.log`.

---

## 🔧 Setup Instructions

### 1. Clone the Repository

```bash
git clone https://github.com/<your-username>/backupbuddy.git
cd backupbuddy

2. Make Script Executable

chmod +x backupbuddy.sh

3. Run the Script Manually

./backupbuddy.sh

4. [Optional] Add to Crontab for Automation

Open crontab editor:

crontab -e

Add the following line to run the script every day at 2 AM:

0 2 * * * /path/to/backupbuddy/backupbuddy.sh >> /path/to/backupbuddy/backupbuddy.log 2>&1

Log File Format

Each time the script runs, an entry is added to backupbuddy.log:

[2025-07-31 14:00:02] Backup created: backups/backup_2025-07-31_14-00.tar.gz

✅ Tested On

    Ubuntu 20.04 / 22.04

    Bash 5+

🛡️ Disclaimer

This script is provided as-is. Please test it in your environment before relying on it for production backups.

To-Do (For Future Versions)

    ✅ Email alerts

    ✅ Telegram alerts

    ✅ Upload to gofile.io

    ✅ Web dashboard using Flask

    You're viewing the basic version. Advanced features are planned for BackupBuddy 2.0.

👨‍💻 Author

Ritik Rajbhar

📧 Email: [nohar99600@gmail.com]
🌐 GitHub: https://github.com/RitikKTech/
