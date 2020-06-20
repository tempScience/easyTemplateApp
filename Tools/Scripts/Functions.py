#!/usr/bin/env python3

import os, sys
import time
import subprocess
import zipfile

# FUNCTIONS

def osName():
    platform = sys.platform
    if platform.startswith('darwin'):
        return 'macos'
    elif platform.startswith('lin'):
        return 'linux'
    elif platform.startswith('win'):
        return 'windows'
    else:
        print("- Unsupported platform '{0}'".format(platform))
        return None

def environmentVariable(name, default=None):
    value = os.getenv(name)
    if value is not None:
        return value
    else:
        print("- Failed to find environment variable '{0}', using default value '{1}'".format(name, default))
        return default

# https://thispointer.com/python-how-to-create-a-zip-archive-from-multiple-files-or-directory/
# https://stackoverflow.com/questions/27991745/zip-file-and-avoid-directory-structure
# https://stackoverflow.com/questions/32640053/compressing-directory-using-shutil-make-archive-while-preserving-directory-str
# Zip all the files from given directory
def zipdir(src, dst):
    """
    Compress a directory (ZIP file).
    """
    # Check if src exists
    if not os.path.exists(src):
        print(f"Warning: {src} doesn't exist")
        return
    # create a ZipFile object
    with zipfile.ZipFile(dst, 'w') as zf:
        rootdirname = os.path.basename(src)
        for dirpath, _, filenames in os.walk(src):
            for filename in filenames:
                filepath = os.path.join(dirpath, filename)
                arcpath = os.path.relpath(filepath, rootdirname)
                zf.write(filepath, arcpath)
