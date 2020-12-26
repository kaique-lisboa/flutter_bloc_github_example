import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/repos_page/repos_page_bloc.dart';

import 'bloc/screens/dashboard/dashboard_bloc.dart';
import 'ui/ios/screens/dashboard/dashboard_page.dart';

void main() {
  runApp(CupertinoGitManagerApp());
}

const String titulo = 'GitHub Viewer';

class CupertinoGitManagerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DashboardBloc>(
          create: (context) => DashboardBloc(),
        ),
        BlocProvider<ReposPageBloc>(
          create: (context) => ReposPageBloc(),
        ),
      ],
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        theme: CupertinoThemeData(primaryColor: Colors.blue),
        title: titulo,
        // theme: ThemeData(
        //   // This is the theme of your application.
        //   //
        //   // Try running your application with "flutter run". You'll see the
        //   // application has a blue toolbar. Then, without quitting the app, try
        //   // changing the primarySwatch below to Colors.green and then invoke
        //   // "hot reload" (press "r" in the console where you ran "flutter run",
        //   // or simply save your changes to "hot reload" in a Flutter IDE).
        //   // Notice that the counter didn't reset back to zero; the application
        //   // is not restarted.
        //   primarySwatch: Colors.blue,
        // ),
        home: CDashboardPage(),
      ),
    );
  }
}
