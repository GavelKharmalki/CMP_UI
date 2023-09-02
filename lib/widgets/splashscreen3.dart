import 'package:craftmyplateui/screen/onboarding_screen.dart';
import 'package:craftmyplateui/widgets/rightshape.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../constants/apptheme.dart';
import '../screen/homescreen.dart';
import 'leftshape.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({Key? key}) : super(key: key);

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late AnimationController _controllerlogo;
  late Animation<double> _fadeInAnimation;
  late Animation<double> _springAnimation;
  bool _isFirstTextVisible = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _controllerlogo = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeInAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.0, 0.5, curve: Curves.easeIn),
    );

    _springAnimation = CurvedAnimation(
      parent: _controller,
      curve: const Interval(0.5, 1.0, curve: Curves.elasticOut),
    );

    Future.delayed(const Duration(seconds: 1), () {
      _controller.forward();
    });

    Future.delayed(const Duration(seconds: 2), () {
      _controllerlogo.forward();
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isFirstTextVisible = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double getCloudOffset(
      double animationValue, double startPosition, double endPosition) {
    return (endPosition - startPosition) * animationValue;
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), () {
      FirebaseAuth.instance.authStateChanges().listen((User? user) {
        if (user == null) {
          // User is not authenticated, show LoginSignup screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnboardingScreen()),
          );
        } else {
          // User is authenticated, navigate to Home screen
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      });
    });
    return Scaffold(
      backgroundColor: AppTheme.splashbg,
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    //Control Svg animation
                    animation: _controllerlogo,
                    builder: (BuildContext context, Widget? child) {
                      final svgSize = Tween<double>(
                        begin: 0.0,
                        end: 100.0,
                      ).animate(
                        CurvedAnimation(
                          parent: _controllerlogo,
                          curve: Curves.elasticOut,
                        ),
                      );

                      return Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: AnimatedBuilder(
                          animation: svgSize,
                          builder: (BuildContext context, Widget? child) {
                            return SvgPicture.asset(
                              'assets/Logo.svg',
                              width: svgSize.value,
                              height: svgSize.value,
                            );
                          },
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                  AnimatedBuilder(
                    //Control Welcome Animation
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      final textOpacity = _fadeInAnimation.value;
                      final textOffset =
                          getCloudOffset(_fadeInAnimation.value, 0.0, -100.0);
                      return Transform.translate(
                        offset: Offset(0.0, textOffset),
                        child: Opacity(
                          opacity: 1.0 - textOpacity,
                          child: Text("Welcome",
                              style: TextStyle(
                                fontFamily: 'Courgette',
                                fontSize: 50,
                                fontWeight: FontWeight.w400,
                                color: const Color.fromARGB(255, 247, 229, 183),
                              )),
                        ),
                      );
                    },
                  ),
                  AnimatedBuilder(
                    //Control Subtitle Animation
                    animation: _controller,
                    builder: (BuildContext context, Widget? child) {
                      final textOpacity = _fadeInAnimation.value;
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.0, 1.0),
                          end: Offset.zero,
                        ).animate(_springAnimation),
                        child: Opacity(
                          opacity: textOpacity,
                          child: Column(
                            children: [
                              Transform.translate(
                                //Bring up the text into place
                                offset: const Offset(0.0, -40),
                                child: Text('Craft My Plate',
                                    style: TextStyle(
                                      fontFamily: 'Courgette',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(
                                          255, 247, 229, 183),
                                    )),
                              ),
                              Transform.translate(
                                offset: const Offset(0.0, -40),
                                child: Text('You customise, We cater',
                                    style: TextStyle(
                                      fontFamily: 'Courgette',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(
                                          255, 247, 229, 183),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 18),
                ],
              ),
            ),
          ),
          AnimatedBuilder(
            //Move the Clouds
            animation: _controller,
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
            animation: _controller,
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
      ),
    );
  }
}
