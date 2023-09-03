import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Escoge la comida', 'Occaecat dolor minim sunt velit velit.',
      'assets/images/1.png'),
  SlideInfo(
      'Entrega rapida',
      'Aliquip nostrud adipisicing occaecat cillum laboris nostrud veniam commodo Lorem laborum sit proident elit.',
      'assets/images/2.png'),
  SlideInfo('Disfruta la comida',
      'Pariatur quis consectetur do sit est aliqua eu.', 'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageviewControler = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageviewControler.addListener(() {
      final page = pageviewControler.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    pageviewControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
              controller: pageviewControler,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slidedata) => _Slide(
                      title: slidedata.title,
                      caption: slidedata.caption,
                      imageUrl: slidedata.imageUrl))
                  .toList()),
          Positioned(
              top: 25,
              right: 15,
              child: TextButton(
                  onPressed: () => context.pop(), child: const Text('Salir'))),
          endReached
              ? Positioned(
                  bottom: 20,
                  right: 20,
                  child: FadeIn(
                    delay: const Duration(milliseconds: 200),
                    child: FilledButton(
                        onPressed: () => context.pop(),
                        child: const Text('Comenzar')),
                  ))
              : const SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20.0),
            Text(
              title,
              style: textStyle,
            ),
            const SizedBox(height: 10.0),
            Text(
              caption,
              style: captionStyle,
            ),
          ],
        ),
      ),
    );
  }
}
