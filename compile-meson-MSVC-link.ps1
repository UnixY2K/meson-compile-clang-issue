## check if CXX and CXX_LD are set and unset them
if (Test-Path Env:\CXX) {
    echo "unset the CXX variable"
    Remove-Item Env:\CXX
}
if (Test-Path Env:\CXX_LD) {
    echo "unset the CXX_LD variable"
    Remove-Item Env:\CXX_LD
}
# the compiler must be clang++    (default)
# and the linker must be link.exe (default)
# to do so install on a clean machine VS(Ex: VS2022) and then llvm
# if you install another toolchain this might not work
echo "##########################################"
echo "configuring directories"
echo "##########################################"
$Folder = 'builddir-MSVC-link'
if (Test-Path -Path $Folder) {
    Remove-Item $Folder -Recurse -Force -Confirm:$false
    mkdir $Folder > $null
    mkdir $Folder/libHello > $null
}
echo "##########################################"
echo "Compiling..."
echo "##########################################"
# by default it will use clang++/link.exe(MSVC)
meson setup $Folder --backend ninja
# this will give LNK1107, as the static library was generated with T(--thin)
# MSVC link.exe does not support static thin libraries
meson compile -C $Folder
## Unset Environment Variables
