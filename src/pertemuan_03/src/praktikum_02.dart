void main() {
  // langkah_01();
  langkah_03();
}

void langkah_01() {
  // code that wrong
  /*while(counter < 33) {
    print(counter);
    counter++;
  }*/

  // code that right
  int counter = 1;
  while(counter < 33) {
    print(counter);
    counter++;
  }
}

void langkah_03() {
  // code that wrong
  /*do {
    print(counter);
    counter++;
  } while (counter < 77);*/

  // code that right
  int counter = 0;
  do {
    print(counter);
    counter++;
  } while (counter < 77);
}