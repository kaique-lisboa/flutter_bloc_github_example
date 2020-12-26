import 'dart:convert';

import 'package:flutter_bloc_app/model/repo_model.dart';
import 'package:http/http.dart' as http;

Future<List<RepoModel>> fetchRepos(String user) async {
  http.Response res = await http.get('https://api.github.com/users/$user/repos' );
  if(res.statusCode == 200) {
    List<dynamic> reposArr = (await jsonDecode(res.body));
    return reposArr.map((e) => RepoModel.fromJson(e)).toList();
  }
  throw Exception('não foi possível obter os repositórios: ${res.headers['status']}');
}