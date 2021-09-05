
//========== Set Local Storage String Value ============
import 'package:get_storage/get_storage.dart';

Future<int> saveString(String theName,String theValue) async{
  final box = GetStorage();
  box.write(theName, theValue);
  return 1;
}





//========== Get Local Storage String Value ============
Future<String?> loadString(String theName) async{
  final box = GetStorage();
  return box.read(theName);
}

