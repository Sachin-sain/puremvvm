import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/login/logincontroller.dart';

import '../constants/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController loginController=Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
       id:ControllerBuilders.loginPage,
        init: loginController,
        builder: (LoginController loginController) {
         return Scaffold(
           body: Column(
             children: [
               TextFormField(
                 controller: loginController.emailController,
               ),
               SizedBox(height: 20,),
               TextFormField(
                 controller: loginController.passwordController,
               ),
               const SizedBox(height: 20,),
               GestureDetector(
                 onTap: (){
                   loginController.login(context);
                 },
                 child: const Text('Login'),
               ),

             ],
           ),
         );
  }
  );
}}
