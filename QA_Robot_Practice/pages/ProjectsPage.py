from pages.BasePage import driver as driver

PROJECT_TABLE_LOCATOR =  "//table[@class='pagingTable-body dataTable']"

def get_project_table():
    return driver.get_webelement(PROJECT_TABLE_LOCATOR)