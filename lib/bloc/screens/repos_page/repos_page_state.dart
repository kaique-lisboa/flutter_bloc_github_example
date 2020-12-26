part of 'repos_page_bloc.dart';

@immutable
abstract class ReposPageState {
  String user;
  List<RepoModel> repos;
}

class ReposPageInitial extends ReposPageState {
  final List<RepoModel> repos = [];
}

class ReposPageLoaded extends ReposPageState {
  final List<RepoModel> repos;
  final String user;

  ReposPageLoaded(this.repos, this.user);
}

class ReposPageError extends ReposPageState {
  final String mensagemErro;

  ReposPageError(this.mensagemErro);
}
