import 'package:craftmyplateui/screen/homescreen/homescreen.dart';
import 'package:craftmyplateui/screen/login_screen.dart';
import 'package:craftmyplateui/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../helper/rescale.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _controller = PageController();
  int _currentPage = 0;
  //keeping track which page we are on
  bool onLastPage = false;

  //Pages
  List<Widget> _pages = [
    OnboardingPage(
      colour: Colors.red,
      title: 'Create Your Own Plate',
      description:
          'Create unforgettable memories with our unique feature to curate your favorite cuisines and food, tailored to your special occasion.',
      gifUrl: 'assets/1.gif',
    ),
    OnboardingPage(
      colour: Colors.blue,
      title: 'Exquisite Catering',
      description:
          'Experience culinary artistry like never before with our innovative and exquisite cuisine creations',
      gifUrl: 'assets/2.gif',
    ),
    OnboardingPage(
      colour: Colors.green,
      title: 'Personal Order Executive',
      description:
          'Embark a personalized culinary journey with our dedicated one-to-one customer support, ensuring a seamless and satisfying experience every step of the way.',
      gifUrl: 'assets/3.gif',
    ),
  ];

  _onChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _controller,
                itemCount: _pages.length,
                onPageChanged: _onChanged,
                itemBuilder: (context, int index) {
                  return _pages[index];
                }
                // onPageChanged: (index) {
                //   setState(() {
                //     onLastPage = (index == 2);
                //   });
                // },
                // children: [
                //   Container(
                //     color: Colors.white,
                //   ),
                //   Container(
                //     color: Colors.blue,
                //   ),
                //   Container(
                //     color: Colors.grey,
                //   ),
                // ],
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        border: Border.all(
                          color: Colors.grey.shade200, // Border color
                          width: 1.0, // Border width
                        ),
                        borderRadius:
                            BorderRadius.circular(4.0), // Border radius
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          "Skip",
                          style: GoogleFonts.lexend(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6318AF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    child: SmoothPageIndicator(
                      controller: _controller,
                      count: 3,
                      axisDirection: Axis.horizontal,
                      effect: SwapEffect(
                          spacing: 8.0,
                          //radius: 1.0,
                          dotWidth: 24.0,
                          dotHeight: 8.0,
                          //paintStyle: PaintingStyle.stroke,
                          strokeWidth: 1.5,
                          dotColor: Colors.grey.shade200,
                          activeDotColor: Color(0xFF6318AF)),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: rescale(context, 25),
                // ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: GestureDetector(
                    onTap: () {
                      if (_currentPage == (_pages.length - 1)) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ));
                      } else {
                        _controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      }
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: (_currentPage == (_pages.length - 1) ? 180 : 60),
                      height: 60,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.grey[200], // Outer circle color
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          (_currentPage == (_pages.length - 1))
                              ? Expanded(
                                  child: Center(
                                    child: FutureBuilder<void>(
                                      future: Future.delayed(
                                          Duration(milliseconds: 500)),
                                      builder: (BuildContext context,
                                          AsyncSnapshot<void> snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return Text("");
                                        } else {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen(),
                                                  ));
                                            },
                                            child: Text(
                                              "Get Started",
                                              style: GoogleFonts.lexend(
                                                color: Color(0xFF6318AF),
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                              ),
                                            ),
                                          );
                                        }
                                      },
                                    ),
                                  ),
                                )
                              : Text(""),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xFF6017AA), // Inner circle color
                              ),
                              child: Icon(
                                Icons.arrow_forward_sharp,
                                color: Colors.white,
                                size: 31,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
