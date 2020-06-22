#!/usr/bin/env python3

import os, sys
import toml
import easyTemplateLib, easyAppGui, easyAppLogic
import Functions
from PyInstaller.__main__ import run as pyInstallerMain

# OS independent variables

# config dict
config = Functions.config()

# name
package_name = config['tool']['poetry']['name']

# paths
main_py_path = os.path.join(os.getcwd(), package_name, 'main.py')
distribution_dir_path = os.path.join(os.getcwd(), config['ci']['project']['subdirs']['distribution'])
work_dir_path = os.path.join(os.getcwd(), config['ci']['project']['subdirs']['build'])

# OS dependent variables

# add-data
separator = config['ci']['pyinstaller']['separator'][Functions.osName()]
project_data = f'{package_name}{separator}.'
easy_template_lib_data = f'{easyTemplateLib.__path__[0]}{separator}.'
easy_app_logic_data = f'{easyAppLogic.__path__[0]}{separator}.'
easy_app_gui_data = f'{easyAppGui.__path__[0]}{separator}.'

# icon
icon_dir = os.path.join(*config['ci']['app']['icon']['dir'])
icon_name = config['ci']['app']['icon']['name']
icon_ext = config['ci']['app']['icon']['ext'][Functions.osName()]
icon_path = os.path.join(package_name, icon_dir, f'{icon_name}.{icon_ext}')

# Run PyInstaller function
def runPyInstaller():
    pyInstallerMain([
        main_py_path,                            # Application main file
        f'--name={package_name}',                # Name to assign to the bundled app and spec file (default: first script’s basename)
        '--noconfirm',                           # Replace output directory (default: SPECPATH/dist/SPECNAME) without asking for confirmation
        '--clean',                               # Clean PyInstaller cache and remove temporary files before building
        '--windowed',                            # Windows and Mac OS X: do not provide a console window for standard i/o.
        '--onedir',                              # Create a one-folder bundle containing an executable (default)
        '--log-level', 'INFO',                   # LEVEL may be one of DEBUG, INFO, WARN, ERROR, CRITICAL (default: INFO).
        '--distpath', distribution_dir_path,     # Where to put the bundled app (default: ./dist)
        '--workpath', work_dir_path,             # Where to put all the temporary work files, .log, .pyz and etc. (default: ./build)
        f'--add-data={project_data}',            # Add both project Python and QML source files
        f'--add-data={easy_template_lib_data}',  # Add easyTemplateLib package
        f'--add-data={easy_app_logic_data}',     # Add easyAppLogic package
        f'--add-data={easy_app_gui_data}',       # Add easyAppGui package
        f'--icon={icon_path}'                    # Add application icon
])

# MAIN

if __name__ == "__main__":
    runPyInstaller()
