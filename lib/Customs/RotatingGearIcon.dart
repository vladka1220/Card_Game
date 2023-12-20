import 'package:flutter/material.dart';

class RotatingGearIcon extends StatefulWidget {
  const RotatingGearIcon({Key? key}) : super(key: key);

  @override
  _RotatingGearIconState createState() => _RotatingGearIconState();
}


class _RotatingGearIconState extends State<RotatingGearIcon> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _animationController,
      child: Icon(Icons.settings, size: 35.0, color: Colors.black),
    );
  }
}
