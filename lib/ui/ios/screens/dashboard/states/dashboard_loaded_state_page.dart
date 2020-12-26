
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/dashboard/dashboard_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/repos_page/repos_page_bloc.dart';
import 'package:flutter_bloc_app/ui/ios/screens/dashboard/components/navigation_item.dart';
import 'package:flutter_bloc_app/ui/ios/screens/repos/repos_page.dart';

import '../dashboard_painter.dart';

class CDashboardLoadedPage extends StatefulWidget {
  final List<NavigationItem> navigationItems;
  final String usuario;

  CDashboardLoadedPage(this.navigationItems, this.usuario);

  @override
  _CDashboardLoadedPageState createState() => _CDashboardLoadedPageState();
}

class _CDashboardLoadedPageState extends State<CDashboardLoadedPage> {

  _CDashboardLoadedPageState();

  @override
  Widget build(context) {
    final bloc = BlocProvider.of<DashboardBloc>(this.context);
    final blocRepos = BlocProvider.of<ReposPageBloc>(this.context);
    return Container(
      child: CustomPaint(
        painter: DashboardPagePainter(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 40, left: 16, right: 16),
                  child: Image.network(
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Octicons-logo-github.svg/1200px-Octicons-logo-github.svg.png',
                  width: 400),
                ),
              ],
            ),
            Column(
              children: [
                Text('${widget.usuario}\'s account'),
                CupertinoButton(
                  child: Text('change'),
                  onPressed: () {
                    bloc.add(ResetUsuario());
                  },
                )
              ],
            ),
            Container(
              padding: EdgeInsets.only(bottom: 16.0),
              child: ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: [
                  ...widget.navigationItems
                      .map((e) => CNavigationItem(navigationItem: e, onPressed: () {
                    if(e.page is CReposPage) {
                      blocRepos.add(LoadReposEvent(widget.usuario));
                    }
                  }))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


