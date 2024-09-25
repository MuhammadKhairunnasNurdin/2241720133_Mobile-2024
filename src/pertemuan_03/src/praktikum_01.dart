void main() {
  // langkah_01();
  langkah_03();
}

void langkah_01() {
  // code that wrong
  /*String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else If (test == "test2") {
    print("Test2");
  } Else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");*/

  // code that right
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") print("Test2 again");
}

void langkah_03() {
  // code that wrong
  /*String test = "true";
  if (test) {
    print("Kebenaran");
  }*/

  // code that right
  bool test = true;
  if (test) {
    print("Kebenaran");
  }

}