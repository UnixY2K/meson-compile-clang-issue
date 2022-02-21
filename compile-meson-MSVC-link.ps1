# the compiler must be clang++    (default)
# and the linker must be link.exe (default)
echo "##########################################"
echo "configuring directories"
echo "##########################################"
$Folder = 'builddir-MSVC-link'
if (Test-Path -Path $Folder) {
    Remove-Item $Folder -Recurse -Force -Confirm:$false > $null
    mkdir $Folder > $null
    mkdir $Folder/libHello > $null
}
mkdir $Folder > $null
mkdir $Folder/libHello > $null
echo "##########################################"
echo "Compiling..."
echo "##########################################"
# we need to use clang in order to reproduce the issue
# by default we will use MSVC link, also we cannot specify the linker with MSVC
meson $Folder
# this will give LNK1107, as the static library was generated with T(--thin)
# MSVC link.exe does not support static thin libraries
meson compile -C $Folder
