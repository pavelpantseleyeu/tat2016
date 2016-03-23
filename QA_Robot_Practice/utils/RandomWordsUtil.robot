*** Settings ***
Library    GenerateWordsLibrary.py

*** Keywords ***
Generate Random Credential
    [Arguments]  ${wordLength}
    ${value}    get random string    ${wordLength}
    [Return]     ${value}