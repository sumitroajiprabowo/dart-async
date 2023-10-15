/// Async di Dart
/// Async adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara asynchronous
/// Asynchronous adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara asynchronous
/// Dengan kata lain, asynchronous adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara background
/// Asynchronous juga bisa digunakan untuk membuat sebuah fungsi yang berjalan secara parallel

// example async
Future<String> getOrder(String name) async { // membuat fungsi getOrder dengan parameter name dan async
  String order; // membuat variabel order
  if (name == 'Fandy') { // jika name bernilai Fandy
    order = 'Mie Ayam'; // maka order berisi Mie Ayam
  } else {
    order = 'Nasi Goreng'; // jika tidak maka order berisi Nasi Goreng
  }

  return order; // mengembalikan nilai order
}

void main() async {
  getOrder('Fandy').then((value) { // memanggil fungsi getOrder dengan parameter Fandy dan then
    print('Pesanan anda: $value'); // mencetak Pesanan anda: $value
  });
}