*** Settings ***
Resource          res/MainPageLocators.robot
Library           Selenium2Library

*** Keywords ***
Confirm Error Message
    Wait Until Element Is Visible  ${OK_BUTTON_LOCATOR}
    Click Element  ${OK_BUTTON_LOCATOR}

Click On System Dropdown
    Wait Until Element Is Visible  ${SYSTEM_DROPDOWN_LOCATOR}
    Click Element  ${SYSTEM_DROPDOWN_LOCATOR}

Click Sign Out
    Wait Until Element Is Visible  ${LOGOUT_LINK_LOCATOR}
    Click Element  ${LOGOUT_LINK_LOCATOR}

Click On Logo
    Wait Until Element Is Visible  ${LOGO_LOCATOR}
    Click Element  ${LOGO_LOCATOR}
