from globalConfig.GlobalSettings import GlobalSettings
from Selenium2Library import Selenium2Library as sel
from pages import BasePage

LOGIN_TEXT_INPUT_LOCATOR = "//*[@id='j_username']"
PASSWORD_TEXT_INPUT_LOCATOR = "//*[@name='j_password']"
SUBMIT_BUTTON_LOCATOR = "//button[@type='submit']"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
ERROR_CASE_ELEMENT = "//font[@color='red']"
OK_BUTTON_LOCATOR = "//div[@class='gwt-DialogBox'][3]//div[@class='okButton nowrap']"
ERROR_COLOR_ATTRIBUTE = "color"
ERROR_TEXT_COLOR = "red"
driver = BasePage.driver

def open_browser_on_login_page(url):
    sel.open_browser(driver, url)
    sel.maximize_browser_window(driver)

def confirm_error_message():
    sel.click_element(driver, OK_BUTTON_LOCATOR)

def login(user_name, password):
    sel.input_text(driver, LOGIN_TEXT_INPUT_LOCATOR, user_name)
    sel.input_text(driver, PASSWORD_TEXT_INPUT_LOCATOR, password)
    sel.click_element(driver, SUBMIT_BUTTON_LOCATOR)
    try:
        confirm_error_message()
    except:
        pass

def check_url(url):
    actual_url = sel.get_location(driver)
    assert actual_url in url

def check_error_message():
    color = sel.get_webelement(driver, ERROR_CASE_ELEMENT).get_attribute(ERROR_COLOR_ATTRIBUTE)
    assert color in ERROR_TEXT_COLOR

