import 'package:get_storage/get_storage.dart';

class LocalStorage{
  static final box=GetStorage();


   static void setAuthToken(String token){
     box.write(GetXStorageConstants.authToken,token);
   }
  static String getAuthToken(){
   return  box.read(GetXStorageConstants.authToken)??'';

  }

}
class GetXStorageConstants{
  static const authToken = "Authorization";

}