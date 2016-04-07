from pages.MainPage import *


def go_to_projects_page():
    click_on_logo()


def sign_out():
    click_on_system_dropdown()
    click_sign_out()


def check_location(url):
    check_url(url)