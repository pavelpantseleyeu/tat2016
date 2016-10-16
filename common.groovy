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
    @Grab(group='org.yaml', module='snakeyaml', version='1.13')
    def yaml = new Yaml()
    yaml.load(propsFile)
    def propsFile = readFile filePath
    print propsFile
    des pr = yaml.load(propsFile)
    print yaml.dump(pr)



//    def props = new Properties()
//    props.load(propsFile)
//    return props
}

@NonCPS
def loops(list){
    for (item in list){
        println item
    }
}

return this
