import 'package:flutter/cupertino.dart';
import 'package:mvvm_rxdart_demo/model/user.dart';
import 'package:mvvm_rxdart_demo/service/user_service_task.dart';
import 'package:rxdart/rxdart.dart';

class UserDetailViewModel extends ChangeNotifier {
  final _serviceTask = UserServiceTask();
  late User _userDetail;
  String imageUrl = "";
  String userName = "";
  String userLogin = "";
  String userBlog = "";
  String userUrl = "";
  String userLocation = "";
  bool isLoading = false;

  void getUserDetail({required String user}) {
    _reset();
    _serviceTask.getUserDetail(user).transform(DoStreamTransformer(
        onData: (res_user) {
          _userDetail = res_user;
          _setupViewModel();
        },
        onError: (e, s) {
          print('onError');
        },
        onListen: () {
          isLoading = true;
          notifyListeners();
        },
        onDone: () {
          isLoading = false;
          notifyListeners();
        }
    )).listen(null);
  }

  void _setupViewModel() {
    imageUrl = _userDetail.avatar_url;
    userName = _userDetail.name ?? "";
    userLogin = _userDetail.login;
    userBlog = _userDetail.blog ?? "";
    userUrl = _userDetail.url ?? "";
    userLocation = _userDetail.location ?? "";
    notifyListeners();
  }

  void _reset(){
    imageUrl = "";
    userName = "";
    userLogin = "";
    userBlog = "";
    userUrl = "";
    userLocation = "";
    isLoading = false;
    notifyListeners();
  }

}