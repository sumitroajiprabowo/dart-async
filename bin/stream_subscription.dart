/// Stream Subscription
/// Stream Subscription adalah sebuah objek yang merepresentasikan sebuah langganan terhadap sebuah stream.
/// Stream Subscription digunakan untuk mengakses data yang ada di dalam stream.
/// Stream Subscription memiliki method yang digunakan untuk mengakses data di dalam stream, antara lain: onData, onError, dan onDone.
/// onData digunakan untuk mengakses data yang ada di dalam stream ketika stream sedang aktif.
/// onError digunakan untuk mengakses data error yang ada di dalam stream ketika stream sedang aktif.
/// onDone digunakan untuk mengakses data yang ada di dalam stream ketika stream sudah selesai.
/// Stream Subscription memiliki method yang digunakan untuk menghentikan langganan terhadap sebuah stream, antara lain: pause, resume, dan cancel.
/// pause digunakan untuk menghentikan langganan terhadap sebuah stream sementara.
/// resume digunakan untuk melanjutkan langganan terhadap sebuah stream yang sudah dihentikan sementara.
/// cancel digunakan untuk menghentikan langganan terhadap sebuah stream secara permanen.
/// Stream Subscription memiliki properti yang digunakan untuk mengecek status sebuah stream, antara lain: isPaused, hasCode dan runtimeType
/// isPaused digunakan untuk mengecek apakah sebuah stream sedang dihentikan sementara atau tidak.
/// hasCode digunakan untuk mengecek apakah sebuah stream memiliki kode atau tidak.
/// runtimeType digunakan untuk mengecek tipe data sebuah stream.
/// Selengkapnya tentang Stream Subscription bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/StreamSubscription-class.html

// example stream subscription
Stream<int> getNumber(int number) async* { // membuat stream dari sebuah list dengan menggunakan async*
  // for loop untuk membuat list berulang dengan delay 1 detik
  for (var i = 1; i <= number; i++) { // for loop untuk membuat list berulang
    await Future.delayed(Duration(seconds: 1)); // await digunakan untuk menunggu future selesai
    yield i; // yield digunakan untuk mengembalikan nilai dari sebuah stream
  }
}

void main(){
  // example stream subscription
  var stream = getNumber(10); // membuat stream dari sebuah list
  var subscription = stream.listen((data) { // membuat stream subscription
    print('Data: $data'); // cetak data
  }, onError: (error) { // error
    print('Error: $error'); // cetak error
  }, onDone: () { // done
    print('Done'); // cetak done
  }, cancelOnError: true); // cancel on error

  //example stream subscription pause
  // after 3 seconds, pause stream subscription
  Future.delayed(Duration(seconds: 3), () {
    subscription.pause(); // pause stream subscription
    if (subscription.isPaused) { // cek status stream subscription (true)
      print("Stream subscription is paused");
    }
  }); // future delay 3 seconds (pause)

  // example stream subscription resume
  // after 5 seconds, resume stream subscription
  Future.delayed(Duration(seconds: 5), () {
    subscription.resume(); // resume stream subscription
    if (!subscription.isPaused) { // cek status stream subscription (false)
      print("Stream subscription is resumed");
    }
  }); // future delay 5 seconds (resume)

  // example stream subscription cancel
  // after 7 seconds, cancel stream subscription
  Future.delayed(Duration(seconds: 7), () {
    subscription.cancel(); // cancel stream subscription
    print("Stream subscription is canceled");
  }); // future delay 7 seconds (cancel)



}