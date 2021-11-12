import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mvvm_rxdart_demo/model/user.dart';
import 'package:mvvm_rxdart_demo/service/user_service_task.dart';
import 'package:mvvm_rxdart_demo/view_model/users_view_model.dart';

class GithubUserPage extends StatefulWidget {
  const GithubUserPage({Key? key}) : super(key: key);

  @override
  State<GithubUserPage> createState() {
    return _GithubUserPage();
  }
}

class _GithubUserPage extends State<GithubUserPage> {

  final _viewModel = UsersViewModel();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Users"),
        actions: [
          IconButton(onPressed: () {
            _viewModel.loadUsersList();
          }, icon: const Icon(Icons.autorenew, color: Colors.white,))
        ],
      ),
      body: Stack(
        children: [StreamBuilder(
          stream: _viewModel.subject,
          builder: (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
            return ListView.separated(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: NetworkImage(snapshot.data![index].avatar_url),
                              fit: BoxFit.fill
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        snapshot.data![index].login,
                        style: const TextStyle(
                            fontSize: 20
                        ),
                      ),
                    )
                  ],
                );
              },
              padding: const EdgeInsets.all(10),
              separatorBuilder: (BuildContext context, int index) {
                return const Divider(color: Colors.grey);
              },
            );
          },
        ),
          StreamBuilder(
              stream: _viewModel.isLoading,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                return Align(
                  alignment: Alignment.center,
                  child: Visibility(
                    visible: snapshot.data!,
                    child: CircularProgressIndicator(),
                  ),
                );
              }
          ),
        ],
      )
    );
  }
}
