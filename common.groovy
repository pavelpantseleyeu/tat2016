def _getProperties(filePath) {
    def propsFile = readFile filePath
    propsFile = propsFile.replace(':', '=').replace('  ','').replace('    ','').replace('-','').replace(' ','')
    def props = new Properties()
    props.load(new StringReader(propsFile))
    return props
}

def getFile(version){
    def fileName = null
    def rootUrl = "http://d5-d01-dev01.clarabridge.net:18081/content/groups/public/clarabridge-analytics-server/"
    if (!version){
        version = _getVersion(rootUrl)
    }
    fileName = _getFileByPattern(rootUrl, version, '.jar')
    println fileName
    dir(source) {
        timeout(time:30, unit:'MINUTES') {
        waitUntil {
            try{
                sh "find . -name \"*.jar\" -type f -delete"
                sh "curl -O ${rootUrl}${version}/${fileName}"
                sh "chmod 777 ${fileName}"
                return true
                }
                catch (err) {
                    println err
                    return false
                }
            }
        }
    }
    println fileName
    return fileName
}

def _getFileByPattern(url, version, pattern){
    println url
    println version
    println pattern
    def collection = _getHttpResponse(url + version)
    print collection
    for (int i=0; i<collection.size(); i++){
        def file = collection[i].text()
        if (file == 'clarabridge-analytics-server-' + version + pattern) {
            return file
        }
    }
}

def _getVersion(rootUrl){
    def rows = _getHttpResponse(rootUrl)
    return _getLatestVersion(rows)
}

def _getHttpResponse(url){
    def response = httpRequest url
    def stripped = response.content.replaceAll('(?<=link)(.*)(?=>)','').replaceAll('<link>','').replaceAll('&nbsp;','')
    return new XmlSlurper().parseText(stripped).body.table.tr.td.a
}

def _getLatestVersion(collection){
    def versions = new ArrayList()
    for (int i=0; i<collection.size(); i++){
        def ver = collection[i].text().replace('/','')
        if (ver != 'Parent Directory') {
            versions << [ver.replace('.','').toInteger(), ver]
        }
    }
    return versions.sort().last().last()
}

def setFileNameInDockerfile(dockerfilePath, fileName){
    def df = readFile(dockerfilePath)
    df = df.replace("${fileName}", fileName)
    writeFile file: dockerfilePath, text: df
}

return this