def _getProperties(filePath) {
    def propsFile = readFile filePath
    propsFile = propsFile.replace(':', '=').replace('  ','').replace('    ','').replace('-','').replace(' ','')
    def props = new Properties()
    props.load(new StringReader(propsFile))
    return props
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
