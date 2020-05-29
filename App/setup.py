import sys
from cx_Freeze import setup, Executable


excludes = ['logging', 'unittest', 'email', 'html', 'http', 'urllib',
            'xml', 'pydoc', 'doctest', 'argparse', 'datetime', 'zipfile',
            'subprocess', 'pickle', 'threading', 'locale', 'calendar',
            'weakref', 'tokenize', 'base64', 'gettext', 're',
            'bz2', 'fnmatch', 'getopt', 'string', 'stringprep',
            'quopri', 'copy', 'imp', 'linecache',
            ]

includes = ['PySide2.QtCore']

zip_include_packages = ['collections', 'encodings', 'importlib']

options = {
    'build_exe': {
        'includes': includes,
        #'include_msvcr': True,
        #'excludes': excludes,
        #'zip_include_packages': zip_include_packages,
        #'build_exe': 'build_macos',
    }
}

base = None
if sys.platform == 'win32':
    base = 'Win32GUI'

executables = [
    Executable('main.py', targetName='easyTemplate', base=base)
]

setup(
    name='easyTemplate',
    version='0.0.1',
    description='Template for easyScience applications',
    options=options,
    executables=executables,
)
