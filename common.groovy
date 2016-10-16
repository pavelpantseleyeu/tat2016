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


def readProps(filePath){
    def yaml = new org.yaml.snakeyaml.Yaml()
    def propsFile = readFile filePath
    def pr = yaml.load(propsFile)
    return yaml.dump(pr, default_flow_style=False)
}

@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
