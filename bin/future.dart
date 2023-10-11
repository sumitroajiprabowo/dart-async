/// Future di Dart
/// Future adalah sebuah objek yang merepresentasikan nilai atau error yang akan tersedia di masa yang akan datang. (async)
/// Biasanya Future digunakan untuk operasi yang membutuhkan waktu yang lama untuk menyelesaikannya.
/// Contoh operasi yang membutuhkan waktu yang lama adalah operasi I/O, seperti membaca file, request ke server, dll.
/// Future State : uncompleted, completed, error (rejected)
/// Future Value : value, error
/// Future menyimpan data string future<String>
/// Future menyimpan data integer future<int>
/// Future menyimpan data double future<double>
/// Future menyimpan data kosong future<void>
/// dll sebagainya
/// Future Status : active, paused, done
/// Active : Future sedang berjalan
/// Paused : Future sedang menunggu Future lainnya
/// Done : Future sudah selesai
/// Future Constructor : Future.value(), Future.error(), Future.delayed()


// example future value
Future<String> getPackage() {
  return Future.value('Dedicated Server');
}

// example future value with integer
Future<int> getInteger() {
  return Future.value(100); // return 100
}

// example future value with double
Future<double> getDouble() {
  return Future.value(3.14); // return 3.14
}

// example future value with void
// Future<void> getVoid() {
//   return Future.value(); // return null
// }

// example future delay
Future<String> getOrder() {
  return Future.delayed(Duration(seconds: 3), () {
    return 'Cappuccino';
  });
}

// example future error
Future<String> getError() {
  return Future.error('Sorry, the item is not available');
}

// example future async
Future<String> getAsyncOrder() async {
  var order = await getOrder();
  return 'You order: $order';
}

// example future async error
Future<String> getAsyncError() async {
  try {
    var order = await getError();
    return 'You order: $order';
  } catch (e) {
    return '$e';
  }
}

// example future async multiple
Future<String> getAsyncMultiple() async {
  var order = await getOrder();
  var package = await getPackage();
  return 'You order: $order in $package';
}

// example future async multiple error
Future<String> getAsyncMultipleError() async {
  try {
    var order = await getError();
    var package = await getPackage();
    return 'You order: $order in $package';
  } catch (e) {
    return '$e';
  }
}

void main() async {

  // call future value
  print('Getting your package with future value...');
  print(await getPackage());

  // call future value with integer
  print('Getting your package with future value with integer...');
  print(await getInteger());

  // call future value with double
  print('Getting your package with future value with double...');
  print(await getDouble());

  // call future delay
  print('Getting your order with future delay...');
  print(await getOrder());

  // call future error
  print('Getting your order with future error...');
  print(await getAsyncOrder());

  // call future async with exception handling
  print('Getting your order with future async with exception handling...');
  print(await getAsyncError());

  // call future async multiple without exception handling
  print('Getting your order future async multiple without exception handling...');
  print(await getAsyncMultiple());

  // call future async multiple with exception handling
  print('Getting your order with future async multiple with exception handling...');
  print(await getAsyncMultipleError());
}