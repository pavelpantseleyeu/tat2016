from ui.Browser import Browser

SYSTEM_DROPDOWN_LOCATOR = "//*[@id='GButtonUserMenu']"
LOGOUT_LINK_LOCATOR = "//*[@id='GBLgf']"
LAST_LOGIN_LABEL_LOCATOR = "GTlastLoginLabel"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"

def click_on_system_dropdown():
    Browser.click(SYSTEM_DROPDOWN_LOCATOR)

def click_sign_out():
    Browser.click(LOGOUT_LINK_LOCATOR)

def click_on_logo():
    for x in range(0, 3):
        Browser.click(LOGO_LOCATOR)