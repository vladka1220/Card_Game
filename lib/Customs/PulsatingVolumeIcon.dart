import 'package:flutter/material.dart';

import 'audioplayers.dart';

class PulsatingVolumeIcon extends StatefulWidget {
  //Пульсация
  const PulsatingVolumeIcon({super.key});

  @override
  _PulsatingVolumeIconState createState() => _PulsatingVolumeIconState();
}

class _PulsatingVolumeIconState extends State<PulsatingVolumeIcon>
    with SingleTickerProviderStateMixin {
  //Пульсация
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      lowerBound: 0.6,
      upperBound: 1.0,
    )..repeat(reverse: true);
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
      child: IconButton(
        icon: Icon(
          AudioManager.isPlaying ? Icons.volume_up : Icons.volume_off,
          size: 35.0,
          color: Colors.black,
        ),
        onPressed: () {
          setState(() {
            if (AudioManager.isPlaying) {
              AudioManager.pauseBackgroundMusic();
            } else {
              AudioManager.playBackgroundMusic();
            }
          });
        },
      ),
    );
  }
}
