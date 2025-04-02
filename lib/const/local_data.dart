import 'package:get_storage/get_storage.dart';

class LocalData{
  GetStorage getStorage = GetStorage();
  LocalData(){
    getStorage = GetStorage();
  }

  void writeUID(String uid){
    getStorage.write('uid', uid);
  }

  String readUID(){
    return getStorage.read('uid')??'';
  }
}

