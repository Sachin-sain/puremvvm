import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mvvm/constants/constants.dart';
import '../failure.dart';
import '../models/userdataresponse.dart';
import '../userdatarepositoryimp.dart';

class DataController extends GetxController{
List <UserdataResponse> lst=[];
  RepositoryImp repositoryImp=RepositoryImp();

  getCrypto(BuildContext context) async {

    var data = await repositoryImp.getData();
    data.fold((l) {
      if (l is ServerFailure) {
       print(l.message);
      }
    }, (r) {
  lst.add(r);
     update([ControllerBuilders.dataPage]);


      }

    );
  }
}