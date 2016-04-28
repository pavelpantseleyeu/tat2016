from pages import ProjectsPage
from libraries.WebTable import WebTable

def parse_table():
   WebTable(ProjectsPage.get_project_table()).log("Table")
   tempFile = open('File.txt', 'w')
   tempFile.writelines(WebTable(ProjectsPage.get_project_table())._get_table_as_string())
   tempFile.close()