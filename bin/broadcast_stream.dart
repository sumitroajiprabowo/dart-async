/// Broadcast Stream di Dart
/// Broadcast Stream adalah sebuah stream yang bisa memiliki banyak listener.
/// Broadcast Stream digunakan ketika kita ingin membuat sebuah stream yang bisa diakses oleh banyak listener.
/// Selengkapnya tentang Broadcast Stream bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/BroadcastStream-class.html


// example broadcast stream
Stream<int> getNumber(int number) async* { // membuat stream dari sebuah list dengan menggunakan async*
  // for loop untuk membuat list berulang dengan delay 1 detik
  for (var i = 1; i <= number; i++) { // for loop untuk membuat list berulang
    await Future.delayed(Duration(seconds: 1)); // await digunakan untuk menunggu future selesai
    yield i; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  }
}

void main(){
  // example broadcast stream
  var stream = getNumber(10).asBroadcastStream(); // membuat broadcast stream dari sebuah list
  print(stream.isBroadcast); // cek apakah stream adalah broadcast stream (true
  // cetak data stream
  print('Data stream: ${stream.toString()}');
  var subscription1 = stream.listen((data) { // membuat stream subscription 1
    print('Data 1: $data'); // cetak data
  }, onError: (error) { // error
    print('Error 1: $error'); // cetak error
  }, onDone: () { // done
    print('Done 1'); // cetak done
  }, cancelOnError: true); // cancel on error

  var subscription2 = stream.listen((data) { // membuat stream subscription 2
    print('Data 2: $data'); // cetak data
  }, onError: (error) { // error
    print('Error 2: $error'); // cetak error
  }, onDone: () { // done
    print('Done 2'); // cetak done
  }, cancelOnError: true); // cancel on error

  // example broadcast stream pause
  // after 3 seconds, pause stream subscription
  Future.delayed(Duration(seconds: 3), () {
    subscription1.pause(); // pause stream subscription 1
    subscription2.pause(); // pause stream subscription 2
    if (subscription1.isPaused && subscription2.isPaused) { // cek status stream subscription (true)
      print("Stream subscription is paused");
    }
  }); // future delay 3 seconds (pause)

  // example broadcast stream resume
  // after 5 seconds, resume stream subscription
  Future.delayed(Duration(seconds: 5), () {
    subscription1.resume(); // resume stream subscription 1
    subscription2.resume(); // resume stream subscription 2
    if (!subscription1.isPaused && !subscription2.isPaused) { // cek status stream subscription (false)
      print("Stream subscription is resumed");
    }
  }); // future delay 5 seconds (resume)

  // example broadcast stream cancel
  // after 7 seconds, cancel stream subscription
  Future.delayed(Duration(seconds: 7), () {
    subscription1.cancel(); // cancel stream subscription 1
    subscription2.cancel(); // cancel stream subscription 2
    print("Stream subscription is canceled");
  }); // future delay 7 seconds (cancel)
}