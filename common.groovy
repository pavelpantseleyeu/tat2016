
def getProps(filePath){
    def input = new FileInputStream(new File(filePath));
    def yaml = new org.yaml.snakeyaml.Yaml()
//    def propsFile = readFile filePath
//    println propsFile
    return yaml.load(input)
}

return this
