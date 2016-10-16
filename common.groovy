
def getProps(filePath){
    def input = new FileReader(filePath)
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

def getPropJson(filePath){
    def inputFile = new File(filePath)
    def InputJSON = new JsonSlurper().parseText(inputFile)
    return InputJSON
}

return this
