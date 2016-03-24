*** Settings ***
Resource          ../services/UI/LoginServiceUI.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          ../globalConfig/GlobalSettings.robot

*** Variables ***
${WELCOM_URL}     ${LOGIN_URL}/projects
${CREDENTIAL_SIZE}    19

*** Test Case ***
Create New Project Test
    ${projectName}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    Open Browser On Login Page
    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}
    Go To Projects Page
    Click On Create New Project Button
    Click On Project Name Field
    Input New Project's Name    ${projectName}
    Off Upload Data
    Click Create Button
    Find New Project    ${projectName}
