# Pemrograman Mobile - Pertemuan_12

# Praktikum 1: Dart Streams

## Soal 

`yield*` merupakan cara metode menggabungkan `stream` lain ke dalam `stream` yang sedang kita buat, dimana semua nilai dari `stream` yang lain akan langsung diteruskan ke `stream` utama.

Menggunakan `yield*` berarti kita tidak perlu memproses setiap nilai yang dihasilkan oleh `Stream.periodic` secara manual. Semua nilai yang dihasilkan oleh `Stream.periodic` langsung diteruskan ke aliran (stream) `getColors`. Hasilnya adalah warna (dari daftar colors) yang terus-menerus mengalir setiap detik.

## Soal 

```dart
void changeColor() async {
    colorStream.getColors().listen(
      (eventColor) {
        setState(
          () {
            bgColor = eventColor;
          },
        );
      },
    );
  }
```

**listen**

`listen` merupakan sebuah method `stream` yang memungkinkan kita "mendengarkan" setiap data baru yang masuk. Dengan menggunakan `listen` kita bisa memberikan method `(callback)` ke `listen`, yang akan dipanggil setiap kali ada data baru pada stream.

Manfaat dari `listen` adalah:

- Tidak menghentikan kode lainnya (berjalan secara paralel/asinkron). Langsung bereaksi setiap kali data diterima.
- Tidak menunggu sampai semua data selesai diterima. Kita hanya terus mendengarkan aliran data.

**await for**

```dart
void changeColor() async {
    await for (var eventColor in colorStream.getColors()) {
      setState(
        () {
          bgColor = eventColor;
        },
      );
    }
  }
```

`await for` adalah cara `asinkron` untuk menunggu setiap data baru pada `stream`, satu per satu. Dimana ketika ada data baru, `await for` berhenti sementara untuk memproses data tersebut sebelum lanjut ke data berikutnya. Dimana prosesnya yaitu menunggu data baru dari `stream`. Lalu menjalankan blok kode di dalam `await for`. Diulangi untuk data berikutnya hingga `stream` selesai.

# Praktikum 2: Stream controllers dan sinks

Langkah 8

```dart
@override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen(
      (event) {
        setState(
          () {
            lastNumber = event;
          },
        );
      },
    );
  }
```

Langkah 10

```dart
void addRandomNumber() {
    Random random = Random();
    int myNum = random.nextInt(10);
    numberStream.addNumber(myNum);
  }
```

Ketika aplikasi mulai dijalankan `initState` membuat stream mengambil controllernya, dan mulai mendengarkan data baru. Kemudian UI disiapkan untuk menampilkan data dari `lastNumber`.

Ketika fungsi `addRandomNumber` dipanggil angka acak dihasilkan dan ditambahkan ke `stream` melalui `numberStream.addNumber`. Stream menghasilkan sebuah event, sehingga listener `(stream.listen)` menerima angka baru.

Listener menjalankan `setState` untuk memperbarui `lastNumber` dengan angka baru. Flutter kemudian memperbarui UI untuk menampilkan angka tersebut.

## Soal 

Langkah 13

```dart
addError() {
    controller.sink.addError('error');
  }
```

Langkah 14

```dart
@override
  void initState() {
    super.initState();
    numberStream = NumberStream();
    numberStreamController = numberStream.controller;
    Stream stream = numberStreamController.stream;
    stream.listen((event) {
      setState(() {
        lastNumber = event;
      });
    }).onError((error) {
      setState(() {
        lastNumber = 0;
      });
    });
  }
```

Langkah 15

```dart
void addRandomNumber() {
    Random random = Random();
    // int myNum = random.nextInt(10);
    // numberStream.addNumber(myNum);
    numberStream.addError();
  }
```

Ketika aplikasi mulai dijalankan `initState` membuat stream dan mendengarkannya. Kemudian listener siap mengolah data biasa atau error.

Ketika `addRandomNumber` dijalankan fungsi ini mengirimkan error ke stream dengan `numberStream.addError()`.

Listener pada Stream, `callback` data biasa tidak dipanggil karena yang dikirim adalah error. Callback error (onError) dipanggil, dan UI diperbarui dengan `lastNumber = 0`.

# Praktikum 3: Injeksi data ke streams

## Soal 

Pertama saat aplikasi mulai dijalankan `initState` menginisialisasi stream dan transformer. Stream dihubungkan ke transformer, sehingga semua data dan error yang masuk diproses terlebih dahulu.

Ketika data dikirim ke `Stream`, jika datanya bukan error / data biasa maka data akan dimodifikasi oleh transformer untuk dikalikan 10, Kemudian listener menerima data hasil transformasi dan memperbarui UI. Jika datanya merupakan error, transformer akan mengubah error menjadi nilai -1, lalu listener menerima nilai -1 sebagai data biasa.

# Praktikum 4: Subscribe ke stream events

## Soal 

Ketika aplikasi mulai dijalankan `initState` membuat stream dan listener. Listener akan memperbarui nilai `lastNumber` setiap kali ada data baru di stream.

Ketika angka random ditambahkan `addRandomNumber` menambahkan angka ke stream jika controller belum ditutup. Jika controller sudah ditutup, lastNumber diperbarui menjadi -1.

Terakhir ketika `dispose` dipanggil untuk membatalkan langganan, ini digunakan untuk mencegah aplikasi mendengarkan stream yang tidak diperlukan lagi.

# Praktikum 5: Multiple stream subscriptions

## Soal 

Error tersebut terjadi karena aliran `Stream` yang digunakan bersifat single-subscription, yang berarti hanya dapat didengarkan listen oleh satu subscriber pada satu waktu.

## Soal

Ketika kita menggunakan `asBroadcastStream()` untuk mengubah stream menjadi broadcast stream, setiap listener yang subscribe akan menerima semua data dari stream. Dengan kata lain, kedua listener akan menerima event yang sama.

# Praktikum 6: StreamBuilder

## Soal 

Langkah 3

```dart
import 'dart:math';

class NumberStream {
  Stream<int> getNumbers() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      Random random = Random();
      int myNum = random.nextInt(10);
      return myNum;
    });
  }
}
```

Pada fungsi `getNumbers()` menggunakan `Stream.periodic` dimana fungsi ini menghasilkan data secara berkala, dalam praktikum ini setiap 1 detik. Pada setiap periode, fungsi memanggil logika berikut:

- Membuat sebuah objek random menggunakan `Random()`.
- Menghasilkan angka acak antara 0 hingga 9 menggunakan `random.nextInt(10)`.
- Mengembalikan angka tersebut sebagai bagian dari aliran data (stream).

`yield*` digunakan untuk "mengalirkan" data dari `Stream.periodic` ke komponen lain yang akan membaca data tersebut.

Langkah 7

```dart
body: StreamBuilder(
        stream: numberStream,
        initialData: 0,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("error");
          }
          if (snapshot.hasData) {
            return Center(
              child: Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 96),
              ),
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
```

`StreamBuilder` merupakan komponen Flutter yang digunakan untuk "mendengarkan" aliran data (stream) dan memperbarui tampilan secara otomatis setiap kali ada data baru yang dihasilkan. Pada `StreamBuilder` terdapat tiga parameter yaitu

1. `stream`: Menghubungkan aliran data pada praktikum ini menggunakan `NumberStream`.
2. `initialData`: Memberikan nilai awal yang akan ditampilkan sebelum stream menghasilkan data, yaitu pada praktikum ini diberikan angka 0.
3. `builder` Fungsi ini dipanggil setiap kali ada data baru dalam aliran. pada fungsi ini terdapat dua parameter yaitu `context` dan `snapshot`, dimana snapsot merupakan objek yang berisi data terbaru dari stream. Pada praktikum ini terdapat tiga kemungkinan data yang bisa didapatkan dari snapshot:

- Jika ada error, menampilkan pesan error (di sini hanya mencetak ke konsol).
- Jika ada data (snapshot.hasData), menampilkan angka terbaru di tengah layar dengan ukuran teks yang besar (fontSize: 96).
- Jika tidak ada data, tidak menampilkan apa-apa (SizedBox.shrink).

# Praktikum 7: BLoC Pattern

## Soal

Praktikum ini bertujuan untuk mengimplementasikan pola arsitektur BLoC (Business Logic Component) dalam Flutter untuk memisahkan logika bisnis dari tampilan UI. Dengan cara ini, aplikasi menjadi lebih modular, dapat diuji dengan lebih mudah, dan mudah untuk dikembangkan.

Dimana BLoC diterapkan pada praktikum ini:

- Logika bisnis ada di class RandomNumberBloc, yang bertugas menerima event, memproses data (angka acak), dan mengalirkan state ke UI.
- UI hanya mendengarkan perubahan state dari stream (StreamBuilder) dan memperbarui tampilan secara otomatis, tanpa perlu mengetahui detail logika bisnis.
