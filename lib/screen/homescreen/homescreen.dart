import 'package:craftmyplateui/helper/rescale.dart';
import 'package:craftmyplateui/screen/homescreen/carousel_item.dart';
import 'package:craftmyplateui/screen/homescreen/categories_item.dart';
import 'package:craftmyplateui/screen/homescreen/custom_card.dart';
import 'package:craftmyplateui/screen/homescreen/plate.dart';
import 'package:craftmyplateui/screen/homescreen/reusable_card.dart';
import 'package:craftmyplateui/screen/homescreen/right_circle.dart';
import 'package:craftmyplateui/screen/homescreen/services_card.dart';
import 'package:craftmyplateui/screen/homescreen/starter_card.dart';
import 'package:craftmyplateui/splashscreen3.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:pinput/pinput.dart';
import '../../location.dart';
import '../../model/main_course_model.dart';
import '../../model/service_card_model.dart';
import '../login_screen.dart';
import '../splashscreen2.dart';
import 'left_circle.dart';
import 'navbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<String?> userName;
  //late Future<String?> locationFuture;
  String? location;

  Future<String?> userNameFirebase() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      await currentUser.reload(); // Refresh user data from Firebase
      currentUser = FirebaseAuth.instance.currentUser; // Get updated user data
      return currentUser?.displayName;
    }
    return null;
  }

  // Future<String?> fetchUserLocation() async {
  //   final locationService = LocationCity();
  //   final userCity = await locationService.getUserCity();
  //   setState(() {
  //     location = userCity ?? 'Bangalore';
  //   });
  //   return location;
  // }

  @override
  void initState() {
    //locationFuture = fetchUserLocation();
    userName = userNameFirebase();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenSize = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.transparent,
        bottomNavigationBar:
            Container(height: rescale(context, 55), child: NavBar()),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///User's name
              Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: FutureBuilder<String?>(
                        future: userName,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              width: 20,
                              height: 20,
                              child:
                                  CircularProgressIndicator(color: Colors.blue),
                            );
                          } else if (snapshot.hasError) {
                            return Text(
                                'Error: ${snapshot.error}'); // Show an error message if there was an error
                          } else {
                            final displayName = snapshot.data;

                            return GestureDetector(
                              onTap: () {
                                _showLogoutDialog(context);
                              },
                              child: Text(
                                "Hi, $displayName!",
                                style: GoogleFonts.lexend(
                                  fontSize: rescale(context, 22),
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6318AF),
                                ),
                              ),
                            );
                          }
                        }),
                  ),
                ),
              ),

              ///Map
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Current location",
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 12),
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF7B7B7B),
                          ),
                        ),
                        // FutureBuilder<String?>(
                        //     future: locationFuture,
                        //     builder: (context, snapshot) {
                        //       if (snapshot.connectionState ==
                        //           ConnectionState.waiting) {
                        //         return const SizedBox(
                        //             height: 10,
                        //             width: 10,
                        //             child: CircularProgressIndicator());
                        //       } else if (snapshot.hasError) {
                        //         return const Text('Error retrieving location');
                        //       } else {
                        //         final locationData = snapshot.data;
                        //         return
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              size: rescale(context, 16),
                              color: Color(
                                  0xFF6318AF), // Set the desired color for the icon
                            ),
                            Text(
                              "Bangalore",
                              style: GoogleFonts.lexend(
                                fontSize: rescale(context, 12),
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        //}
                      ],
                    ),
                    Spacer(),
                    //Play button
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SplashScreen3(),
                                ));
                          },
                          child: Icon(
                            Icons.play_circle_outline,
                            size: rescale(context, 24),
                            color: Color(
                                0xFF6318AF), // Set the desired color for the icon
                          ),
                        ),
                        Text(
                          "How it works?",
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 10),
                            fontWeight: FontWeight.w300,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              ///Carousel Slider
              CarouselItem(),

              ///Search Bar
              Card(
                elevation: 0,
                margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Container(
                  //margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x1A7A20D4),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset:
                            Offset(0, 1), // Adjust the offset for the shadow
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search food or events',
                            hintStyle: GoogleFonts.lexend(
                              fontSize: rescale(context, 14),
                              fontWeight: FontWeight.w300,
                              color: Color(0xFF545454),
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.search,
                        color: Color(0xFF6318AF),
                      ),
                    ],
                  ),
                ),
              ),

              ///Start Crafting Text
              Container(
                  margin: EdgeInsets.only(top: 24, left: 24, bottom: 5),
                  //color: Colors.red,
                  width: rescale(context, 325),
                  height: rescale(context, 30),
                  child: Text(
                    "Start Crafting",
                    style: GoogleFonts.lexend(
                      fontSize: rescale(context, 20),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF6318AF),
                    ),
                  )),
              //Container(
              //   height: 100,
              //   margin: const EdgeInsets.only(left: 20),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: ReusableCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Grilled Chicken",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: ReusableCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: ReusableCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ///Start Crafting cards
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(
                      child: SizedBox(
                        child: StarterCard(
                          text: 'Default Platters',
                          imageUrl:
                              'assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png',
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(
                        child: StarterCard(
                          text: 'Craft Your Own',
                          imageUrl:
                              'assets/traditional-indian-soup-lentils-indian-dhal-spicy-curry-bowl-spices-herbs-rustic-black-wooden-table.png',
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              ///Container with plate
              Container(
                height: rescale(context, 180),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 8 : 0),
                      child: ContainerWithShape(),
                    );
                  },
                ),
              ),

              ///Top Categories text
              Container(
                margin: EdgeInsets.only(left: 24, bottom: 5),
                //color: Colors.red,
                width: rescale(context, 325),
                height: rescale(context, 30),
                child: Text(
                  "Top Categories",
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 18),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
              ),

              ///Categories Items
              CategoriesItem(),

              ///Starters text
              Container(
                  margin: EdgeInsets.only(top: 10, left: 24, bottom: 5),
                  //color: Colors.red,
                  width: rescale(context, 325),
                  height: rescale(context, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Start Crafting",
                        style: GoogleFonts.lexend(
                          fontSize: rescale(context, 18),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        "More Starters",
                        style: GoogleFonts.lexend(
                          fontSize: rescale(context, 12),
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF6318AF),
                        ),
                      )
                    ],
                  )),

              ///Start Crafting Cards
              Container(
                //margin: EdgeInsets.only(top: 24, left: 24, bottom: 5),
                height: rescale(context, 120),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    //final menuItem = menuItems[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24 : 10),
                      child: ReusableCard(
                        imageUrl: menuItems[index].imageUrl,
                        text: menuItems[index].text,
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Grilled Chicken",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              ///Main Course text
              Container(
                  margin: EdgeInsets.only(top: 10, left: 24, bottom: 5),
                  //color: Colors.red,
                  width: rescale(context, 325),
                  height: rescale(context, 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Main Course",
                        style: GoogleFonts.lexend(
                          fontSize: rescale(context, 18),
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Text(
                          "More Main Courses",
                          style: GoogleFonts.lexend(
                            fontSize: rescale(context, 12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF6318AF),
                          ),
                        ),
                      )
                    ],
                  )),

              ///Main Course Card
              Container(
                //margin: EdgeInsets.only(top: 24, left: 24, bottom: 5),
                height: rescale(context, 120),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: courseItems.length,
                  itemBuilder: (context, index) {
                    //final courseItem = courseItems[index];
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 24 : 10),
                      child: ReusableCard(
                        imageUrl: courseItems[index].imageUrl,
                        text: courseItems[index].text,
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(left: 20),
              //   child: SingleChildScrollView(
              //     scrollDirection: Axis.horizontal,
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.end,
              //       children: [
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Grilled Chicken",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //         SizedBox(
              //           width:
              //               120, // Set a specific width for the CustomCard widget
              //           child: CustomCard(
              //             imageUrl:
              //                 "assets/plate-food-with-different-dishes-including-chicken-rice-other-food 1.png",
              //             text: "Mashroom Fry",
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              ///Services Text
              Container(
                margin: EdgeInsets.only(top: 10, left: 24),
                //color: Colors.red,
                width: rescale(context, 325),
                height: rescale(context, 30),
                child: Text(
                  "Services",
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 20),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
              ),

              ///Services Card
              Container(
                height: (screenSize < 680
                    ? rescale(context, 330)
                    : rescale(context, 310)),
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: serviceItems.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.only(left: index == 0 ? 20 : 10),
                      child: ServicesCard(
                        imageUrl: serviceItems[index].imageUrl,
                        iconImage: serviceItems[index].iconImage,
                        iconText: serviceItems[index].iconText,
                        des1: serviceItems[index].des1,
                        des2: serviceItems[index].des2,
                        des3: serviceItems[index].des3,
                        des4: serviceItems[index].des4,
                      ),
                    );
                  },
                ),
              ),
              //How does it work
              Container(
                margin: EdgeInsets.only(top: 10, left: 24, bottom: 5),
                //color: Colors.red,
                width: rescale(context, 325),
                height: rescale(context, 30),
                child: Text(
                  "How does it work?",
                  style: GoogleFonts.lexend(
                    fontSize: rescale(context, 20),
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF000000),
                  ),
                ),
              ),
              //Left and right circle
              Container(
                //margin: const EdgeInsets.only(left: 24),
                child: Column(children: [
                  LeftCircle(
                    imageUrl: 'assets/Group 739.svg',
                    title: "Customize Menu",
                    subtitle:
                        "Select items for a single event or multiple events",
                  ),
                  RightCircle(
                    imageUrl: 'assets/Group 2198.svg',
                    title: "Choose Services",
                    subtitle:
                        "Select the type of services from varying cutlery, mode of serving options, & more",
                  ),
                  LeftCircle(
                    imageUrl: 'assets/Frame 2270.svg',
                    title: "Dynamic Pricing",
                    subtitle:
                        "Price per plate varies with no. of items in a plate and no. of plates selected",
                  ),
                  RightCircle(
                    imageUrl: 'assets/Group 738.svg',
                    title: "Track Your Order",
                    subtitle:
                        "Track the order status and seek help from the executives anytime",
                  ),
                  LeftCircle(
                    imageUrl: 'assets/Frame 2271.svg',
                    title: "Taste Your Sample",
                    subtitle:
                        "Explode your taste bud with samples of what you order(on request for eligible orders)",
                  ),
                  RightCircle(
                    imageUrl: 'assets/Frame 2272.svg',
                    title: "Enjoy Food and Services",
                    subtitle: "Enjoy event with delicious and customized food",
                  ),
                ]),
              ),
              //Delicious food with professional Service text
              Container(
                  color: Color(0xFFF8F8F8),
                  width: rescale(context, 376),
                  height: rescale(context, 132),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 20),
                    child: Text(
                      "Delicious food with professional service !",
                      style: GoogleFonts.lexend(
                        fontSize: rescale(context, 25),
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF242424),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout?'),
          content: Text('Are you sure you want to log out?'),
          actions: <Widget>[
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                try {
                  // Sign out the user
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pop(); // Close the dialog
                  // Navigate to the login or home screen
                  // You can replace this with your desired navigation logic
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return SplashScreen3(); // Replace with the screen you want to navigate to
                      },
                    ),
                  );
                } catch (e) {
                  print('Error logging out: $e');
                }
              },
            ),
          ],
        );
      },
    );
  }
}
