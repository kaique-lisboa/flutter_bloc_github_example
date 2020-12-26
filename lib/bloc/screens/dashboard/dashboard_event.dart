part of 'dashboard_bloc.dart';

@immutable
abstract class DashboardEvent extends Equatable {}

class LoadDashboard extends DashboardEvent {

  final String usuario;

  LoadDashboard(this.usuario);

  @override
  List<Object> get props => null;
}

class ResetUsuario extends DashboardEvent {
  @override
  // TODO: implement props
  List<Object> get props => null;

}


