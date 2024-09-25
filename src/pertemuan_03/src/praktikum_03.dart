void main() {
  // langkah_01();
  langkah_03();
}

void langkah_01() {
  // code that wrong
  /*for (Index = 10; index < 27; index) {
    print(Index);
  }*/

  // code that right
  for (int index = 10; index < 27; index++) {
    print(index);
  }
}

void langkah_03() {
  for (int index = 0; index < 27; index++) {
    // code that wrong
    /*if (Index == 21) break;
    Else If (index > 1 || index < 7) continue;
    print(index);*/

    // code that right
    if (index == 21) {
      break;
    }
    else if (index > 1 || index < 7) {
      continue;
    }
    print(index);
  }
}