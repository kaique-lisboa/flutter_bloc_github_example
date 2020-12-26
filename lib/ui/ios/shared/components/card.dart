import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/ui/styles/box_shadows.dart';

class CCard extends StatelessWidget {
  final Widget child;
  final double radius;
  final double shadow;
  final bool activated;
  final Function onClick;

  const CCard({Key key, this.child, this.radius = 16, this.onClick, this.shadow = 16, this.activated = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadowsStyles.soft(shadow),
      ]),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          customBorder: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
          onTap: () {
            if(onClick != null) onClick();
          },
          highlightColor: Colors.transparent,
          focusColor: Colors.transparent,
          hoverColor: Colors.transparent,
          splashColor: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: child,
          ),
        ),
      ),
    );
  }
}
