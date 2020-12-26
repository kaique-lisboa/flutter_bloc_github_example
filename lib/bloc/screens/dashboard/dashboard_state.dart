part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardState {
  List<NavigationItem> items = [];
  String usuario = 'kakaique2000';
}

class DashboardLoaded extends DashboardState {

  final String usuario;

  final items = [
  NavigationItem('see repos', CReposPage()),
  ];

  DashboardLoaded(this.usuario);

}

class DashboardLoading extends DashboardState {}
