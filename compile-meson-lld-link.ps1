echo "##########################################"
echo "configuring directories"
echo "##########################################"
$Folder = 'builddir-lld-link'
if (Test-Path -Path $Folder) {
    Remove-Item $Folder -Recurse -Force -Confirm:$false > $null
    mkdir $Folder > $null
    mkdir $Folder/libHello > $null
}
echo "##########################################"
echo "Compiling..."
echo "##########################################"
## Set Environment Variables
echo "set the CXX to clang++"
$env:CXX="clang++"
echo "set the CXX_LD to lld-link"
$env:CXX_LD = 'lld-link'
meson setup $Folder --backend ninja
meson compile -C $Folder
## Unset Environment Variables
echo "unset the CXX_LD variable"
Remove-Item Env:\CXX_LD
echo "unset the CXX variable"
Remove-Item Env:\CXX
