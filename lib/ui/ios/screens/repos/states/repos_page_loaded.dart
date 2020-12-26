import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/model/repo_model.dart';
import 'package:flutter_bloc_app/ui/ios/screens/repo_details/repo_details_page.dart';
import 'package:flutter_bloc_app/ui/ios/shared/components/card.dart';

class CReposLoadedPage extends StatelessWidget {
  final List<RepoModel> repos;

  const CReposLoadedPage({Key key, this.repos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: repos.length,
      itemBuilder: (context, index) => Container(
        padding: index == repos.length - 1
            ? const EdgeInsets.all(8.0)
            : const EdgeInsets.only(left: 8, right: 8, top: 8),
        child: Hero(
          tag: 'expandRepo${repos[index].id}',
          child: CCard(
            onClick: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RepoDetailsPage(repos[index])
                  ),
              );
            },
            radius: 8,
            child: Row(
              children: [
                Text(repos[index].name),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
