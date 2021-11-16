import 'package:mvvm_rxdart_demo/model/user.dart';
import 'package:mvvm_rxdart_demo/service/user_service_task.dart';
import 'package:rxdart/rxdart.dart';

class UsersViewModel {
  final _serviceTask = UserServiceTask();
  BehaviorSubject<List<User>> subject = BehaviorSubject<List<User>>.seeded(<User>[]);
  BehaviorSubject<bool> isLoading = BehaviorSubject<bool>.seeded(false);

  UsersViewModel() {
    loadUsersList();
  }

  void loadUsersList() {
    //Use delay to test loading view
    _serviceTask.getUsers().delay(Duration(seconds: 1)).transform(DoStreamTransformer(
        onData: (users) {
          subject.add(users);
        },
        onError: (e, s) {
          print('onError');
        },
        onListen: () => {
          isLoading.add(true)
        },
        onDone: () => {
          isLoading.add(false)
        }
    )).listen(null);
  }
}
