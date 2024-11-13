# Mobile Week-11

# Tugas Praktikum 1: Dasar State dengan Model-View

### 1. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

```Dart
export 'plan.dart';
export 'task.dart';
```

Dengan melakukan ekspor model seperti hal tersebut, kita bisa mengimpor kelas, fungsi, atau konstanta dari file plan.dart dan task.dart dengan cara yang lebih sederhana. Jadi tidak perlu mengimpor setiap file satu per satu.

### 2. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

```Dart
Plan plan = const Plan();
```

Objek `plan` digunakan sebagai instance dari kelas `Plan`, yang diinisialisasi sekali sebagai `const`. Karena bersifat `const`, menyatakan bahwa `Plan` adalah objek immutable dan tidak akan berubah selama siklus hidup widget `PlanScreen`.

### 3. jelaskan apa yang telah Anda buat!


Pada langkah 9 ini setelah melakukan praktikum sebelumnya, saya mendapatkan sebuah hasil yaitu aplikasi todo list, dimana terdapat sebuah AppBar dengan title "Master Plan Vunky Himawan", dan terdapat sebuah listView dengan item task yang di-render berdasarkan data yang ada berdasarkan instance dari kelas Plan dan bisa ditambahkan dengan menekan tombol di kanan bawah, serta bisa menandai task yang sudah di-complete dengan menekan tombol check.

### 4. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state?

```Dart
@override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(
        () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
      );
  }
```

- `initState()` dipanggil satu kali ketika State objek dibuat, yaitu saat widget `PlanScreen` pertama kali dimuat. Ini adalah tempat untuk melakukan inisialisasi awal data yang akan digunakan oleh widget.
- Pada langkah 11, `initState()` digunakan untuk membuat ScrollController dan menetapkan listener ke controller tersebut.
- Listener pada `ScrollController` akan membuat `FocusScope.of(context).requestFocus(FocusNode());` setiap kali pengguna melakukan scroll. Kode ini berguna untuk menghilangkan fokus dari widget input, yang membuat keyboard tertutup ketika pengguna melakukan scrolling.

```Dart
@override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
```

- `dispose()` adalah metode terakhir yang dipanggil sebelum objek `State` dihapus dari memori. `dispose()` merupakan sebuah fungsi untuk membersihkan atau menghapus data-data seperti controller, stream, atau listener yang dibuat sebelumnya.
- Pada langkah 13, `scrollController.dispose();` digunakan untuk menghapus controller dan membersihkan memori yang digunakan. Jika `dispose()` tidak dipanggil, akan terjadi kebocoran memori (memory leak), karena `scrollController` tetap berada di memori meskipun tidak lagi digunakan.


# Tugas Praktikum 2: InheritedWidget

### 1. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

```Dart
import 'package:flutter/material.dart';
import '../models/data_layer.dart';

class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  const PlanProvider(
      {super.key,
      required super.child,
      required ValueNotifier<Plan> super.notifier});

  static ValueNotifier<Plan> of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<PlanProvider>()!
        .notifier!;
  }
}
```

`PlanProvider` menggunakan `InheritedNotifier`, dimana `InheritedNotifier` merupakan kombinasi antara `InheritedWidget` dan `ChangeNotifier`. Pada Flutter, `InheritedWidget` digunakan untuk membuat data yang bisa diakses di seluruh widget tree tanpa harus melewati data tersebut melalui constructor secara manual dari satu widget ke widget lainnya.

Mengapa yang digunakan `InheritedNotifier`? Karena InheritedWidget memungkinkan `PlanProvider` menyebarkan data secara efisien dan terstruktur di seluruh widget tree, dengan `InheritedNotifier` menambahkan kemampuan untuk mendeteksi perubahan secara otomatis.

### 2. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

```Dart
import 'package:master_plan/models/task.dart';

class Plan {
  final String name;
  final List<Task> tasks;

  Plan({this.name = '', this.tasks = const []});

  int get completedCount => tasks.where((task) => task.complete).length;

  String get completenessMessage =>
      '$completedCount out of ${tasks.length} tasks';
}
```

Method `completedCount` digunakan untuk mendapatkan jumlah tugas yang selesai tanpa perlu membuat variabel tambahan. `tasks.where((task) => task.complete)` menggunakan filter `where` untuk mendapatkan daftar tugas yang sudah selesai (memiliki properti complete yang bernilai true). `.length` kemudian menghitung jumlah elemen dari daftar tugas yang sudah difilter. Hasil akhirnya adalah jumlah tugas yang selesai, yang diakses melalui completedCount.

Method `completenessMessage` digunakan untuk pengelolaan pesan status, membuat pesan secara dinamis berdasarkan kondisi tasks, method ini menggunakan `completedCount` untuk mengambil jumlah tugas yang selesai dan tasks.length untuk menghitung total tugas, lalu menggabungkannya dalam sebuah string.

### 3. jelaskan apa yang telah Anda buat!

Pada praktikum ini, saya memperbaiki aplikasi pada praktikum 1 yaitu aplikasi todo list hanya saja pada praktikum ini diterapkan `Provider` untuk menyimpan dan mengelola data. Pada praktikum ini menggunakan `ChangeNotifier` sebagai penyimpan data yang dapat memberi `notif` ketika terjadi perubahan, serta `ChangeNotifierProvider` untuk menyebarkan data tersebut ke seluruh widget. Dalam implementasi ini, menggunakan `InheritedNotifier` sebagai penyebaran data ke widget lain. Data yang disimpan dalam `Provider` dapat diakses dan ditampilkan di widget melalui `InheritedWidget` sehingga widget dapat berlangganan dan bereaksi terhadap perubahan data tanpa harus melewati data melalui constructor widget.


# Tugas Praktikum 3: State di Multiple Screens

### 1. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!

![diagram](/docs/pertemuan-11/diagram-tugas-praktikum-3.png)

**Diagram Kiri: `PlanCreatorScreen`**

Di sisi kiri, diagram menunjukkan struktur widget pada layar PlanCreatorScreen:

- `MaterialApp`: Widget utama aplikasi yang menyediakan tema dan konfigurasi dasar.
- `PlanProvider`: Provider yang digunakan untuk menyimpan dan mengelola data Plan secara global melalui ValueNotifier.
- `PlanCreatorScreen`: Layar utama yang digunakan oleh pengguna untuk menambahkan plan baru. Di dalamnya, ada: 
  - `Column`: Menyusun elemen secara vertikal, yaitu `_buildListCreator()` untuk input teks, dan `_buildMasterPlans()` untuk menampilkan daftar plan.
  - `TextField`: Input teks untuk menambahkan nama plan.
  - `Expanded`: Menampung `ListView` agar dapat menyesuaikan ruang yang tersisa.
  - `ListView`: Menampilkan daftar Plan yang telah ditambahkan. Setiap item dalam `ListView` adalah sebuah `ListTile` yang dapat tekan untuk berpindah ke layar `PlanScreen` untuk melihat detail plan.

**Navigasi Antar Layar**

Navigasi antar layar dilakukan dengan Navigator.push. Saat pengguna menekan salah satu item di `ListView` pada `PlanCreatorScreen`, aplikasi akan memanggil `Navigator.push` untuk berpindah ke `PlanScreen`. Di `PlanScreen`, pengguna dapat melihat dan mengelola tugas-tugas dari plan yang dipilih. 

**Diagram Kanan: `PlanScreen`**

Di sisi kanan, diagram menunjukkan struktur widget pada layar `PlanScreen` yang ditampilkan setelah navigasi dilakukan.

- `MaterialApp`: Menjadi root dari aplikasi.
- `PlanScreen`: Layar detail untuk plan yang dipilih, yang diakses setelah pengguna menekan salah satu item di ListView di `PlanCreatorScreen`.
- `Scaffold`: Memberikan struktur dasar layar `PlanScreen`, dengan `AppBar`, `body`, dan `FloatingActionButton`.
- `Column`: Menyusun widget secara vertikal untuk menampilkan daftar tugas `_buildList` dan informasi status.
- `Expanded`: Menampung `ListView` yang berisi daftar tugas agar dapat menyesuaikan ruang yang tersedia di layar.
- `SafeArea`: Membungkus Text di bagian bawah untuk memastikan teks tidak terpotong di area tertentu, seperti notch pada perangkat.
- `Text`: Menampilkan pesan yang menunjukkan status penyelesaian dari plan saat ini.

### 3. Lakukan capture hasil dari Langkah 14 berupa GIF, kemudian jelaskan apa yang telah Anda buat!

![Hasil Akhir](image/final_result.png)