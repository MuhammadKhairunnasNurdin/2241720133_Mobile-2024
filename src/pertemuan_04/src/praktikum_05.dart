void main() {
//   Langkah 1

  // var record = ('first', a: 2, b: true, 'last');
  // print(record);

  // var record = {'first': 'first', 'a': 2, 'b': true, 'last': 'last'};
  // print('before move: $record');
  //
  // var result = move(record);
  // print('after move: $result');

// Langkah 3

  // Map<String, dynamic> move(Map<String, dynamic> record) {
  //   var temp = record['a'];
  //   record['a'] = record['b'];
  //   record['b'] = temp;
  //
  //   return record;
  // }

  // (int, int) tukar((int, int) record) {
  //   var (a, b) = record;
  //   return (b, a);
  // }


//   Langkah 4

  // (String, int) mahasiswa = ('Muhammad Khairunnas Nurdin', 2241720133);
  // print(mahasiswa);

//   Langkah 5

  // var mahasiswa2 = ('first', a: 2, b: true, 'last');
  //
  // print(mahasiswa2.$1); // Prints 'first'
  // print(mahasiswa2.a); // Prints 2
  // print(mahasiswa2.b); // Prints true
  // print(mahasiswa2.$2); // Prints 'last'

  var mahasiswa2 = ('first', 'Muhammad Khairunnas Nurdin', '2241720133', b: true, 'last');

  print(mahasiswa2.$1);
  print(mahasiswa2.$2);
  print(mahasiswa2.$3);
  print(mahasiswa2.b);
  print(mahasiswa2.$4);
}