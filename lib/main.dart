import 'package:flutter/material.dart';
import 'package:mvvm_rxdart_demo/view/github_user_detail_page.dart';
import 'package:mvvm_rxdart_demo/view/github_users_page.dart';
import 'package:mvvm_rxdart_demo/view_model/user_detail_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider.value(value: UserDetailViewModel())],
      child: MaterialApp(
        title: 'Flutter Demo',
        initialRoute: "/",
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          "/": (context) => const GithubUserPage(),
          "user_detail":(context) => const UserDetailPage()
        },
      ),
    );
  }
}