import 'package:flutter/material.dart';

import 'homescreen/navbar.dart';

class Nav extends StatelessWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: NavBar());
  }
}
