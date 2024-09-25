void main() {
// Langkah 1 dan 2

  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);
  //
  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

// Langkah 3

  final List<String?> list = List.filled(5, null);
  list[1] = "Muhammad Khairunnas Nurdin";
  list[2] = "2241720133";

  assert(list.length == 5);
  assert(list[1] == "Muhammad Khairunnas Nurdin");
  assert(list[2] == "2241720133");

  print(list.length);
  print(list[1]);
  print(list[2]);
}