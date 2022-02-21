echo "##################################"
echo "configuring directories"
echo "##################################"
$Folder = 'build_manual'
if (Test-Path -Path $Folder) {
    Remove-Item $Folder -Recurse -Force -Confirm:$false > $null
    mkdir $Folder > $null
    mkdir $Folder/libHello > $null
}
echo "##################################"
echo "Compiling..."
echo "##################################"
echo "hello.cpp -> hello.o"
clang++ ./source/src/hello.cpp -o ./$Folder/libHello/hello.o -I ./source/include/ -c
echo "printString.cpp -> printString.o"
clang++ ./source/src/printString.cpp -o ./$Folder/libHello/printString.o -I ./source/include/ -c
echo "libhello/[hello, printString].o -> libHello.a"
llvm-ar csrDT ./$Folder/libHello.a ./$Folder/libHello/hello.o ./$Folder/libHello/printString.o
echo "source.cpp -> source.o"
clang++ -c -o ./$Folder/source.o ./test/source.cpp -I ./source/include/
echo "[source.o, libHello.a] -> source(exe)"
clang++ -fuse-ld=lld-link ./$Folder/libHello.a ./$Folder/source.o -o ./$Folder/source.exe
echo "Compile success"