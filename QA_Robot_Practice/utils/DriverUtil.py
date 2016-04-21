from selenium import webdriver

driver = webdriver.Firefox()

def get_driver():
    return driver

def close_browser():
    driver.close()