import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/dashboard/dashboard_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/repos_page/repos_page_bloc.dart';
import 'package:flutter_bloc_app/model/repo_model.dart';
import './states/repos_page_error.dart';
import './states/repos_page_loading.dart';
import './states/repos_page_loaded.dart';
import 'package:supercharged/supercharged.dart';

class CReposPage extends StatelessWidget {

  // Loading Repositories decoration
  final Decoration loadingDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.blue.shade300, Colors.cyan],
    ),
  );

  // Failed Loading Repos Decoration
  final Decoration failureDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.red, Colors.redAccent],
    ),
  );

  // Success on loading Decoration
  final Decoration successDecoration = BoxDecoration(
    gradient: LinearGradient(
      colors: [Colors.green, Colors.lightGreen],
    ),
  );

  getDecoration (ReposPageState state){
    if(state is ReposPageLoaded) return successDecoration;
    if(state is ReposPageInitial) return loadingDecoration;
    if(state is ReposPageError) return failureDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('my repos'),
      ),
      child: BlocBuilder<ReposPageBloc, ReposPageState>(
        builder: (context, state) => TweenAnimationBuilder<Decoration>(
          duration: 300.milliseconds,
          curve: Curves.easeOut,
          tween: DecorationTween(
            begin: loadingDecoration,
            end: getDecoration(state)
          ),
          builder: (context, decoration, a) => Container(
            decoration: decoration,
            // BlocProvider for
            child: BlocBuilder<ReposPageBloc, ReposPageState>(
                builder: (context, state) {
              if (state is ReposPageInitial) {
                return Center(
                  child: CReposLoadingPage(),
                );
              }

              if (state is ReposPageLoaded) {
                return CReposLoadedPage(repos: state.repos);
              }

              if (state is ReposPageError) {
                return CReposErrorPage();
              }

              return null;
            }),
          ),
        ),
      ),
    );
  }
}
