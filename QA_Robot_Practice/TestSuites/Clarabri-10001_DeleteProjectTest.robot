*** Settings ***
Resource          ../services/UI/ManageProjectsServiceUI.robot
Resource          ../services/UI/LoginServiceUI.robot

*** Test Case ***
Delete Project Test
    [setup]    Run Keywords    Login As Admin    Create Test Project
    Delete Project    ${projectName}
    Check Project Deletion      ${projectName}
    [Teardown]    Close Browser
