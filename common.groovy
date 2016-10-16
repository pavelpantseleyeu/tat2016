
def getJson(filePath){
    def input = new FileReader(filePath)
    return new groovy.json.JsonSlurper().parseText(input)
}


return this
