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
    def props = yaml.load(propsFile)
    return yaml.dump(propsFile)
}

def setProps(file, prop, value ){
    def yaml = new org.yaml.snakeyaml.Yaml()
    def props = getProps(file)
    def proper = yaml.load(props)
    print proper
//    proper[prop] = value
    print proper
//    writeFile file: file, text: proper
    return proper
}


@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
