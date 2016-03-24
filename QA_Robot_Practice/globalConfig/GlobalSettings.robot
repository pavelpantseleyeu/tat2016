*** Settings ***
Documentation     This file describes global data.
Library           ../libraries/GenerateWordsLibrary.py

*** Variables ***
${PROTOCOL}       http:
${SERVER}         ecsd001004eb.epam.com
${PORT}           18080
${LOGIN_URL}      ${PROTOCOL}//${SERVER}:${PORT}/cmp
${SELENIUM_SPEED}    0
${BROWSER}        firefox
${USER_LOGIN}     admin
${USER_PASSWORD}    admin
