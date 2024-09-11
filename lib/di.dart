import 'package:get/get.dart';

import 'data/sources/restclient.dart';


class InitialBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(RestClient(), permanent: true);
  }
}