import 'package:flutter/material.dart';
import 'dart:math' show Random;

class AnimatedScreen extends StatefulWidget {
  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 50.0;
  double height = 50.0;
  Color color = Colors.indigo;
  double borderRadius = 10.0;

  void changeShape() {
    final random = Random();
    width = random.nextInt(300) + 50;
    height = random.nextInt(300) + 50;
    borderRadius = random.nextInt(50) + 10;

    color = Color.fromRGBO(
        random.nextInt(255), //red
        random.nextInt(255), //green
        random.nextInt(255), //blue
        1 //opacity
        );

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.bounceOut,
          width: width <= 0 ? 0 : width,
          height: width <= 0 ? 0 : width,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: changeShape,
        child: const Icon(Icons.play_arrow_rounded),
      ),
    );
  }
}
