import os
import subprocess


def restore():
    file_path = '{home}/.config/asound.state'.format(home=os.environ['HOME'])
    reset = subprocess.Popen(['alsactl', '-f', file_path, 'restore'])
    reset.communicate()


def watch():
    restore()

    monitor = subprocess.Popen(['stdbuf', '-oL', 'alsactl', 'monitor'], stdout=subprocess.PIPE)
    while monitor.stdout.readlines(1):
        restore()


if __name__ == '__main__':
    watch()
