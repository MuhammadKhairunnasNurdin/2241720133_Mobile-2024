// required parameter
    // void greet(String name) {
    //   print('nama saya $name');
    // }
    //
    // void main() {
    //   var name = 'anas';
    //   return greet(name);
    // }

// Optional Positional Parameters
    // void greetWithOptional(String name, [int age = 21]) {
    //   print('$name berumur $age tahun.');
    // }
    //
    // void main() {
    //   var name = 'anas';
    //   return greetWithOptional(name);
    // }

// Named Parameters
    // void greetWithName(String name, {int age = 21, String country = 'Indonesia'}) {
    //   print('$name dari $country dan berumur $age tahun.');
    // }
    //
    // void main() {
    //   var name = 'anas';
    //   return greetWithName(name);
    // }

// first-class object
    // void main() {
    //   var penjumlahan = (int x, int y) => x + y;
    //
    //   print(myFunction(5, 3));
    // }

// anonymous function
//     main() {
//       var list = [1, 2, 3];
//       list.forEach((item) {
//         print(item);
//       });
//     }


// lexical scope
//     void main() {
//       var name = 'anas';
//       void printName() {
//         print(name); // Mengakses variabel 'name' dari scope luar
//       }
//       printName();
//     }

// Lexical Closures
//     Function makeAdder(int addBy) {
//       return (int i) => addBy + i;
//     }
//
//     void main() {
//       var add2 = makeAdder(2);
//       print(add2(3));
//     }


// list, record, map
    (String, int) getData() {
      return ('Anas', 21);
    }

    void main() {
      var (name, umur) = getData();
      print('Nama: $name, umur: $umur');
    }