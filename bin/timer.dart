import 'dart:async';

/// Timer di Dart
/// Timer adalah sebuah objek yang digunakan untuk menjalankan sebuah fungsi dengan delay tertentu.
/// Selengkapnya tentang Timer bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer-class.html
/// Timer memiliki 2 method yang digunakan untuk menjalankan sebuah fungsi dengan delay tertentu, antara lain: Timer dan Timer.periodic.
/// Timer digunakan untuk menjalankan sebuah fungsi dengan delay tertentu hanya sekali.
/// Timer.periodic digunakan untuk menjalankan sebuah fungsi dengan delay tertentu secara berulang-ulang.
/// Timer memiliki 2 properti yang digunakan untuk mengecek status sebuah timer, antara lain: isActive dan tick.
/// isActive digunakan untuk mengecek apakah sebuah timer sedang aktif atau tidak.
/// tick digunakan untuk mengecek jumlah tick yang sudah dilakukan oleh sebuah timer.
/// Selengkapnya tentang Timer bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer-class.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/Timer.periodic.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/Timer.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/isActive.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/tick.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/cancel.html
/// Selengkapnya tentang Timer.periodic bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Timer/Timer.periodic.html

// example timer
void main(){
  // example timer
  Timer(Duration(seconds: 3), () {
    print('Hello World from timer');
  }); // timer delay job 3 seconds

  // example timer periodic (repeat) (every 3 seconds) (infinite)
  Timer.periodic(Duration(seconds: 3), (timer) {
    print('Hello World from timer periodic ${timer.tick}');
  }); // timer delay 3 seconds periodically

  // example timer isActive
  Timer timer = Timer(Duration(seconds: 3), () {
    print('Hello World from timer isActive');
  }); // timer delay 3 seconds
  if (timer.isActive) { // cek status timer (true)
    print('Timer is active');
  }

  // example timer tick
  Timer tickTimer = Timer.periodic(Duration(seconds: 3), (timer) {
    print('Hello World from timer tick');
    print('Tick: ${timer.tick}'); // cek tick timer
    if (timer.tick == 5) { // cek tick timer (5)
      print('Timer from tick is canceled');
      timer.cancel(); // cancel timer
    }
  }); // timer delay 3 seconds (tick)
  tickTimer.tick; // cek tick timer
}