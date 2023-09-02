import 'package:craftmyplateui/screen/textanimation.screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/apptheme.dart';
import 'homescreen/homescreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _springAnimation;
  //String _firstText = 'Hello';
  //String _secondText = 'Welcome';
  double initialWidth = 88.0;
  double initialHeight = 110.0;
  double targetWidth = 124.0;
  double targetHeight = 141.0;

  @override
  void initState() {
    super.initState();
    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Future.delayed(Duration(seconds: 2), () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          });
        }
      });

    _logoController.forward();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    // _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0)
    //     .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(_controller);
    _springAnimation = Tween<Offset>(
            begin: Offset(0.5, -1.0),
            //end: Offset.zero,
            end: Offset(0.5, 0.0))
        .animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
    // _controller.addStatusListener((status) {
    //   if (status == AnimationStatus.completed) {
    //     //_controller.dispose(); // Dispose the animation controller when done
    //   }
    // });
    _controller.forward();
  }

  @override
  void dispose() {
    _logoController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.splashbg,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _logoController,
              builder: (context, child) {
                return Transform.scale(
                  scale: _logoController.value,
                  child: SvgPicture.asset(
                    'assets/Logo.svg', // Replace with your SVG logo asset
                    width: initialWidth +
                        (targetWidth - initialWidth) * _logoController.value,
                    height: initialHeight +
                        (targetHeight - initialHeight) * _logoController.value,
                  ),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Stack(
                  alignment: Alignment.center,
                  children: [
                    Opacity(
                      opacity: _fadeAnimation.value,
                      child: Text(
                        "Welcome",
                        style: GoogleFonts.capriola(
                            fontSize: 32,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFF7E5B7)),
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
                      child: Column(
                        children: [
                          Text(
                            "Craft My Plate",
                            style: GoogleFonts.capriola(
                                fontSize: 32,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFF7E5B7)),
                          ),
                          Text(
                            "You customise, We cater",
                            style: GoogleFonts.courgette(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Color(0xFFF7E5B7)),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
