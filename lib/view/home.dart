import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wednusday_solutions/controller/home_controller.dart';
import 'package:wednusday_solutions/helper/helper.dart';

class GetList extends StatefulWidget {
  const GetList({super.key});
  @override
  State<GetList> createState() => _GetListState();
}

class _GetListState extends State<GetList> {
  final HomeController _homeController = HomeController();
  // @override
  // void initState() {
  //   _homeController.getData();
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cloud Data'),
        centerTitle: true,
      ),
      body: _homeController.isLoading
          ? const Center(
              child: CupertinoActivityIndicator(
                  radius: 20, color: Helpers.whiteColor),
            )
          : _homeController.modelList.isEmpty
              ? const Center(
                  child: Text(
                    'Press the Button for fetch data',
                    style: TextStyle(color: Colors.black, fontSize: 30),
                  ),
                )
              : ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: _homeController.modelList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        tileColor: Helpers.tileColor,
                        textColor: Helpers.whiteColor,
                        title: Text(_homeController.modelList[index].title!),
                        leading: Text(
                            _homeController.modelList[index].id!.toString()),
                      ),
                    );
                  },
                ),
      floatingActionButton: FloatingActionButton.extended(
        label: Icon(_homeController.modelList.isEmpty
            ? CupertinoIcons.cloud_download
            : CupertinoIcons.refresh),
        onPressed: () async {
          setState(() => _homeController.isLoading = true);
          _homeController.isLoading ? await _homeController.getData() : null;
          setState(() => _homeController.isLoading = false);
        },
      ),
    );
  }
}
