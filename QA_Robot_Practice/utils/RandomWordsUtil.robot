*** Settings ***
Documentation     This util is used for generating random strings with letters, digits and special characters.
Library           ../libraries/GenerateWordsLibrary.py

*** Variables ***
${DEFAULT_PROJECT_NAME_LENGTH}    19

*** Keywords ***
Get Random String
    [Arguments]    ${wordLength}    #This argument used for setting length of random string
    ${wordLength}    Convert To Integer    ${wordLength}
    ${value}    GenerateWordsLibrary.Get Random String    ${wordLength}
    [Return]    ${value}