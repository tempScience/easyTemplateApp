#!/usr/bin/env python3

import os, toml
import Functions

if __name__ == "__main__":
    config = Functions.config()
    src = config['ci']['project']['subdirs']['distribution']

    project_name = config['tool']['poetry']['name']
    runner_os = Functions.environmentVariable('RUNNER_OS')
    short_github_ref = Functions.environmentVariable('SHORT_GITHUB_REF')
    dst = f'{project_name}-{runner_os}-{short_github_ref}.zip'

    Functions.zipdir(src, dst)
