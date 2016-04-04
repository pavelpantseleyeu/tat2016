import sys
sys.path.append("../globalConfig")
sys.path.append("../utils")
import DriverUtil

SYSTEM_DROPDOWN_LOCATOR = "GButtonUserMenu"
LOGOUT_LINK_LOCATOR = "GBLgf"
LAST_LOGIN_LABEL_LOCATOR = "GTlastLoginLabel"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
CREATE_NEW_PROJECT_BUTTON_LOCATOR = "//button[contains(text(), 'Create New Project')]"
PROJECT_NAME_FIELD_LOCATOR = "//.[@class='gwt-TextBox' and @maxlength='19']"
NEW_PROJECT_UPLOAD_DATA_CHECKBOX_LOCATOR = "gwt-uid-3"
CREATE_BUTTON_LOCATOR = "//button[text()='Create']"
ONLOAD_LOCATOR = "//*[contains(text(), 'Project is being created')]"
SUBMIT_DELETE_BUTTON_LOCATOR = "//table[@class='alertDialog']//div[@class='okButton']"
OK_DELETE_BUTTON_LOCATOR = "//*[@class='okButton']"
RETAIN_SCHEMAS_CHECKBOX_LOCATOR = "//*[@id='gwt-uid-3']"
DELETE_TABLE_LOCATOR =  "//*[@class='dialogTopCenter']"

driver = DriverUtil.get_driver()

def click_on_system_dropdown():
    driver.find_element_by_id(SYSTEM_DROPDOWN_LOCATOR).click()

def click_sign_out():
    driver.find_element_by_id(LOGOUT_LINK_LOCATOR).click()

def click_on_logo():
    for x in range(0, 3):
        driver.find_element_by_xpath(LOGO_LOCATOR).click()

def check_url(url):
    actual_url=driver.current_url
    assert actual_url in url