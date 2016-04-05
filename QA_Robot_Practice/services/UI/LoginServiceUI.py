from bo.Users import UserBuilder
from pages import LoginPage


def login():
    LoginPage.open_login_page()
    LoginPage.login_in(UserBuilder.get_default_user())


def login_with_incorrect_password():
    LoginPage.open_login_page()
    LoginPage.login_in(UserBuilder.get_default_user(password='incorrect_password'))


def login_with_incorrect_login():
    LoginPage.open_login_page()
    LoginPage.login_in(UserBuilder.get_default_user(login='incorrect_login'))


def check_is_login_error_message_present():
    assert True == LoginPage.is_login_error_message_present(), 'Login Error message is not presented'