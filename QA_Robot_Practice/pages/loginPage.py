import sys
sys.path.append("../globalConfig")
sys.path.append("../utils")
import DriverUtil
import GlobalSettings
from selenium import webdriver
from selenium.webdriver.support.ui import WebDriverWait

LOGIN_TEXT_INPUT_LOCATOR = "j_username"
PASSWORD_TEXT_INPUT_LOCATOR = "j_password"
SUBMIT_BUTTON_LOCATOR = "//button[@type='submit']"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
ERROR_CASE_ELEMENT = "//font[@color='red']"
OK_BUTTON_LOCATOR = "//div[@class='gwt-DialogBox'][3]//div[@class='okButton nowrap']"
ERROR_COLOR_ATTRIBUTE = "color"
ERROR_TEXT_COLOR = "red"

#driver = webdriver.Firefox()
driver = DriverUtil.get_driver()

def open_browser_on_login_page():
    driver.implicitly_wait(GlobalSettings.SELENIUM_DEFAULT_TIMEOUT)
    driver.get(GlobalSettings.LOGIN_URL)
    driver.maximize_window()

def confirm_error_message():
    driver.find_element_by_xpath(OK_BUTTON_LOCATOR).click()

def login(user_name, password):
    driver.find_element_by_name(LOGIN_TEXT_INPUT_LOCATOR).send_keys(user_name)
    driver.find_element_by_name(PASSWORD_TEXT_INPUT_LOCATOR).send_keys(password)
    driver.find_element_by_xpath(SUBMIT_BUTTON_LOCATOR).click()
    try:
        confirm_error_message()
    except:
        pass

def check_error_message():
    color = driver.find_element_by_xpath(ERROR_CASE_ELEMENT).get_attribute(ERROR_COLOR_ATTRIBUTE)
    assert color in ERROR_TEXT_COLOR







