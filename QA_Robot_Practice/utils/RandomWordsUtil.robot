*** Settings ***
Documentation  This util is used for generating random strings with letters, digits and special characters.
Library    GenerateWordsLibrary.py

*** Keywords ***
Generate Random Credential
    [Arguments]    ${wordLength}    #This argument used for setting length of random string
    ${value}    get random string    ${wordLength}
    [Return]     ${value}