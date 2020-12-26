import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_app/ui/ios/shared/components/card.dart';

class CReposLoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Center(
      child: CCard(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CupertinoActivityIndicator(),
            Text('loading user\'s repos')
          ],
        ),
      ),
    );
  }
}
