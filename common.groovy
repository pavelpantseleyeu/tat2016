
def getProps(filePath){
    def input = new FileInputStream(new File(filePath));
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

return this
