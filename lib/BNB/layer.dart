import 'package:fluid_bottom_nav_bar/fluid_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'account.dart';
import 'grid.dart';
import 'home.dart';
class FluidNavBarDemo extends StatefulWidget {
  const FluidNavBarDemo({Key? key}) : super(key: key);

  @override
  _FluidNavBarDemoState createState() => _FluidNavBarDemoState();
}

class _FluidNavBarDemoState extends State<FluidNavBarDemo> {
  Widget? _child;

  @override
  void initState() {
    _child = HomeContent();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: _child,
      bottomNavigationBar: FluidNavBar(
          style:FluidNavBarStyle(barBackgroundColor: Colors.red,
          // iconSelectedForegroundColor:  Colors.white,
          //   iconUnselectedForegroundColor:  Color(0xFF4285F4),
          ),

        icons: [
          FluidNavBarIcon(
              icon: Icons.home,
 backgroundColor: Color(0xFF4285F4),
               // selectedForegroundColor: Color(0xFF4285F4),
               unselectedForegroundColor:  Colors.white,

              extras: {"label": "home"}),
          FluidNavBarIcon(
              icon: Icons.bookmark_border,
              backgroundColor: Color(0xFFEC4134),
              extras: {"label": "bookmark"}),
          FluidNavBarIcon(
              icon: Icons.apps,
              backgroundColor: Color(0xFFFCBA02),
              extras: {"label": "partner"}),

        ],
        onChange: _handleNavigationChange,
        // style: FluidNavBarStyle(iconUnselectedForegroundColor: Colors.white),
        scaleFactor: 5,
        defaultIndex: 1,
          animationFactor:0,
        itemBuilder: (icon, item) => Semantics(
          label: icon.extras!["label"],
          child: item,
        ),
      ),
    );

  }

  void _handleNavigationChange(int index) {
    setState(() {
      switch (index) {
        case 0:
          _child = HomeContent();
          break;
        case 1:
          _child = AccountContent();
          break;
        case 2:
          _child = GridContent();
          break;
      }
      _child = AnimatedSwitcher(
        switchInCurve: Curves.easeOut,
        switchOutCurve: Curves.easeIn,
        duration: Duration(milliseconds: 500),
        child: _child,
      );
    });
  }
}
