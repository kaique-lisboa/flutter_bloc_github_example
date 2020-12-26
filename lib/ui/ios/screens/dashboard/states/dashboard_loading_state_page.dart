import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_app/bloc/screens/dashboard/dashboard_bloc.dart';

class CDashboardLoader extends StatefulWidget {
  BuildContext context;

  CDashboardLoader(this.context);

  @override
  _CDashboardLoaderState createState() => _CDashboardLoaderState(context);
}

class _CDashboardLoaderState extends State<CDashboardLoader> {
  final BuildContext context;

  _CDashboardLoaderState(this.context);


  final TextEditingController userController = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => showDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoButton.filled(
            onPressed: () => showDialog(),
            child: Text('select user'),
          ),
        ],
      ),
    );
  }

  showDialog() {

    return showCupertinoDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => CustomAlert(controller: userController),
    );
  }
}

class CustomAlert extends StatefulWidget {

  final TextEditingController controller;

  const CustomAlert({Key key, this.controller}) : super(key: key);

  @override
  _CustomAlertState createState() => _CustomAlertState();
}

class _CustomAlertState extends State<CustomAlert> {

  bool _isDisabled;

  initState() {
    _isDisabled = true;
  }

  @override
  Widget build(BuildContext context) {
    final blocDash = BlocProvider.of<DashboardBloc>(context);
    return CupertinoAlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('insert the username'),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: CupertinoTextField(
                  controller: widget.controller,
                  onChanged: (value) {
                    if (value.length > 2) {
                      setState(() {
                        _isDisabled = false;
                      });
                    } else {
                      setState(() {
                        _isDisabled = true;
                      });
                    }
                  },
                ),
              ),
            ],
          ),
          CupertinoButton(
            child: Text('send'),
            onPressed: _isDisabled
                ? null
                : () {
              blocDash.add(LoadDashboard(widget.controller.text));
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}

