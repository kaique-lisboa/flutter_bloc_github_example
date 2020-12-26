import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/dashboard/dashboard_bloc.dart';
import 'package:flutter_bloc_app/ui/ios/shared/components/card.dart';
import 'package:flutter_bloc_app/ui/styles/box_shadows.dart';

class CReposErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<DashboardBloc>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: CCard(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text('unable to fetch ${bloc.state.usuario}\' repos'),
              CupertinoButton(
                  onPressed: () {
                    Navigator.pop(context);
                    bloc.add(ResetUsuario());
                  },
                  child: Text('set another username'))
            ],),
          )
        ),
      ],
    );
  }
}
