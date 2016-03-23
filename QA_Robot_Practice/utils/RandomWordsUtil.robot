*** Settings ***
Library    GenerateWordsLibrary.py

*** Keywords ***
Generate Random Credential
    [Arguments]  ${wordLength}
    ${value}=    randomWord      ${wordLength}
    [Return]     ${value}