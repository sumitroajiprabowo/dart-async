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

import 'dart:convert';
import 'package:http/http.dart' as http;

// example stream from iterable
Stream<int> getNumber(int number) async* {
  for (var i = 1; i <= number; i++) {
    yield i;
  }
}

// example stream from periodic
Stream<int> getPeriodic(int number) {
  return Stream.periodic(Duration(seconds: 1), (int x) => x).take(number);
}

fetchUserOrder() {
  return Future.delayed(Duration(seconds: 3), () => 'Cappuccino');
}

// example stream from future
Stream<String> getOrder() async* {
  var order = await fetchUserOrder();
  yield 'You order: $order';
}

// Function to fetch data asynchronously from an API
Future<List<dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('Failed to fetch data');
  }
}

// example stream value
Stream<String> getStreamValue() async* {
  yield 'Hello';
  yield 'Stream';
  yield 'Value';
}

// example stream error
Stream<String> getStreamError() async* {
  yield 'Hello';
  yield 'Stream';
  yield 'Error';
  throw Exception('Error');
}

// example stream empty
Stream<String> getStreamEmpty() async* {}


void main() async {
  // example stream from iterable
  getNumber(5).listen((event) {
    print(event);
  });

  // new line
  print('');

  // example stream from periodic
  getPeriodic(5).listen((event) {
    print(event);
  });

  // example stream from future
  getOrder().listen((event) {
    print(event);
  });

  print('Fetching data...');

  final future = fetchData(); // Call the function to get a future object

  future.then((data) {
    print('Data fetched successfully:');
    for (var item in data) {
      print('Title: ${item['title']}');
      print('Body: ${item['body']}');
      print('---');
    }
  }).catchError((error) {
    print('Error occurred: $error');
  }).whenComplete(() {
    print('Program completed');
  });

  // example stream value
  getStreamValue().listen((event) {
    print(event);
  });

  // example stream error
  getStreamError().listen((event) {
    print(event);
  }, onError: (err) {
    print(err);
  });

  // example stream empty
  getStreamEmpty().listen((event) {
    print(event);
  }, onError: (err) {
    print(err);
  }, onDone: () {
    print('Done');
  });
}

