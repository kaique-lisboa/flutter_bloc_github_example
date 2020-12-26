import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_app/ui/styles/box_shadows.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:supercharged/supercharged.dart';


class CNavigationItem extends StatefulWidget {
  final NavigationItem navigationItem;
  final Function onPressed;
  final BuildContext context;

  CNavigationItem(
      {@required this.navigationItem, this.context, @required this.onPressed});

  @override
  _CNavigationItemState createState() => _CNavigationItemState();
}

class _CNavigationItemState extends State<CNavigationItem>
    with TickerProviderStateMixin {

  initState() {
    super.initState();
  }

  CustomAnimationControl _control = CustomAnimationControl.STOP;

  MultiTween<EAnimationParams> _tween = MultiTween<EAnimationParams>()
    ..add(EAnimationParams.scaleFactor, 1.0.tweenTo(0.95))
    ..add(EAnimationParams.gradientStart, Colors.blue.shade300.tweenTo(Colors.purple))
    ..add(EAnimationParams.gradientEnd, Colors.cyan.tweenTo(Colors.red.shade300))
    ..add(EAnimationParams.borderRadius, 64.0.tweenTo(16.0))
    ..add(EAnimationParams.shadowLength, 16.0.tweenTo(8.0));


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _control = CustomAnimationControl.PLAY;
        });
      },
      onTapCancel: () {
        setState(() {
          _control = CustomAnimationControl.PLAY_REVERSE_FROM_END;
        });
      },
      onTapUp: (_) {
        this.widget.onPressed();
        Navigator.push(
            context,
            CupertinoPageRoute(
                builder: (context) => widget.navigationItem.page));
        setState(() {
          _control = CustomAnimationControl.PLAY_REVERSE_FROM_END;
        });
      },
      child: CustomAnimation<MultiTweenValues<EAnimationParams>>(
        curve: _control == CustomAnimationControl.PLAY ? Curves.easeOutExpo : Curves.easeInQuint,
        control: _control,
        duration: _control == CustomAnimationControl.PLAY ? 200.milliseconds : 500.milliseconds,

        tween: _tween,
        builder: (BuildContext context, child, value) =>
            Transform.scale(
              scale: value.get(EAnimationParams.scaleFactor),
              child: Container(
                padding: EdgeInsets.all(16),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(value.get(EAnimationParams.borderRadius)),
                    gradient:
                    LinearGradient(colors: [value.get(EAnimationParams.gradientStart), value.get(EAnimationParams.gradientEnd)]),
                    boxShadow: [
                      BoxShadowsStyles.soft(value.get(EAnimationParams.shadowLength))
                    ]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.navigationItem.titulo,
                      style:
                      TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      CupertinoIcons.right_chevron,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}

class _AnimationParams {

  final double shadowLength;
  final double scaleFactor;
  final double borderRadius;
  final Color gradientStart;
  final Color gradientEnd;

  _AnimationParams({this.shadowLength, this.scaleFactor, this.borderRadius,
      this.gradientStart, this.gradientEnd});
}

enum EAnimationParams {
   shadowLength,
   scaleFactor,
   borderRadius,
  gradientStart,
  gradientEnd,
}

class NavigationItem {
  final String titulo;
  final Widget page;
  final dynamic extras;

  NavigationItem(this.titulo, this.page, {this.extras});
}
