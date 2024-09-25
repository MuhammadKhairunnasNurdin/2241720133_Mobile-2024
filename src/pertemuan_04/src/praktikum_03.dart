void main() {
// Langkah 1 dan 2

  // var gifts = {
  //   // Key:    Value
  //   'first': 'partridge',
  //   'second': 'turtledoves',
  //   'fifth': 1
  // };
  //
  // var nobleGases = {
  //   2: 'helium',
  //   10: 'neon',
  //   18: 2,
  // };
  //
  // print(gifts);
  // print(nobleGases);

//   Langkah 3

  var gifts = Map<String, String>();
  var nobleGases = Map<int, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var mhs1 = Map<String, String>();
  mhs1['nama'] = 'Muhammad Khairunnas Nurdin';
  mhs1['nim'] = '2241720133';

  var mhs2 = Map<int, String>();
  mhs2[1] = 'Muhammad Khairunnas Nurdin';
  mhs2[2] = '2241720133';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}