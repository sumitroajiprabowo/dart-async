Future<String> getTeacherName(String name){
  // return Future.value(name);
  return Future.error(Exception('Error'));
}

void main(){
  getTeacherName('Dian Sastro')
      .then((value) => print(value))
      .catchError((error) => print(error))
      .whenComplete(() => print('Complete'));
}