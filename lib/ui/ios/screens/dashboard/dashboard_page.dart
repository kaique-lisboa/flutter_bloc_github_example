import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/dashboard/dashboard_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/repos_page/repos_page_bloc.dart';
import 'package:flutter_bloc_app/ui/ios/screens/dashboard/states/dashboard_loaded_state_page.dart';
import 'package:flutter_bloc_app/ui/ios/screens/repos/repos_page.dart';
import 'components/navigation_item.dart';
import 'states/dashboard_loading_state_page.dart';

class CDashboardPage extends StatefulWidget {
  @override
  _CDashboardPageState createState() => _CDashboardPageState();
}

class _CDashboardPageState extends State<CDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('home'),
      ),
      child: BlocBuilder<DashboardBloc, DashboardState>(
          builder: (context, state) {
        if (state is DashboardLoading) {
          return Center(
            child: CDashboardLoader(context),
          );
        }

        if (state is DashboardLoaded) {
          return Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: CDashboardLoadedPage(
              state.items,
              state.usuario
            ),
          );
        }

        return null;
      }),
    );
  }
}
