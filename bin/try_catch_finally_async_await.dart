/// Try Catch Finally Async Await
/// Try Catch Finally Async Await adalah sebuah cara untuk menangani error atau exception
/// Try Catch Finally Async Await digunakan untuk menangani error atau exception pada asynchronous

// example try catch finally
Future<String> getOrder(String name) async {
  return Future.delayed(Duration(seconds: 3), () {
    if (name == 'Fandy') {
      return 'Mie Ayam';
    } else {
      throw Exception('Maaf pesanan tidak tersedia');
    }
  });
}

// example try catch finally async await with error handling on
// try catch finally and time delay 3 seconds with package async
// if name is Fandy then return Future.delayed with parameter Duration and function anonim
Future<String> getOrderAsync(String name) async {
  // try catch finally async await with 3 seconds delay
  try {
    var order = await Future.delayed(Duration(seconds: 3), () {
      if (name == 'Fandy') {
        return 'Tamiya';
      } else {
        throw Exception('Your order is not available');
      }
    });
    return order;
  } catch (e) {
    return 'Your order is not available';
  } finally {
    print('Thanks for your order');
  }
}

/*
Dari kode di atas, kita membuat sebuah fungsi getOrder dan getOrderAsync
Ada beberapa perbedaan antara fungsi getOrder dan getOrderAsync
1. Fungsi getOrder hanya mengembalikan nilai Future<String> dan tidak ada error handling di dalamnya
2. Fungsi getOrderAsync mengembalikan nilai Future<String> dan ada error handling di dalamnya
3. Fungsi getOrder menggunakan then untuk menangani hasil dari Future
4. Fungsi getOrderAsync menggunakan await untuk menangani hasil dari Future
5. Fungsi getOrder menggunakan if else untuk menangani error atau exception
6. Fungsi getOrderAsync menggunakan try catch untuk menangani error atau exception
7. Fungsi getOrderAsync menggunakan finally untuk mengeksekusi kode program yang harus dijalankan
8. Fungsi getOrderAsync menggunakan await untuk menunggu hasil dari Future selesai
9. Fungsi getOrderAsync finally akan dijalankan setelah kode program selesai dijalankan atau Future selesai.
 */



void main() async {
  try {
    var order = await getOrder('Fandy');
    print('Pesanan anda: $order');
  } catch (e) {
    print(e);
  } finally {
    print('Terima kasih sudah memesan');
  }

  print(''); // print new line

  var orderAsync = await getOrderAsync('Fandy'); // membuat variabel orderAsync dengan nilai await getOrderAsync dengan parameter Fandy
  print('Your order is: $orderAsync'); // mencetak Your order is: $orderAsync

  print(''); // print new line

  // example error handling on pada fungsi getOrder
  try {
    var order = await getOrder('Fandyy');
    print('Pesanan anda: $order');
  } catch (e) {
    print(e);
  } finally {
    print('Terima kasih sudah memesan');
  }

  print(''); // print new line

  // example error handling on pada fungsi getOrderAsync
  var orderAsyncError = await getOrderAsync('Fandyy'); // membuat variabel orderAsyncError dengan nilai await getOrderAsync dengan parameter Fandyy agar error
  print(orderAsyncError); // mencetak orderAsyncError
}