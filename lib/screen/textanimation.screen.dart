import 'package:flutter/material.dart';

class TextAnimationScreen extends StatefulWidget {
  const TextAnimationScreen({Key? key}) : super(key: key);

  @override
  State<TextAnimationScreen> createState() => _TextAnimationScreenState();
}

class _TextAnimationScreenState extends State<TextAnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _springAnimation;
  String _firstText = 'Hello';
  String _secondText = 'Welcome';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);

    _springAnimation = Tween<Offset>(
      begin: Offset(0.0, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutCubic,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.dispose(); // Dispose the animation controller when done
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose(); // Dispose the animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (BuildContext context, Widget? child) {
            final textOpacity = _fadeAnimation.value;
            // final textOffset =
            //     _springAnimation.value.dy * (1.0 - _controller.value);
            return Stack(
              alignment: Alignment.center,
              children: [
                Opacity(
                  opacity: textOpacity,
                  child: Text(
                    _firstText,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                AnimatedBuilder(
                  animation: _springAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, -100 * _springAnimation.value.dy),
                      child: child,
                    );
                  },
                  child: Text(
                    _secondText,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
