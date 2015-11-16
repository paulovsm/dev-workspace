$docker_installer_source = "https://github.com/docker/toolbox/releases/download/v1.9.0b/DockerToolbox-1.9.0b.exe"
$docker_installer_destination = "DockerToolbox-1.9.0b.exe"

If ( -Not (Test-Path -Path $docker_installer_destination) ) {
    Invoke-WebRequest $docker_installer_source -OutFile $docker_installer_destination 
} Else {
    "$docker_installer_destination já existe"
}

If ( -Not (Test-Path -Path "${env:ProgramFiles(x86)}\Docker Toolbox") ) {
    & ./${docker_installer_destination} /silent
} Else {
    "$docker_installer_destination já instalado"
}
