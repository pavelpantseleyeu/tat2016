from pages.MainPage import *
from ui.Browser import Browser


def go_to_projects_page():
    click_on_logo()


def sign_out():
    click_on_system_dropdown()
    click_sign_out()
    Browser.close_browser()


def check_location(url):
    check_url(url)


def close_browser():
    Browser.close_browser()