/// Async Await Stream di Dart
/// Async Await Stream adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara asynchronous
/// Asynchronous adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara asynchronous
/// Dengan kata lain, asynchronous adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara background
/// Asynchronous juga bisa digunakan untuk membuat sebuah fungsi yang berjalan secara parallel
/// Stream adalah sebuah cara untuk membuat sebuah fungsi yang berjalan secara asynchronous


// example async await stream
Stream<String> getOrder(String name) async* { // membuat fungsi getOrder dengan parameter name dan async*
  for (var i = 1; i <= 3; i++) { // melakukan perulangan dengan variabel i = 1 dan i <= 3 dan i++
    await Future.delayed(Duration(seconds: 3)); // menunggu 3 detik
    if (name == 'Fandy') { // jika name bernilai Fandy
      yield 'Mie Ayam'; // maka mengembalikan nilai Mie Ayam
    } else { // jika tidak
      yield 'Nasi Goreng'; // maka mengembalikan nilai Nasi Goreng
    }
  }
}

void main() async {
  print('Getting order...');
  getOrder('Fandy').listen((event) { // memanggil fungsi getOrder dengan parameter Fandy dan listen
    print('Pesanan anda: $event'); // mencetak Pesanan anda: $event
  });
}