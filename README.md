# Meson compile clang issue

this repo is a minimal example to reproduce a bug in windows related to the support of thin libraries support in windows, as for the moment this issue is affected when using `clang++` and `link.exe` as compiler and linked respectively.

## Steps to reproduce

1. Clone the repo
2. run `compile-meson-MSVC.bat` to compile the project, keep in mind that you need both `clang++` and msvc installed in your system, in addition you will need `ninja` which is asumed to be in your path.

you may also run `compile-meson-lld-link.ps1` to compile the project using `lld-link` instead of `link.exe`, this will work as expected.

## known workarounds

as for the time this issue has been verified to fail `0.60.1` to `1.0.0`

1. this was fixed in `0.60.1` but not ported to `0.61.1+` so you can use `0.60.1` to compile the project, you can install it by using pip like this: `pip install meson==0.60.1`
2. manually set both `CXX` and `CXX_LD` to `clang++` and `lld-link` respectively, this will work as expected.

if you know any other workaround feel free to open a PR.
