*** Settings ***
Library    GenerateWordsLibrary.py

*** Keywords ***
Random credential
    [Arguments]  ${wordLength}
    ${value}=    randomWord      ${wordLength}
    [Return]     ${value}