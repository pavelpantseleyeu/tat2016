from pages import MainPage

def go_to_projects_page():
    MainPage.click_on_logo()

def sign_out():
    MainPage.click_on_system_dropdown()
    MainPage.click_sign_out()

def check_location(url):
    MainPage.check_url(url)