import 'dart:async';

/// Transform Stream di Dart
/// Transform Stream adalah sebuah method yang mengubah nilai Stream menjadi nilai lainnya.
/// Selengkapnya tentang Transform Stream bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Stream-class.html
/// Transform Stream memiliki method yang digunakan untuk mengubah nilai Stream menjadi nilai lainnya, antara lain: map, where, expand, take, skip, takeWhile, skipWhile, distinct, handleError, timeout, transform, cast, dan toList.
/// map digunakan untuk mengubah nilai Stream menjadi nilai lainnya berdasarkan kondisi tertentu.
/// where digunakan untuk mengubah nilai Stream menjadi nilai lainnya berdasarkan kondisi tertentu.
/// expand digunakan untuk mengubah nilai Stream menjadi nilai lainnya berdasarkan kondisi tertentu dan mengembalikan nilai Stream yang berbeda.
/// take digunakan mengambil nilai Stream sebanyak jumlah tertentu.
/// skip digunakan untuk mengubah nilai Stream menjadi nilai lainnya berdasarkan kondisi tertentu.
/// takeWhile digunakan untuk mengubah nilai Stream jika kondisi bernilai true.
/// skipWhile digunakan untuk mengubah nilai Stream jika kondisi bernilai false.
/// distinct digunakan untuk mengubah nilai Stream jika nilai Stream tidak sama dengan nilai sebelumnya.
/// handleError digunakan untuk mengubah nilai Stream menjadi nilai lainnya berdasarkan kondisi tertentu jika terjadi error.
/// timeout digunakan untuk mengubah nilai Stream menjadi nilai lainnya jika Stream tidak selesai dalam durasi tertentu.
/// transform digunakan untuk mengubah nilai Stream menjadi nilai lainnya jika Stream tidak selesai dalam durasi tertentu.
/// cast digunakan untuk mengubah nilai Stream menjadi nilai lainnya jika Stream tidak selesai dalam durasi tertentu.
/// toList digunakan untuk mengubah nilai Stream menjadi nilai lainnya jika Stream tidak selesai dalam durasi tertentu.
/// Selengkapnya tentang Transform Stream bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Stream-class.html

// example transform stream map
Stream<String> getStudentName(String name){ // membuat stream getStudentName dengan tipe data string
  return Stream.value(name); // mengembalikan nilai stream dengan value name
}

Stream<int> numbers() async* { // membuat stream numbers dengan tipe data integer
  for (var i = 1; i <= 5; i++) { // for loop untuk membuat list berulang
    await Future.delayed(Duration(seconds: 1)); // await digunakan untuk menunggu future selesai
    yield i; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  }
}

void main(){
  // example transform stream map
  toUpperCase(String value) => value.toUpperCase();
  getStudentName('Dian Sastro')
      .map((value) => value.split(' ')) // split string dengan spasi menjadi list ['Dian', 'Sastro']
      .map((value) => value.first) // ambil data pertama dari list ['Dian', 'Sastro'] menjadi 'Dian'
      .map((value) => toUpperCase(value)) // ubah 'Dian' menjadi 'DIAN'
      .listen((value) => print(value)); // cetak 'DIAN'

  numbers()
      .map((value) => value * 2) // kalikan value dengan 2
      .listen((value) => print(value)); // cetak 2, 4, 6, 8, 10

  // example transform stream where
  getStudentName('Memet Alkatiri')
      .where((value) => value.contains('Memet')) // cek apakah value mengandung 'Memet'
      .listen((value) => print(value)); // cetak 'Memet Alkatiri'

  // example transform stream where stream number
  numbers()
      .where((value) => value % 2 == 0) // cek apakah value habis dibagi 2
      .listen((value) => print(value)); // cetak 2, 4


  // example transform stream expand
  getStudentName('Danu Subahri')
      .expand((value) => [value, value]) // expand value menjadi list [value, value]
      .listen((value) => print(value)); // cetak 'Danu Subahri Danu Subahri'

  // example transform stream expand stream number
  numbers()
      .expand((value) => [value, value]) // expand value menjadi list [value, value]
      .listen((value) => print(value)); // cetak 1, 1, 2, 2, 3, 3, 4, 4, 5, 5

  // example transform stream take (limit)
  getStudentName('Bagus Aji')
      .take(2) // ambil 2 data pertama
      .listen((value) => print(value)); // cetak 'Bagus Aji'

  // // example transform stream take (limit) stream number
  numbers()
      .take(2) // ambil 2 data pertama
      .listen((value) => print(value)); // cetak 1, 2

  // example transform stream skip (offset)
  getStudentName('Dawu Umbara')
      .skip(1) // lewati 2 data pertama
      .listen((value) => print(value)); // cetak 'Dawu Umbara' // lewati 'Dawu Umbara'

  // example transform stream skip (offset) stream number
  numbers()
      .skip(1) // lewati 2 data pertama
      .listen((value) => print(value)); // cetak 2, 3, 4, 5

  // example transform stream takeWhile
  getStudentName('Dawu Umbara')
      .takeWhile((value) => value.contains('Dawu')) // ambil data selama value mengandung 'Dawu'
      .listen((value) => print(value)); // cetak 'Dawu Umbara'

  // example transform stream takeWhile stream number
  numbers()
      .takeWhile((value) => value < 3) // ambil data selama value kurang dari 3
      .listen((value) => print(value)); // cetak 1, 2

  // example transform stream skipWhile
  getStudentName('Dawu Umbara')
      .skipWhile((value) => value.contains('Dawu')) // lewati data selama value mengandung 'Dawu'
      .listen((value) => print(value)); // cetak 'Dawu Umbara'

  // example transform stream skipWhile stream number
  numbers()
      .skipWhile((value) => value < 3) // lewati data selama value kurang dari 3
      .listen((value) => print(value)); // cetak 3, 4, 5

  // example transform stream distinct
  getStudentName('Dawu Umbara')
      .distinct() // ambil data yang tidak sama
      .listen((value) => print(value)); // cetak 'Dawu Umbara'

  // example transform stream distinct stream number
  numbers()
      .distinct() // ambil data yang tidak sama
      .listen((value) => print(value)); // cetak 1, 2, 3, 4, 5

  // example transform stream handleError
  getStudentName('Dawu Umbara')
      .handleError((error) => print(error)) // cetak error
      .listen((value) => print(value)); // cetak 'Dawu Umbara'

  // example transform stream handleError stream number
  numbers()
      .handleError((error) => print(error)) // cetak error
      .listen((value) => print(value)); // cetak 1, 2, 3, 4, 5

  // example transform stream timeout
  getStudentName('Dawu Umbara')
      .timeout(Duration(seconds: 3), onTimeout: (event) => 'Timeout') // timeout 3 seconds
      .listen((value) => print(value)); // cetak 'Dawu Umbara'

  // example transform stream timeout stream number
  numbers()
      .timeout(Duration(seconds: 3), onTimeout: (event) => 'Timeout') // timeout 3 seconds
      .listen((value) => print(value)); // cetak 1, 2, 3, 4, 5

  // example transform stream transform
  getStudentName('Dawu Umbara')
      .transform(StreamTransformer.fromHandlers(
          handleData: (value, sink) => sink.add(value.toUpperCase()))) // ubah value menjadi uppercase
      .listen((value) => print(value)); // cetak 'DAWU UMBARA'

  // example transform stream transform stream number
  numbers()
      .transform(StreamTransformer.fromHandlers(
          handleData: (value, sink) => sink.add(value * 2))) // kalikan value dengan 2
      .listen((value) => print(value)); // cetak 2, 4, 6, 8, 10

  // example transform stream cast
  getStudentName('Dawu Umbara')
      .cast<String>() // ubah tipe data menjadi string
      .listen((value) => print(value)); // cetak 'Dawu Umbara'


  // example transform stream toList
  getStudentName('Dawu Umbara')
      .toList() // ubah stream menjadi list
      .then((value) => print(value)); // cetak ['Dawu Umbara']

  // example transform stream toList stream number
  numbers()
      .toList() // ubah stream menjadi list
      .then((value) => print(value)); // cetak [1, 2, 3, 4, 5]

  // example transform stream toSet
  getStudentName('Dawu Umbara')
      .toSet() // ubah stream menjadi set
      .then((value) => print(value)); // cetak {'Dawu Umbara'}

  // example transform stream toSet stream number
  numbers()
      .toSet() // ubah stream menjadi set
      .then((value) => print(value)); // cetak {1, 2, 3, 4, 5}

  // example transform stream toMap
  getStudentName('Dawu Umbara')
      .map((value) => value.split(' ')) // split string dengan spasi menjadi list ['Dawu', 'Umbara']
      .map((value) => MapEntry(value.first, value.last)) // ubah list menjadi map {'Dawu': 'Umbara'}
      .listen((value) => print(value)); // cetak {'Dawu': 'Umbara'}

  // example transform stream toMap stream number
  numbers()
      .map((value) => MapEntry(value, value * 2)) // ubah list menjadi map {1: 2, 2: 4, 3: 6, 4: 8, 5: 10}
      .listen((value) => print(value)); // cetak {1: 2, 2: 4, 3: 6, 4: 8, 5: 10}

  // example transform stream toBroadcastStream
  getStudentName('Dawu Umbara')
      .map((value) => value.split(' ')) // split string dengan spasi menjadi list ['Dawu', 'Umbara']
      .map((value) => MapEntry(value.first, value.last)) // ubah list menjadi map {'Dawu': 'Umbara'}
      .listen((value) => print(value)); // cetak {'Dawu': 'Umbara'}

  // example transform stream toBroadcastStream stream number
  numbers()
      .map((value) => MapEntry(value, value * 2)) // ubah list menjadi map {1: 2, 2: 4, 3: 6, 4: 8, 5: 10}
      .listen((value) => print(value)); // cetak {1: 2, 2: 4, 3: 6, 4: 8, 5: 10}
}