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
    DumperOptions options = new DumperOptions()
    options.setPrettyFlow(true)
    options.setDefaultFlowStyle(DumperOptions.FlowStyle.BLOCK)
    yaml = new org.yaml.snakeyaml.Yaml(options)

    def propsFile = readFile file
    def map = yaml.load(propsFile)
    map[prop] = value
    map = yaml.dump(map)
    yaml.dump(map, new FileWriter(file))

    return map
}


@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
