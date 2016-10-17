def removeImage(fullImgName){
    _docker("rmi ${fullImgName}")
}

def buildImage(fullImgName, dockerfile, path){
    _docker("build --file=${path}/${dockerfile} --no-cache=true --rm=true --tag=\"${fullImgName}\" ${path}")
}

def pushImage(fullImgName){
    _docker("push ${fullImgName}")
}

def stopContainer(name){
    _docker("stop ${name}")
}

def startContainer(name){
    _docker("start ${name}")
    sleep (9)
}

def restartContainer(name){
    _docker("stop ${name}")
    _docker("start ${name}")
    sleep (9)
}

def removeContainer(name){
    _docker("rm -v ${name}")
}

def runAn(port, name, img){
    def com = "run -d -p ${port}:10010 --name=\"${name}\" ${img}"
    _docker(com)
    sleep (9)
}

def _getImgName(container, tag){
    def registry = "docker-registry.clarabridge.net:5000/cb_aqa_ci/"
    return registry + container + ":" + tag
}

def _docker(command){
    try {
        sh "sudo docker ${command}"
    }
    catch (err) {
        println err
    }
}

return this