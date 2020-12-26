import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_app/model/repo_model.dart';
import 'package:meta/meta.dart';

import 'repos_page_web_service.dart';


part 'repos_page_event.dart';

part 'repos_page_state.dart';

class ReposPageBloc extends Bloc<ReposPageEvent, ReposPageState> {
  ReposPageBloc() : super(ReposPageInitial());

  @override
  Stream<ReposPageState> mapEventToState(ReposPageEvent event,) async* {
    if (event is LoadReposEvent) {
      try {
        if(state is ReposPageLoaded) {
          if (state.user != event.user) {
            yield ReposPageInitial();
            final repos = await fetchRepos(event.user);
            yield ReposPageLoaded(repos, event.user);
          }
        } else if (state is ReposPageInitial) {
          final repos = await fetchRepos(event.user);
          yield ReposPageLoaded(repos, event.user);
        } else if (state is ReposPageError) {
          yield ReposPageInitial();
          final repos = await fetchRepos(event.user);
          yield ReposPageLoaded(repos, event.user);
        }
      } catch(e) {
        yield ReposPageError(e.toString());
      }
    }
  }
}
