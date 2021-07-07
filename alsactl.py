import os
import subprocess

RESTORE_FILE_PATH = '{home}/.config/asound.state'.format(home=os.environ['HOME'])


def restore():
    reset = subprocess.Popen(['alsactl', '-f', RESTORE_FILE_PATH, 'restore'])
    reset.communicate()


def watch():
    restore()

    monitor = subprocess.Popen(['stdbuf', '-oL', 'alsactl', 'monitor'], stdout=subprocess.PIPE)
    while monitor.stdout.readlines(1):
        restore()


if __name__ == '__main__':
    watch()
