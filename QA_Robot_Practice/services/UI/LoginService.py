from globalConfig import GlobalSettings
from pages import LoginPage
from libraries.WebTable import WebTable

def open_login_page(url):
    LoginPage.open_browser_on_login_page(url)

def login_to_clarabridge(user_name=GlobalSettings.USER_LOGIN, password=GlobalSettings.USER_PASSWORD):
    LoginPage.login(user_name, password)

def check_location(url):
    LoginPage.check_url(url)

def check_error_message_presence():
    LoginPage.check_error_message()

def parse_table():
    WebTable(LoginPage.get_project_table())
