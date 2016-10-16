def getProps(filePath){
    @Grab(group='org.yaml', module='snakeyaml', version='1.13')
    def yaml = new org.yaml.snakeyaml.Yaml()
    def propsFile = readFile filePath
    println propsFile
    return yaml.load(propsFile)
}

return this
