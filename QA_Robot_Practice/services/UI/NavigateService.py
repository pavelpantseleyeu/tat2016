from pages import NavigatorPage

def go_to_projects_page():
    NavigatorPage.click_on_logo()

def sign_out():
    NavigatorPage.click_on_system_dropdown()
    NavigatorPage.click_sign_out()