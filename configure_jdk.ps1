$objShell = new-object -com shell.application

$namedfolder = $objShell.BrowseForFolder(0,"Please select where JDK is installed:",0,38)

echo $namedfolder.self.path

(gc C:\dev-workspace\ide\eclipseLuna\eclipse.ini) -replace "^C:.+$", $namedfolder.self.path | sc C:\dev-workspace\ide\eclipseLuna\eclipse.ini