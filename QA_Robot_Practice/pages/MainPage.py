from ui.Browser import Browser


SYSTEM_DROPDOWN_LOCATOR = "//*[@id='GButtonUserMenu']"
LOGOUT_LINK_LOCATOR = "//*[@id='GBLgf']"
LAST_LOGIN_LABEL_LOCATOR = "//*[@id='GTlastLoginLabel']"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
CREATE_NEW_PROJECT_BUTTON_LOCATOR = "//button[contains(text(), 'Create New Project')]"
PROJECT_NAME_FIELD_LOCATOR = "//.[@class='gwt-TextBox' and @maxlength='19']"
NEW_PROJECT_UPLOAD_DATA_CHECKBOX_LOCATOR = "//*[@id='gwt-uid-3']"
CREATE_BUTTON_LOCATOR = "//button[text()='Create']"
ONLOAD_LOCATOR = "//*[contains(text(), 'Project is being created')]"
SUBMIT_DELETE_BUTTON_LOCATOR = "//table[@class='alertDialog']//div[@class='okButton']"
OK_DELETE_BUTTON_LOCATOR = "//*[@class='okButton']"
RETAIN_SCHEMAS_CHECKBOX_LOCATOR = "//*[@id='gwt-uid-3']"
DELETE_TABLE_LOCATOR =  "//*[@class='dialogTopCenter']"


def click_on_system_dropdown():
    Browser.click(SYSTEM_DROPDOWN_LOCATOR)


def click_sign_out():
    Browser.click(LOGOUT_LINK_LOCATOR)


def click_on_logo():
    for x in range(0, 3):
        Browser.click(LOGO_LOCATOR)


def check_url(url):
    actual_url = Browser.get_current_url()
    assert actual_url in url
