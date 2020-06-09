# easyTemplateApp
Template for easyScience applications

## Install and lunch easyTemplate

* Open Terminal
* Change the current working directory to the location where you want the easyTemplateApp directory
* Clone easyTemplateApp repo from GitHub
  ```
  git clone https://github.com/tempScience/easyTemplateApp
  ```
* Go to easyTemplateApp directory
* Install [Poetry](https://python-poetry.org/docs/) (Python dependency manager)
  * osx / linux / bashonwindows
    ```
    curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python
    ```
  * windows powershell
    ```
    (Invoke-WebRequest -Uri https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -UseBasicParsing).Content | python
    ```
* Install easyTemplate dependences
  ```
  poetry update
  ```
* Launch easyTemplate application
  ```
  poetry run easyTemplate
  ```
