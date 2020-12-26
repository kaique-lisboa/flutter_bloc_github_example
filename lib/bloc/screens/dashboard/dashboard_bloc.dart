import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/bloc/screens/repos_page/repos_page_bloc.dart';
import 'package:flutter_bloc_app/ui/ios/screens/dashboard/components/navigation_item.dart';
import 'package:flutter_bloc_app/ui/ios/screens/repos/repos_page.dart';
import 'package:meta/meta.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  DashboardBloc() : super(DashboardLoading());

  @override
  Stream<DashboardState> mapEventToState(
    DashboardEvent event,
  ) async* {
    print('eventos');
    if(event is LoadDashboard) {
      yield DashboardLoaded(event.usuario);
    }

    if(event is ResetUsuario) {
      state.items = [];
      yield DashboardLoading();
    }
  }
}
