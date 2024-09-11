import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mvvm/constants/constants.dart';
import 'package:mvvm/userdata/datacontoller.dart';

class DataPage extends StatefulWidget {
  const DataPage({super.key});

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  @override
  void initState() {
    dataController.getCrypto(context);
    super.initState();
  }
  DataController dataController=Get.put(DataController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      id: ControllerBuilders.dataPage,
        init: dataController,
        builder: (DataController dataController) {
        return Scaffold(
          body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: ListView.builder(
              itemCount: dataController.lst.length,
              itemBuilder: (BuildContext context, int index) {
                dataController.lst.isEmpty?const Center(child: CircularProgressIndicator(),):
                    Column(
                      children: [
                        Text(dataController.lst[index].id.toString()),
                        Text(dataController.lst[index].title.toString()),
                        Text(dataController.lst[index].body.toString()),
                        Text(dataController.lst[index].userId.toString()),
                      ],
                    );
              },

            ),
          ));
    },

    );
  }
}
