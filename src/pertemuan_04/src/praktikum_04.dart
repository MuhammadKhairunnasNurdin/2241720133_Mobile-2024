void main() {
// Langkah 1 dan 2

  // var list = [1, 2, 3];
  // var list2 = [0, ...list];
  // print(list);
  // print(list2);
  // print(list2.length);

//   Langkah 3

  // var list1 = [1, 2, null, '2241720133'];
  // print(list1);
  // var list3 = [0, ...?list1];
  // print(list3.length);

// Langkah 4

  // bool promoActive = false;
  //
  // var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  // print(nav);

//   Langkah 5

  // var login = 'Manager';
  //
  // var nav2 = [
  //   'Home',
  //   'Furniture',
  //   'Plants',
  //   if (login == 'Manager') 'Inventory'
  // ];
  // print(nav2);

//   Langkah 6

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}