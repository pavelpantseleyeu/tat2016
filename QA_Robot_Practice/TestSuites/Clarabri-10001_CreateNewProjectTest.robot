*** Settings ***
Suite Teardown    Close Browser
Resource          ../utils/RandomWordsUtil.robot
Resource          ../services/UI/ManageProjectServiceUI.robot
Resource          ../services/UI/LoginServiceUI.robot
Resource          Resources/Resources.robot

*** Test Case ***
Create New Project Test
    ${projectName}    RandomWordsUtil.Get Random String    ${PROJECT_NAME_LENGTH}
    [setup]    Run Keywords    Login As Admin     Go To Projects Page
    Create New Project    ${projectName}
    Check Project Creation    ${projectName}
    [Teardown]    Delete Project    ${projectName}