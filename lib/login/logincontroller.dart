import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:mvvm/AuthRepositoryImp/AuthrepositoryImp.dart';
import 'package:mvvm/models/request.dart';
import '../failure.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthRepositoryImp authRepositoryImp = AuthRepositoryImp();

  login(BuildContext context) async {
    var request = LoginRequest(
      email: emailController.text,
      password: passwordController.text,
    );
    var data = await authRepositoryImp.login(request);
    data.fold((l) {
      if (l is ServerFailure) {
        if (kDebugMode) {
          print(l.message);
        }
      }
    },
            (r) {
          r.id;
          r.token;
        }
    );
  }
}