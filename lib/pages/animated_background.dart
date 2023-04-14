import 'package:flutter/material.dart';

class AniBackground extends StatelessWidget {
  const AniBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(145, 131, 222, 1),
            Color.fromRGBO(160, 148, 227, 1),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: topPadding,
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const AnimatedImage()
              ],
            ),
          )),
    );
  }
}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 3),
  )..repeat(reverse: true);

  late Animation<Offset> animation = Tween(
    begin: Offset.zero,
    end: const Offset(0, 0.1),
  ).animate(_controller);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: animation,
      child: Image.asset(
        "images/person_on_rocket.png",
        width: 200.0,
      ),
    );
  }
}
