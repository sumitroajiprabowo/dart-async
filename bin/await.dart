/// Await di Dart
/// Await adalah sebuah keyword yang digunakan untuk menunggu sebuah proses asynchronous selesai
/// Await hanya bisa digunakan di dalam fungsi yang memiliki keyword async
/// Saat menggunakan await, maka tipe data yang dikembalikan adalah Future
/// Jika menggunakan await, maka kode program akan berhenti sampai proses asynchronous selesai


import 'dart:convert';

import 'package:http/http.dart' as http; // mengimpor package http dengan alias http

// example await
Future<String> getOrder(String name) async { // membuat fungsi getOrder dengan parameter name dan async
  return Future.delayed(Duration(seconds: 3), () { // mengembalikan nilai Future.delayed dengan parameter Duration dan fungsi anonim
    return 'Pesanan anda: $name'; // mengembalikan nilai Pesanan anda: $name
  });
}

/*
example future and async await get data from api https://pokeapi.co/api/v2/pokemon/ditto
with package http https://pub.dev/packages/http
jika response status code 200 maka akan mengembalikan nilai Future.value dengan
parameter json.decode(response.body)
jika response status code bukan 200 maka akan mengembalikan nilai Future.error
dengan parameter 'Request failed with status: ${response.statusCode}'
 */

Future<Map<String, dynamic>> getData() async { // membuat fungsi getData dengan async
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon?limit=151')); // membuat variabel response dengan nilai await http.get dengan parameter Uri.parse

  if (response.statusCode == 200) { // jika response.statusCode sama dengan 200
    return Future.value(json.decode(response.body)); // maka mengembalikan nilai Future.value dengan parameter json.decode(response.body)
  } else { // jika tidak
    return Future.error('Request failed with status: ${response.statusCode}'); // maka mengembalikan nilai Future.error dengan parameter 'Request failed with status: ${response.statusCode}'
  }
}


void main() async {
  var order = await getOrder('Fandy'); // membuat variabel order dengan nilai await getOrder dengan parameter Fandy
  print(order); // mencetak order

  // call future list and async await get data from api https://pokeapi.co/api/v2/pokemon/ditto
  // call future list and async await get data from api and get all name pokemon and url pokemon
  print('Getting data from api...');
  getData().then((value) { // memanggil fungsi getData dengan then
    var data = value['results']; // membuat variabel data dengan nilai value['results']
    data.forEach((element) { // melakukan perulangan pada variabel data
      print('${element['name']} - ${element['url']}'); // mencetak element['name'] dan element['url']
    });
  });
}