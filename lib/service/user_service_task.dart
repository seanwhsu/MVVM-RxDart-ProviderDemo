import 'package:mvvm_rxdart_demo/model/user.dart';
import 'package:mvvm_rxdart_demo/service/api_service.dart';

class UserServiceTask {
  Stream getUsers() {
    return ApiService.getInstance().get(url: "users").map((responce) =>
           (responce as List).map((item) => User.fromJson(item)).toList()
        );
  }
}
