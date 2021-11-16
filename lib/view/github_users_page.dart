
import 'package:flutter/material.dart';
import 'package:mvvm_rxdart_demo/model/user.dart';
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
            return Container(
              color: Colors.white,
              child: ListView.separated(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return getItem(snapshot.data![index].avatar_url, snapshot.data![index].login);
                },
                padding: const EdgeInsets.all(10),
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider(color: Colors.grey);
                },
              )
            );
          },
        ),
          getLoadingView()
        ],
      )
    );
  }

  Widget getLoadingView() {
    return StreamBuilder(
        stream: _viewModel.isLoading,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          return Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: snapshot.data ?? false,
              child: CircularProgressIndicator(),
            ),
          );
        }
    );
  }

  Widget getItem(String imageUrl, String name) {
    return GestureDetector(
      child: Container(
        color: Colors.white,
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.fill
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                name,
                style: const TextStyle(
                    fontSize: 20
                ),
              ),
            )
          ],
        )
      ),
      onTap: () => {
        Navigator.of(context).pushNamed("user_detail", arguments: name)
      },
    );
  }

}
