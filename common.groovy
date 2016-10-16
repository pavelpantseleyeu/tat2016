
def getProps(filePath){
    def input = new FileReader(filePath)
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

def getPropertiesJson(filePath){
    def inputFile = new FileReader(filePath)
    def InputJSON = new JsonSlurper().parseText(inputFile)
    return InputJSON
}

return this
