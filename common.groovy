def _getProperties(filePath) {
    def propsFile = readFile filePath
    propsFile = propsFile.replace(':', '=').replace('  ','').replace('    ','').replace('-','').replace(' ','')
    def props = new Properties()
    props.load(new StringReader(propsFile))
    return props
}

def readProp2(filePath){
    def configFileYml = new Yaml()
    configFileYml.load(filePath)
    println configFileYml
}


def readProps(filePath){
    def props = new Properties()
    props = readProperties filePath
    return props 
}

@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
