
def getJson(filePath){
    def input = readFile filePath
    def slurper = new groovy.json.JsonSlurper()
    def text = slurper.parseText(input)
    return text
}


return this
