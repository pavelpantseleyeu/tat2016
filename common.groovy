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
    def propsFile = readFile filePath
    print propsFile
    def slurper = new groovy.json.JsonSlurper()
    def result = slurper.parseText(propsFile)
    print result
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
