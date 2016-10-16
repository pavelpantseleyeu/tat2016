def _getProperties(filePath) {
    def propsFile = readFile filePath
    propsFile = propsFile.replace(':', '=').replace('  ','').replace('    ','').replace('-','').replace(' ','')
    def props = new Properties()
    props.load(new StringReader(propsFile))
    return props
}

def readProp2(path){
    def item = load(path)
    println item
}


def getProps(filePath){
    def yaml = new org.yaml.snakeyaml.Yaml()
    def propsFile = readFile filePath
    return yaml.load(propsFile)
}

def setProps(file, prop, value ){
    def yaml = new org.yaml.snakeyaml.Yaml()
    def prop = getProps(filePath)
    prop[prop] = value
    writeFile file: "filePath", text: yaml.dump(prop)
    return prop
}


@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
