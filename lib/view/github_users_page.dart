import 'package:flutter/material.dart';

class GithubUserPage extends StatefulWidget {
  const GithubUserPage({Key? key}) : super(key: key);

  @override
  State<GithubUserPage> createState() {
    return _GithubUserPage();
  }
}

class _GithubUserPage extends State<GithubUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github Users"),
      ),
      body: ListView.separated(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                    fit: BoxFit.fill
                    )
                  ),
                ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "User Name",
                  style: TextStyle(
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
      ),
    );
  }
}
