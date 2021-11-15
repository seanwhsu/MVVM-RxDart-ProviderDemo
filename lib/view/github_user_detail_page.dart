import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_rxdart_demo/service/user_service_task.dart';
import 'package:mvvm_rxdart_demo/view_model/user_detail_view_model.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _UserDetailPage();
  }
}

class _UserDetailPage extends State<UserDetailPage> {
  bool apiLoaded = false;

  @override
  void initState() {
    apiLoaded = false;
    super.initState();
  }

  // @override
  // void didChangeDependencies() {
  //   if (!apiLoaded) {
  //     var user = ModalRoute.of(context)!.settings.arguments.toString();
  //     Provider.of<UserDetailViewModel>(context).getUserDetail(user: user);
  //     apiLoaded = true;
  //   }
  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // var _videModel = Provider.of<UserDetailViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text("User Detail"),
        ),
        body: Consumer<UserDetailViewModel>(
          builder: (context, viewModel, child) {
            if (!apiLoaded) {
              var user = ModalRoute.of(context)!.settings.arguments.toString();
              viewModel.getUserDetail(user: user);
              apiLoaded = true;
            }
            return Column(
              children: [
                userImage(viewModel.imageUrl),
                Text(
                  viewModel.userName,
                  style: const TextStyle(fontSize: 30),
                ),
                Text(viewModel.userLogin,
                    style:
                        const TextStyle(fontSize: 20, color: Colors.black38)),
                getInfo(viewModel),
                getLoadingView(viewModel.isLoading),
              ],
            );
          },
        ));
  }

  Widget getLoadingView(bool isLoading) {
    return Align(
      alignment: Alignment.center,
      child: Visibility(
        visible: isLoading,
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget userImage(String imageUrl) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Align(
        child: Container(
          width: 300,
          height: 300,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  fit: BoxFit.fill, image: NetworkImage(imageUrl))),
        ),
      ),
    );
  }

  Widget getInfo(UserDetailViewModel viewModel) {
    return Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
            alignment: Alignment.topLeft,
            child: Column(
              children: (() {
                var map = {
                  Icons.auto_stories: viewModel.userBlog,
                  Icons.place: viewModel.userLocation,
                  Icons.email: viewModel.userUrl
                };
                var rows = <Widget>[];
                map.forEach((key, value) {
                  rows.add(Row(
                    children: [
                      Visibility(
                        visible: value.isNotEmpty,
                        child: Icon(
                          key,
                          color: Colors.blue,
                          size: 50,
                        ),
                      ),
                      Visibility(
                        visible: value.isNotEmpty,
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Text(value,
                                style: getStyleOfInfo(),
                                overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                        )
                      )
                    ],
                  ));
                });
                return rows;
              }()),
            )));
  }

  TextStyle getStyleOfInfo() {
    return const TextStyle(fontSize: 20);
  }
}
