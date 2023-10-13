/// Stream di Dart
/// Stream adalah sebuah objek yang merepresentasikan sebuah sumber data yang akan tersedia di masa yang akan datang. (async)
/// Biasanya Stream digunakan untuk operasi yang membutuhkan waktu yang lama untuk menyelesaikannya.
/// Stream Constructor : Stream.fromIterable(), Stream.periodic(), Stream.fromFuture(), Stream.fromFutures(), Stream.value(), Stream.error(), Stream.empty()
/// Stream.fromIterable() : Membuat stream dari sebuah list
/// Stream.periodic() : Membuat stream dari sebuah list yang berulang
/// Stream.fromFuture() : Membuat stream dari sebuah future
/// Stream.fromFutures() : Membuat stream dari beberapa future
/// Stream.value() : Membuat stream dari sebuah nilai
/// Stream.error() : Membuat stream dari sebuah error
/// Stream.empty() : Membuat stream kosong

// example stream from iterable using Stream.fromIterable()
Stream<int> getNumber(int number) async* { // membuat stream dari sebuah list dengan menggunakan async*
  for (var i = 1; i <= number; i++) { // for loop untuk membuat list berulang
    yield i; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  }
}


Stream<String> getLists() { // membuat stream dari sebuah list tanpa menggunakan async*
  var lists = ['Dian', 'Sastro', 'Ari', 'Lasso']; // list
  return Stream.fromIterable(lists); // return stream dari list
}

/*
perbedaan menggunakan async* dan tidak menggunakan async* adalah ketika menggunakan async* kita bisa menggunakan yield
yield digunakan untuk mengembalikan nilai dari sebuah stream
sedangkan ketika tidak menggunakan async* kita tidak bisa menggunakan yield
 */

// example stream from periodic
Stream<int> getPeriodic(int number) { // membuat stream integer dari sebuah list yang berulang
  return Stream.periodic(Duration(seconds: 1), (int x) => x).take(number); // return stream dari list yang berulang
}

fetchUserOrder() { // membuat future
  return Future.delayed(Duration(seconds: 3), () => 'Cappuccino'); // return future dengan delay 3 detik
}

// example stream from future
Stream<String> getOrder() async* { // membuat stream dari future dengan menggunakan async*
  var order = await fetchUserOrder(); // await digunakan untuk menunggu future selesai
  yield 'You order: $order'; // yield digunakan untuk mengembalikan nilai dari sebuah stream
}

// create fetchUserOrder() function
Future<String> fetchUserProduct() { // membuat future
  return Future.delayed(Duration(seconds: 3), () => 'Cappuccino'); // return future dengan delay 3 detik
}


// example stream from multiple future (list)
Stream<String> getProductMultiple() async* { // membuat stream dari beberapa future dengan menggunakan async*
  var product = await Future.wait([ // await digunakan untuk menunggu future selesai
    fetchUserProduct(), // future 1
    fetchUserProduct(), // future 2
  ]);
  yield 'You product is: $product'; // yield digunakan untuk mengembalikan nilai dari sebuah stream
}


// example stream value
Stream<String> getStreamValue() async* { // membuat stream dari sebuah nilai dengan menggunakan async*
  yield 'Hello'; // yield digunakan untuk mengembalikan nilai dari sebuah stream (Hello)
  yield 'Stream'; // yield digunakan untuk mengembalikan nilai dari sebuah stream (Stream)
  yield 'Value'; // yield digunakan untuk mengembalikan nilai dari sebuah stream (Value)
}

// example stream error
Stream<String> getStreamError() async* { // membuat stream dari sebuah error dengan menggunakan async*
  yield 'Hello'; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  yield 'Stream'; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  yield 'Error'; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  throw Exception('Error'); // throw digunakan untuk mengembalikan error dari sebuah stream
}

// example stream empty
Stream<String> getStreamEmpty() async* {} // membuat stream kosong dengan menggunakan async*


void main() async {
  print("Stream from iterable using Stream.fromIterable() with async*");
  // example stream from iterable
  getNumber(5).listen((event) { // listen digunakan untuk menampilkan data dari sebuah stream (stream integer)
    print(event); // print data dari sebuah stream (stream integer)
  });

  // new line
  print('');

  print("Stream from iterable using Stream.fromIterable() without async*");
  // example stream from periodic
  getPeriodic(5).listen((event) { // listen digunakan untuk menampilkan data dari sebuah stream (stream integer)
    print(event); // print data dari sebuah stream (stream integer)
  }); // print data dari sebuah stream (stream integer)


  // new line
  print('');

  print("Stream from periodic");
  // example stream from future
  getOrder().listen((event) { // listen digunakan untuk menampilkan data dari sebuah stream (stream string)
    print(event); // print data dari sebuah stream (stream string)
  });

  // new line
  print('');

  print("Stream from multiple future (list)");
  // example stream from multiple future (list)
  getProductMultiple().listen((event) { // listen digunakan untuk menampilkan data dari sebuah stream (stream string)
    print(event); // print data dari sebuah stream (stream string)
  });

  // new line
  print('');

  print("Stream value");
  // example stream value
  getStreamValue().listen((event) {
    print(event);
  });

  print('');

  print("Stream error");
  // example stream error
  getStreamError().listen((event) {
    print(event);
  }, onError: (err) {
    print(err);
  });

  print('');

  print("Stream empty");
  // example stream empty
  getStreamEmpty().listen((event) {
    print(event);
  }, onError: (err) {
    print(err);
  }, onDone: () {
    print('Done');
  });
}

