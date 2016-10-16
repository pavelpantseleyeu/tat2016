
def getProps(filePath){
    def input = readFile filePath
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

return this
