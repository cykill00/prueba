import 'package:flutter/material.dart';

class AnimatedScreen extends StatelessWidget {
  const AnimatedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Screen'),
        centerTitle: true,
      ),
      body: const _AnimatedView(),
    );
  }
}

class _AnimatedView extends StatelessWidget {
  const _AnimatedView();

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
