*** Settings ***
Resource          ../utils/RandomWordsUtil.robot
Resource          ../services/UI/ManageProjectsServiceUI.robot
Resource          ../services/UI/LoginServiceUI.robot

*** Variables ***
${PROJECT_NAME_LENGTH}    19

*** Test Case ***
Create New Project Test
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_LENGTH}
    [setup]    Run Keywords    Open Login Page
    ...    AND    Login To Clarabridge    ${USER_LOGIN}    ${USER_PASSWORD}
    ...    AND    Go To Projects Page
    Create New Project    ${projectName}
    Check Project Creation    ${projectName}
    [Teardown]    Close Browser