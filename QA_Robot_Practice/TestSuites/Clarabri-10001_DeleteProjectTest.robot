*** Settings ***
Resource          ../utils/RandomWordsUtil.robot
Resource          Resources/Resources.robot
Resource          ../services/UI/ManageProjectServiceUI.robot

*** Test Case ***
Delete Project Test
    [Setup]    Create Test Project    Delete Project
    Delete Project    ${projectName}
    Check Delete Project    ${projectName}
    [Teardown]    Close Browser
