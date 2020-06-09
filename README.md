# easyTemplateApp
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FtempScience%2FeasyTemplateApp.svg?type=shield)](https://app.fossa.com/projects/git%2Bgithub.com%2FtempScience%2FeasyTemplateApp?ref=badge_shield)

Template for easyScience applications

## Download easyTemplate
* Open **Terminal**
* Change the current working directory to the location where you want the **easyTemplateApp** directory
* Clone **easyTemplateApp** repo from GitHub using **git**
  ```
  git clone https://github.com/tempScience/easyTemplateApp
  ```
  
## Install easyTemplate dependencies
* Open **Terminal**
* Install [**Poetry**](https://python-poetry.org/docs/) (Python dependency manager)
  * osx / linux / bashonwindows
    ```
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    ```
  * windows powershell
    ```
    (Invoke-WebRequest -Uri https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -UseBasicParsing).Content | python
    ```
* Go to **easyTemplateApp** directory
* Create virtual environment for **easyTemplate** and install its dependences using **poetry** (configuration file: **pyproject.toml**)
  ```
  poetry update
  ```
  
## Launch easyTemplate application
* Open **Terminal**
* Go to **easyTemplateApp** directory
* Launch **easyTemplate** application using **poetry**
  ```
  poetry run easytemplate
  ```

## Update easyTemplate dependencies
* Open **Terminal**
* Go to **easyTemplateApp** directory
* Update **easyTemplate** using **poetry** (configuration file: **pyproject.toml**)
  ```
  poetry update
  ```

## Delete easyTemplate
* ...
* Uninstall **Poetry**
   * osx / linux / bashonwindows
   ```
   curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | POETRY_UNINSTALL=1 python
   ```


## License
[![FOSSA Status](https://app.fossa.com/api/projects/git%2Bgithub.com%2FtempScience%2FeasyTemplateApp.svg?type=large)](https://app.fossa.com/projects/git%2Bgithub.com%2FtempScience%2FeasyTemplateApp?ref=badge_large)