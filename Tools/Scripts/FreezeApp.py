#!/usr/bin/env python3

import os, sys
import easyAppGui, easyAppLogic
from PyInstaller.__main__ import run

current_path = os.path.dirname(sys.argv[0])
separator = ":"
if sys.platform.startswith('win'):
    separator = ";"

run([
    os.path.join('easyTemplate', 'main.py'),
    '--name=%s' % 'easyTemplate',
    '--noconfirm',
    '--clean',
    '--windowed',
    '--onedir',
    '--add-data={}{}.'.format('easyTemplate', separator),
    '--add-data={}{}.'.format(easyAppGui.__path__[0], separator),
    '--add-data={}{}.'.format(easyAppLogic.__path__[0], separator)
    #'--add-data=%s' % os.path.join('resource', 'path', '*.txt'),
    #'--icon=%s' % os.path.join('easyTemplate', 'Gui', 'Resources', 'Logo', 'App.icns')
])
