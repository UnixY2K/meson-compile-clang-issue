echo "##################################"
echo "configuring directories"
echo "##################################"
Remove-Item build_manual -Recurse -Force -Confirm:$false > $null
mkdir build_manual > $null
mkdir build_manual/libHello > $null
echo "##################################"
echo "Compiling..."
echo "##################################"
echo "hello.cpp -> hello.o"
clang++ ./source/src/hello.cpp -o ./build_manual/libHello/hello.o -I ./source/include/ -c
echo "printString.cpp -> printString.o"
clang++ ./source/src/printString.cpp -o ./build_manual/libHello/printString.o -I ./source/include/ -c
echo "libhello/[hello, printString].o -> libHello.a"
llvm-ar csrDT ./build_manual/libHello.a ./build_manual/libHello/hello.o ./build_manual/libHello/printString.o
echo "source.cpp -> source.o"
clang++ -c -o ./build_manual/source.o ./test/source.cpp -I ./source/include/
echo "[source.o, libHello.a] -> source(exe)"
clang++ -fuse-ld=lld-link ./build_manual/libHello.a ./build_manual/source.o -o ./build_manual/source.exe
echo "Compile success"
echo "##################################"
echo "run ./build_manual/source.exe"
echo "##################################"
./build_manual/source.exe