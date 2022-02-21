# the compiler must be clang++    (default)
# and the linker must be link.exe (default)
echo "##########################################"
echo "configuring directories"
echo "##########################################"
Remove-Item builddir-MSVC-link -Recurse -Force -Confirm:$false > $null
mkdir builddir-MSVC-link > $null
mkdir builddir-MSVC-link/libHello > $null
echo "##########################################"
echo "Compiling..."
echo "##########################################"
# we need to use clang in order to reproduce the issue
# by default we will use MSVC link, also we cannot specify the linker with MSVC
meson builddir-MSVC-link
# this will give LNK1107, as the static library was generated with T(--thin)
# MSVC link.exe does not support static thin libraries
meson compile -C builddir-MSVC-link
