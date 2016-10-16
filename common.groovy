def _getProperties(filePath) {
    def propsFile = readFile filePath
    propsFile = propsFile.replace(':', '=').replace('  ','').replace('    ','').replace('-','').replace(' ','')
    def props = new Properties()
    props.load(new StringReader(propsFile))
    return props
}

def getProps(filePath){
    def input = readFile filePath
    def yaml = new org.yaml.snakeyaml.Yaml()
    return yaml.load(input)
}

return this
