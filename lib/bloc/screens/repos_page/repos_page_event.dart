part of 'repos_page_bloc.dart';

@immutable
abstract class ReposPageEvent extends Equatable {}

class LoadReposEvent extends ReposPageEvent {

  final String user;

  LoadReposEvent(this.user);

  @override
  List<Object> get props => null;
}
