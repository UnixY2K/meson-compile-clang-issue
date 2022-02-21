echo "##########################################"
echo "configuring directories"
echo "##########################################"
Remove-Item builddir-lld-link -Recurse -Force -Confirm:$false > $null
mkdir builddir-lld-link > $null
mkdir builddir-lld-link/libHello > $null
echo "##########################################"
echo "Compiling..."
echo "##########################################"
## Set Environment Variables
echo "set the CXX to clang++"
$env:CXX="clang++"
echo "set the CXX_LD to lld-link"
$env:CXX_LD = 'lld-link'
meson builddir-lld-link
meson compile -C builddir-lld-link
## Unset Environment Variables
echo "unset the CXX_LD variable"
Remove-Item Env:\CXX_LD
echo "unset the CXX variable"
Remove-Item Env:\CXX
