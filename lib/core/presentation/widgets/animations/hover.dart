import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  const Hover({
    Key? key,
    this.duration = const Duration(milliseconds: 2500),
    this.deltaY = 20,
    this.curve = Curves.linear,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaY;
  final Widget child;
  final Curve curve;

  @override
  _HoverState createState() => _HoverState();
}

class _HoverState extends State<Hover> with SingleTickerProviderStateMixin {
  late final AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double hover(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, widget.deltaY * hover(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}
