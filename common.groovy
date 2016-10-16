
def getJson(filePath){
    def input = new FileReader(filePath)
    return new JsonSlurper().parseText(inputFile)
}


return this
