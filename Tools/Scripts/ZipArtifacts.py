#!/usr/bin/env python3

import os, toml
import Functions


config = Functions.config()

def source():
    return config['ci']['project']['subdirs']['distribution']

def destination():
    project_name = config['tool']['poetry']['name']
    runner_os = Functions.environmentVariable('RUNNER_OS')
    short_github_ref = Functions.environmentVariable('SHORT_GITHUB_REF')
    return f'{project_name}-{runner_os}-{short_github_ref}.zip'

def zipdir():
    Functions.zipdir(source(), destination())

if __name__ == "__main__":
    zipdir()
