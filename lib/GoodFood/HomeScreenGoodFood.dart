import 'package:flutter/material.dart';
import 'package:orojct/GoodFood/Widgte/CostomWidgtTextFeld.dart';
import 'package:orojct/tapBarr.dart';

import '../midProgct2/Stayle/staylText.dart';
import 'Scrins/favarit.dart';
import 'Scrins/home.dart';
import 'Scrins/shoing.dart';
import 'Scrins/sitiingAccont.dart';
import 'Style/DecrionStayle.dart';
import 'Widgte/costomFood.dart';
import 'Widgte/costomFoodCatger.dart';
import 'modle/modelProdactFood.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

class Homescreengoodfood extends StatefulWidget {

  @override
  State<Homescreengoodfood> createState() => _HomescreengoodfoodState();
}

class _HomescreengoodfoodState extends State<Homescreengoodfood> {

  late PersistentTabController _controller;
late  List<Modelproductfood>cart=[];

  Map<String,IconData> mapNavigtor={
    'Home':Icons.home,
    'Shop': Icons.shopping_cart,

    'Faivert' :Icons.favorite,
    'Sitting' :Icons.settings

  };

  late List<Widget> paeg=[
    Home(cart:cart),
    Shoing(cart: cart,),

    Favarit(),
    Sitiingaccont()


  ];

  int index=0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(



      body:

     PersistentTabView(
        context,
        controller: _controller,
        screens: paeg,
        items:mapNavigtor.entries.map((e) {
          return PersistentBottomNavBarItem(
            icon: Icon(e.value),
            title: e.key,
            activeColorPrimary: Colors.blue,
            inactiveColorPrimary: Colors.grey,
          );
        }).toList(),
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen on a non-scrollable screen when keyboard appears. Default is true.
        stateManagement: false, // Default is true.
        hideNavigationBarWhenKeyboardAppears: true,
        popBehaviorOnSelectedNavBarItemPress:PopBehavior.all,
        padding: const EdgeInsets.only(top: 8),
        backgroundColor: Colors.redAccent.shade700,
        isVisible: true,
        animationSettings: const NavBarAnimationSettings(
          navBarItemAnimation: ItemAnimationSettings( // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          ),
          screenTransitionAnimation: ScreenTransitionAnimationSettings( // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            duration: Duration(milliseconds: 200),
            screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
          ),
        ),
        confineToSafeArea: true,
        navBarHeight: kBottomNavigationBarHeight,
        navBarStyle: NavBarStyle.style1, // Choose the nav bar style with this property
      ),
    );



  }
}





    /*BottomNavigationBar(onTap: (value) {

setState(() {
  index=value;
});

      },currentIndex: index,items:mapNavigtor.entries.map((e) => BottomNavigationBarItem(icon: Icon(e.value),label: e.key),).toList() ) ,
    );
  */