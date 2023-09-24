import 'package:cotton_plant/views/home_screen.dart';
import 'package:cotton_plant/views/about_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex = 0;

  List<Widget> screens = [
    HomePageScreen(),
    AboutScreen(),
  ]; // Track the selected index

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Scanner Button Pressed');
        },
        elevation: 0,
        backgroundColor: Color(0xFF85C556),
        child: ClipOval(
          child: Container(
            width: 30.w,
            height: 35.h,
            child: Image.asset(
              "assets/images/scan.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Container(
          height: 56.h,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIconButton(0, Icons.home),
              //_buildIconButton(1, Icons.search),
              SizedBox(width: 32.w),
              _buildIconButton(1, Icons.info,
                  iconSize:
                      24.h), // Use your custom information icon image here
              //_buildIconButton(3, Icons.person_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, dynamic icon, {double iconSize = 24.0}) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            size: iconSize,
            color: _selectedIndex == index ? Colors.green : Colors.grey,
          ),
          onPressed: () {
            print('Button $index Pressed');
            setState(() {
              _selectedIndex = index;
            });

            // Perform navigation based on the selected index
            switch (index) {
              case 0:
                setState(() {
                  _selectedIndex = 0; // Set the home icon as selected
                });
                break;
              case 1:
                setState(() {
                  _selectedIndex = 1;
                });
                break;
            }
          },
        ),
        if (_selectedIndex == index)
          Positioned(
            top: 0,
            child: Container(
              width: 7.w,
              height: 8.h,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
      ],
    );
  }
}
