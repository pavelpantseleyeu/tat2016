
def getProps(filePath){
    def yaml = new org.yaml.snakeyaml.Yaml()
    def propsFile = readFile filePath
    println propsFile
    return yaml.load(propsFile)
}

return this
