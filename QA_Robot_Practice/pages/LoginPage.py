from pages.BasePage import driver as driver


LOGIN_TEXT_INPUT_LOCATOR = "//*[@id='j_username']"
PASSWORD_TEXT_INPUT_LOCATOR = "//*[@name='j_password']"
SUBMIT_BUTTON_LOCATOR = "//button[@type='submit']"
LOGO_LOCATOR = "//img[@src='images/logo.gif']"
ERROR_CASE_ELEMENT = "//font[@color='red']"
OK_BUTTON_LOCATOR = "//div[@class='gwt-DialogBox'][3]//div[@class='okButton nowrap']"
ERROR_COLOR_ATTRIBUTE = "color"
ERROR_TEXT_COLOR = "red"


def open_browser_on_login_page(url):
    driver.open_browser(url)
    driver.maximize_browser_window()


def confirm_error_message():
    driver.click_element(OK_BUTTON_LOCATOR)


def login(user_name, password):
    driver.input_text(LOGIN_TEXT_INPUT_LOCATOR, user_name)
    driver.input_text(PASSWORD_TEXT_INPUT_LOCATOR, password)
    driver.click_element(SUBMIT_BUTTON_LOCATOR)
    try:
        confirm_error_message()
    except:
        pass


def check_url(url):
    actual_url = driver.get_location()
    assert actual_url in url


def check_error_message():
    color = driver.get_webelement(ERROR_CASE_ELEMENT).get_attribute(ERROR_COLOR_ATTRIBUTE)
    assert color in ERROR_TEXT_COLOR