import 'package:fast_app_base/common/common.dart';
import 'package:fast_app_base/common/widget/w_arrow.dart';
import 'package:fast_app_base/common/widget/w_tap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AnimatedAppBar extends StatefulWidget {
  final String title;
  final ScrollController scrollController;
  final AnimationController animationController;

  const AnimatedAppBar(this.title,
      {super.key,
      required this.scrollController,
      required this.animationController});
  @override
  State<AnimatedAppBar> createState() => _AnimatedAppBarState();
}

class _AnimatedAppBarState extends State<AnimatedAppBar>
    with SingleTickerProviderStateMixin {
  Duration get duration => 10.ms;
  double scrollPosition = 0;

  // late final animationController =
  //     AnimationController(vsync: this, duration: 2000.ms);
  // late Animation animation =
  //     ColorTween(begin: Colors.blue, end: Colors.red).animate(controller);
  late CurvedAnimation animation = CurvedAnimation(
      parent: widget.animationController, curve: Curves.bounceInOut);

  @override
  void initState() {
    // controller.forward(); // start 기능
    // controller.reverse(); // 반대로
    // controller.repeat();
    // controller.animateTo(target);
    // controller.animateBack(target);

    widget.animationController.addListener(() {
      setState(() {});
    });

    // TODO: implement initState
    widget.scrollController.addListener(() {
      setState(() {
        scrollPosition = widget.scrollController.position.pixels;
      });
    });
    super.initState();
  }

  bool get isTriggered => scrollPosition > 80;
  bool get isNotTriggered => !isTriggered;

  double getValue(double initial, double target) {
    if (isTriggered) {
      return target;
    }
    double fraction = scrollPosition / 80;
    return initial + (target - initial) * fraction;
  }

  @override
  Widget build(BuildContext context) {
    // duration = 250.ms;
    return Container(
      color: context.backgroundColor,
      child: SafeArea(
        child: Stack(
          children: [
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const Arrow(
                  direction: AxisDirection.left,
                )).p20(),
            AnimatedContainer(
                duration: duration,
                padding: EdgeInsets.only(
                    // left: isNotTriggered ? 20 : 50,
                    // top: isNotTriggered ? 50 : 15),
                    left: getValue(20, 50),
                    top: getValue(50, 15)),
                child: AnimatedDefaultTextStyle(
                    style: TextStyle(
                        fontSize: isNotTriggered ? 30 : 18,
                        fontWeight: FontWeight.bold),
                    duration: duration,
                    child: widget.title.text.make())),
            Tap(
                onTap: () {
                  Nav.pop(context);
                },
                child: const Arrow(
                  direction: AxisDirection.left,
                )).p20(),
            Positioned(
                left: animation.value * 200,
                child: TweenAnimationBuilder<Color?>(
                  duration: 1000.ms,
                  tween: ColorTween(
                      begin: Colors.green,
                      end: isTriggered ? Colors.orange : Colors.green),
                  builder: (context, value, child) => Image.asset(
                    "$basePath/icon/map_point.png",
                    height: 60,
                    color: value,
                    colorBlendMode: BlendMode.modulate,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
