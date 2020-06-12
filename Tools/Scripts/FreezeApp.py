#!/usr/bin/env python3

import os, sys
import easyAppGui, easyAppLogic
from PyInstaller.__main__ import run

current_path = os.path.dirname(sys.argv[0])

run([
    os.path.join('easyTemplate', 'main.py'),
    '--name=%s' % 'easyTemplate',
    '--noconfirm',
    '--clean',
    '--windowed',
    '--onedir',
    '--add-data=%s:.' % 'easyTemplate',
    '--add-data=%s:.' % easyAppGui.__path__[0],
    '--add-data=%s:.' % easyAppLogic.__path__[0],
    #'--add-data=%s' % os.path.join('resource', 'path', '*.txt'),
    '--icon=%s' % os.path.join('easyTemplate', 'Gui', 'Resources', 'Logo', 'App.icns')
])
