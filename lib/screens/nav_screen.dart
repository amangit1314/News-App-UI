import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:news_app/screens/profile/profile.dart';
import 'package:news_app/screens/saved/saved.dart';
import 'package:news_app/screens/search/search.dart';

import 'home/home.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int _currentIndex = 0;

  void onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Home(),
      Search(),
      Saved(),
      Profile(),
    ];

    return Scaffold(
      extendBody: true,
      body: pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            // color: Colors.transparent,
            borderRadius: BorderRadius.circular(20)),
        height: 70,
        width: MediaQuery.of(context).size.width * 0.9,
        margin: const EdgeInsets.all(15),
        child: Align(
          alignment: FractionalOffset.bottomCenter,
          //this is very important, without it the whole screen will be blurred
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            //I'm using BackdropFilter for the blurring effect
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 10.0,
                sigmaY: 10.0,
              ),
              child: Opacity(
                //you can change the opacity to whatever suits you best
                opacity: 0.8,
                child: BottomNavigationBar(
                  elevation: 0,
                  backgroundColor: Colors.transparent,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  selectedItemColor: Colors.indigo,
                  unselectedItemColor: Colors.indigoAccent.withOpacity(0.6),
                  items: const [
                    BottomNavigationBarItem(
                      icon: Icon(Icons.home_filled),
                      label: 'Home',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.search),
                      label: 'Search',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.save_alt_outlined),
                      label: 'Saved',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
                  onTap: onTap,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
