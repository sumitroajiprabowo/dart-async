/// Transform Future di Dart
/// Transform Future adalah sebuah method yang mengubah nilai Future menjadi nilai lainnya.
/// Selengkapnya tentang Transform Future bisa dibaca di https://api.dart.dev/stable/2.10.4/dart-async/Future-class.html


// example transform future transform(transformer)
Future<String> getStudentName(String name){
  return Future.value(name);
}

void main(){
  toUpperCase(String value) => value.toUpperCase();
  getStudentName('Dian Sastro')
      .then((value) => value.split(' ')) // split string dengan spasi menjadi list ['Dian', 'Sastro']
      .then((value) => value.first) // ambil data pertama dari list ['Dian', 'Sastro'] menjadi 'Dian'
      .then((value) => toUpperCase(value)) // ubah 'Dian' menjadi 'DIAN'
      .then((value) => print(value)); // cetak 'DIAN'
}