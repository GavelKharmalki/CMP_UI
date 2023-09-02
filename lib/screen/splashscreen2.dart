import 'package:craftmyplateui/screen/onboarding_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../constants/apptheme.dart';
import '../widgets/bigtext.dart';
import '../widgets/leftshape.dart';
import '../widgets/rightshape.dart';
import 'homescreen.dart';

class SplashScreen2 extends StatefulWidget {
  @override
  _SplashScreen2State createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2>
    with TickerProviderStateMixin {
  late AnimationController _cloudController;
  late AnimationController _logoController;
  late AnimationController _controller;
  late AnimationController _springController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _springAnimation;

  double initialWidth = 88.0;
  double initialHeight = 110.0;
  double targetWidth = 124.0;
  double targetHeight = 141.0;

  bool display = false;
  @override
  void initState() {
    super.initState();

    _cloudController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2), // Adjust the duration as needed
    );

    _cloudController.forward();

    _logoController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _logoController.forward();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _fadeAnimation = Tween<double>(begin: 1.0, end: 0.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    //_controller.forward();
    Future.delayed(Duration(seconds: 1), () {
      _controller.forward();
    });

    _springController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _springAnimation = Tween<Offset>(
      begin: Offset(0.5, -1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _springController,
      curve: Curves.elasticOut,
    ));

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          display = true;
        });
        _springController.forward();
      }
    });

    Future<void> _checkUserAndNavigate() async {
      // Check if a user is already signed in
      final FirebaseAuth _auth = FirebaseAuth.instance;
      User? user = _auth.currentUser;
      if (user != null) {
        // User is signed in, navigate to the home screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      } else {
        // No user is signed in, navigate to the onboarding screen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => OnboardingScreen(),
          ),
        );
      }
    }

    _springController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _checkUserAndNavigate();
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => OnboardingScreen(),
        //     ));
      }
    });
  }

  double getCloudOffset(
      double animationValue, double startPosition, double endPosition) {
    return (endPosition - startPosition) * animationValue;
  }

  @override
  void dispose() {
    _logoController.dispose();
    _controller.dispose();
    _springController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final FirebaseAuth _auth = FirebaseAuth.instance;
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
            Stack(
              alignment: Alignment.center,
              children: [
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _fadeAnimation.value,
                      child: BigText(text: "Welcome"),
                    );
                  },
                ),
                display
                    ? AnimatedBuilder(
                        animation: _springAnimation,
                        builder: (context, child) {
                          return Transform.translate(
                            offset: Offset(0, -100 * _springAnimation.value.dy),
                            child: Column(
                              children: [
                                BigText(text: "Craft My Plate"),
                                Text(
                                  "You customise, We cater",
                                  style: TextStyle(
                                      fontFamily: 'Courgette',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFFF7E5B7)),
                                ),
                              ],
                            ),
                          );
                        },
                      )
                    : Text(""),
                //CLoud shape
                AnimatedBuilder(
                  //Move the Clouds
                  animation: _cloudController,
                  builder: (BuildContext context, Widget? child) {
                    final cloudOffset =
                        getCloudOffset(_controller.value, 0.0, -200.0);
                    return Positioned(
                      top: cloudOffset,
                      right: cloudOffset,
                      child: Opacity(
                        opacity: 1.0 - _controller.value,
                        child: const RightCloudComponent(),
                      ),
                    );
                  },
                ),
                AnimatedBuilder(
                  //Move the Clouds
                  animation: _cloudController,
                  builder: (BuildContext context, Widget? child) {
                    final cloudOffset =
                        getCloudOffset(_controller.value, 0.0, -200.0);
                    return Positioned(
                      bottom: cloudOffset,
                      left: cloudOffset,
                      child: Opacity(
                        opacity: 1.0 - _controller.value,
                        child: const LeftCloudComponent(),
                      ),
                    );
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
