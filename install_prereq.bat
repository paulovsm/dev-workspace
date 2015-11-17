cd %userprofile%

@powershell -NoProfile -ExecutionPolicy Bypass -Command "If ( -Not (Test-Path -Path "C:\ProgramData\chocolatey") ) { iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))} Else { echo "Chocolately já instalado" }" && SET PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/paulovsm/dev-workspace/master/install_docker.ps1'))"

choco install -y putty

choco install -y 7zip.commandline

mkdir c:\dev-workspace\

@powershell -NoProfile -ExecutionPolicy Bypass -Command "If ( -Not (Test-Path -Path "c:\dev-workspace\dev-workspace.zip") ) { Invoke-WebRequest "https://github.com/paulovsm/dev-workspace/archive/master.zip" -OutFile "c:\dev-workspace\dev-workspace.zip} Else { echo "Download já realizado" }"

cd c:\dev-workspace && 7z x dev-workspace.zip && xcopy dev-workspace-master . /s /e /h && rmdir dev-workspace-master /S /Q && del dev-workspace.zip

mkdir c:\Users\Public\wls_servers\

cd c:\dev-workspace\domains\spm && copy blodes_domain.jar c:\Users\Public\wls_servers\exported_domain.jar 

cd c:\dev-workspace && copy start_container.sh c:\Users\Public\wls_servers\ && copy start_docker_tools.sh "%ProgramFiles%\Docker Toolbox\start.sh"

cd c:\dev-workspace\workspaces\spm && 7z x workspace_empty.zip && xcopy "workspace_empty - exported" . /s /e /h && rmdir "workspace_empty - exported" /S /Q && del workspace_empty.zip

cd c:\dev-workspace\ide\eclipseLuna && 7z x eclipse.7z.001 > nul && xcopy eclipse . /s /e /h && rmdir eclipse /S /Q && del eclipse.7z.001 && del eclipse.7z.002 &&  del eclipse.7z.003 &&  del eclipse.7z.004

@powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/paulovsm/dev-workspace/master/configure_jdk.ps1'))"