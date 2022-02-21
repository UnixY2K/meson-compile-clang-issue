#include <libHello.hpp>
#include <string>

int main() {
  std::string name = "World";
  std::string str = hello(name);
  printString(str);
}