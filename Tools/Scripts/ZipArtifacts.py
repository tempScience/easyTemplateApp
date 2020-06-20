#!/usr/bin/env python3

import os
import Functions

if __name__ == "__main__":
    RUNNER_OS = Functions.environmentVariable('RUNNER_OS')
    SHORT_GITHUB_REF = Functions.environmentVariable('SHORT_GITHUB_REF')
    src = 'dist'
    dst = f'easyTemplate-{RUNNER_OS}-{SHORT_GITHUB_REF}.zip'
    Functions.zipdir(src, dst)
