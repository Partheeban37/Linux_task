#!/usr/bin/env python3

import sys
import time
import os
import subprocess
from datetime import datetime
import threading

SCRIPT_PATH = os.path.abspath(__file__)
ALARM_SOUND = os.path.expanduser("~/Music/Krishna.mp3")


def schedule_alarm(alarm_time):
    now = datetime.now()
    wait_seconds = int((alarm_time - now).total_seconds())
    if wait_seconds <= 0:
        print("Alarm time has already passed.")
        return

    print(f"Alarm set for {alarm_time.strftime('%Y-%m-%d %H:%M')}.\nYou can close this terminal.")

    # This command will run in background using nohup
    # At the scheduled time, it will open a new terminal and run trigger_alarm
    command = (
        f"nohup bash -c '"
        f"sleep {wait_seconds}; "
        f"gnome-terminal -- bash -c \"python3 {SCRIPT_PATH} --trigger; exec bash\"'"
        f" >/dev/null 2>&1 &"
    )

    subprocess.Popen(command, shell=True)


def trigger_alarm():
    alarm_running = True

    def play_sound():
        while alarm_running:
            subprocess.run(['mpg123', ALARM_SOUND],
                           stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    def notify():
        subprocess.run(['notify-send', "Alarm!", "It's time!"],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

    notify()
    print("\nAlarm is ringing!")
    print("[1] Stop")
    print("[2] Extend (minutes)")

    sound_thread = threading.Thread(target=play_sound)
    sound_thread.start()

    try:
        while True:
            choice = input("Enter option: ").strip()
            if choice == '1':
                alarm_running = False
                sound_thread.join()
                print("Alarm stopped.")
                break
            elif choice == '2':
                mins = input("Extend by how many minutes? ").strip()
                if mins.isdigit() and int(mins) > 0:
                    alarm_running = False
                    sound_thread.join()
                    mins = int(mins)
                    print(f"Extended by {mins} minute(s).")
                    extend_command = (
                        f"nohup bash -c '"
                        f"sleep {mins * 60}; "
                        f"gnome-terminal -- bash -c \"python3 {SCRIPT_PATH} --trigger; exec bash\"'"
                        f" >/dev/null 2>&1 &"
                    )
                    subprocess.Popen(extend_command, shell=True)
                    break
                else:
                    print("Invalid number.")
            else:
                print("Invalid choice.")
    except KeyboardInterrupt:
        alarm_running = False
        sound_thread.join()
        print("\nAlarm interrupted.")
    except EOFError:
        alarm_running = False
        sound_thread.join()
        print("\n No input. Alarm stopped.")


def main():
    if '--trigger' in sys.argv:
        trigger_alarm()
        return

    if len(sys.argv) < 2:
        print("Usage: ./up_alarm.py HH:MM [YYYY-MM-DD]")
        return

    time_part = sys.argv[1]
    date_part = sys.argv[2] if len(sys.argv) > 2 else datetime.now().strftime('%Y-%m-%d')

    try:
        alarm_time = datetime.strptime(f"{date_part} {time_part}", "%Y-%m-%d %H:%M")
        schedule_alarm(alarm_time)
    except ValueError:
        print("Invalid date/time format. Use: ./up_alarm.py HH:MM [YYYY-MM-DD]")


if __name__ == "__main__":
    main()
