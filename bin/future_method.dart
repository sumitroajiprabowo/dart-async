/// Future Method di Dart
/// Future Method adalah sebuah method yang mengembalikan nilai Future.
/// Selengkapnya tentang Future Method bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Future-class.html
/// Future Method antara lain:
/// when(value) : Mengubah status Future menjadi completed dan mengembalikan nilai value.
/// then(onValue) : Mengubah status Future menjadi completed dan mengembalikan nilai value.
/// onError(onError) : Mengubah status Future menjadi error dan mengembalikan nilai error.
/// catchError(onError) : Mengubah status Future menjadi error dan mengembalikan nilai error.
/// timeout(duration, onTimeout) : Mengubah status Future menjadi error jika Future tidak selesai dalam durasi yang ditentukan.
/// whenComplete(action) : Menjalankan action ketika Future selesai.

// example future method then(onValue)
Future<String> getStudentName(String name){
  return Future.delayed(Duration(seconds: 3), () {
    return name;
    //throw Exception('Error'); // enable if show error
  });
}

// example future method onError
Future<String> getTeacherName(String name){
  return Future.delayed(Duration(seconds: 3), () {
    throw Exception('Uh Oh Error'); // enable if show error
  });
}

// example future method catchError(onError)
Future<String> getFirstName(String name){
  return Future.delayed(Duration(seconds: 3), () {
    return Future.error('Error Bos');
  }); // future delay with error
}

// example future method timeout(duration, onTimeout)
Future<String> getLastName(String name){
  return Future.delayed(Duration(seconds: 3), () {
    return name;
  }).timeout(Duration(seconds: 2), onTimeout: () {
    return 'Timeout';
  }); // future delay with timeout
}

// example future method whenComplete(action)
Future<String> getFullName(String name){
  return Future.delayed(Duration(seconds: 3), () {
    return name;
  }).whenComplete(() => print('Future Complete')); // future delay with whenComplete
}

void main(){

  // example future method then (onValue)
  getStudentName('Dian')
      .then((value) => print(value)); // execute when future complete

  // example future method onError
  getTeacherName('John')
      .onError((error, stackTrace) => "Fallback") // replace error message with fallback message // error => fallback => success
      // .onError((error, stackTrace) => print(error)); // execute when future error (rejected) // error => error message => success
      .then((value) => print(value)); // execute when future complete

  // example future method with CatchError
  getFirstName('Danu')
      .catchError((error) => "error with message $error") // execute when future error (rejected) // error => fallback => success
      .then((value) => print(value)); // execute when future complete

  // example future method with timeout
  getLastName('Danu')
      .then((value) => print(value)) // execute when future complete
      .catchError((error) => print(error)); // execute when future error (rejected) // error => fallback => success

  // example future method with whenComplete
  getFullName('Danu')
      .then((value) => print(value)); // execute when future complete


}