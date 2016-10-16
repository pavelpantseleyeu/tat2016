
def getProps(filePath){
    def input = new FileReader(filePath);
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

return this
