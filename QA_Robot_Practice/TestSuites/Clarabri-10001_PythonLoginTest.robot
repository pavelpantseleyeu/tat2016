*** Settings ***
Suite Teardown    Close Browser
Resource          Resources/Resources.robot
Resource          ../utils/RandomWordsUtil.robot
Resource          ../globalConfig/GlobalSettings.robot
Resource          Resources/Resources.robot
Library           ../services/UI/LoginServiceUI.py
Library           ../services/UI/ManageProjectServiceUI.py
Library           ../utils/DriverUtil.py

*** Test Cases ***
Valid Credentials Test
    LoginServiceUI.Login As Admin
    ManageProjectserviceUI.Go To Projects Page
    ManageProjectServiceUI.Check Location     ${WELCOM_URL}
    [Teardown]     ManageProjectServiceUI.Sign Out

Invalid Login Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    LoginServiceUI.Login To Clarabridge    ${login}    ${USER_PASSWORD}
    ManageProjectServiceUI.Check Location    ${ERROR_URL}
    LoginServiceUI.Check Error Message Presence

Invalid Password Test
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    LoginServiceUI.Login To Clarabridge    ${USER_LOGIN}    ${password}
    ManageProjectServiceUI.Check Location    ${ERROR_URL}
    LoginServiceUI.Check Error Message Presence

Invalid Login And Password Test
    ${login}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    ${password}    RandomWordsUtil.Get Random String    ${CREDENTIAL_SIZE}
    LoginServiceUI.Login To Clarabridge    ${login}    ${password}
    ManageProjectServiceUI.Check Location    ${ERROR_URL}
    LoginServiceUI.Check Error Message Presence