import 'package:native_encrypted_storage/native_encrypted_storage.dart';
class SecureDataHelper{
  SecureDataHelper._internal();
  static final SecureDataHelper _instant = SecureDataHelper._internal();
  factory SecureDataHelper()=>_instant;
  static SecureDataHelper get getInstant => _instant;
  final NativeEncryptedStorage _storage = NativeEncryptedStorage.getInstance;

 Future<void> saveData({required String key,required String value})async{
    return await _storage.write(key: key, value: value);
  }

  Future<String?>getData({required String key})async{
   return await _storage.read(key: key);
  }

 Future<void> deleteValue({required String key})async{
   return await _storage.delete(key: key);
  }

 Future<void> deleteAll()async{
   return await _storage.deleteAll();
  }
}