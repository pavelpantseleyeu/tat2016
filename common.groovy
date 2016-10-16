
def getProps(filePath){
    def input = new FileReader(filePath)
    def InputJSON = new JsonSlurper().parseText(inputFile)
    return InputJSON
}


return this
