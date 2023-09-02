import 'package:craftmyplateui/screen/homescreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';

import '../../helper/rescale.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [Container(), Container(), HomeScreen(), Container(), Container()];
    // Return your list of screen widgets here
    // For example: [Screen1(), Screen2(), Screen3()]
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    // Return your list of navigation bar items here
    // For example:
    return [
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.house),
        iconSize: rescale(context, 22),
        //icon: Image.asset('assets/LogoNav.png', width: 32, height: 32),
        title: 'Home',
        activeColorPrimary: Color(0xFF6318AF),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: FaIcon(FontAwesomeIcons.heart),
        iconSize: rescale(context, 22),
        //icon: Image.asset('assets/LogoNav.png', width: 32, height: 32),
        title: 'Wishlist',
        activeColorPrimary: Color(0xFF6318AF),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.3, // Adjust the scale factor as needed
          child: Image.asset(
              'assets/LogoNav.png'), // Replace with your image asset
        ),
        //title: '',
        activeColorPrimary: Colors.transparent,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        //icon: Icon(Icons.food),
        icon: Transform.scale(
          scale: 1.3, // Adjust the scale factor as needed
          child: Image.asset('assets/dinner plate.png'),
        ),
        iconSize: 50,
        title: 'Orders',
        activeColorPrimary: Color(0xFF6318AF),
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: Transform.scale(
          scale: 1.3, // Adjust the scale factor as needed
          child: Image.asset('assets/user-circle.png'),
        ),
        //icon: Image.asset('assets/LogoNav.png', width: 32, height: 32),
        title: 'Profile',
        activeColorPrimary: Color(0xFF6318AF),
        inactiveColorPrimary: Colors.grey,
      ),
      // Add more items as needed
    ];
  }

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        //borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style15, // Choose the nav bar style with this property.
    );
  }
}
