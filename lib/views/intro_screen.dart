import 'package:cotton_plant/model/dieases_model..dart';
import 'package:cotton_plant/views/disease_detail_screen.dart';
import 'package:cotton_plant/views/home_screen.dart';
import 'package:cotton_plant/views/about_screen.dart';
import 'package:flutter/material.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
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
            width: 30,
            height: 35,
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
          height: 56.0,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIconButton(0, Icons.home),
              //_buildIconButton(1, Icons.search),
              SizedBox(width: 32.0),
              _buildIconButton(2, Icons.info,
                  iconSize:
                      24.0), // Use your custom information icon image here
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
                // No need to navigate to the same page
                break;
              case 1:
                setState(() {
                  _selectedIndex = 0;
                });
                break;
              case 2:
                setState(() {
                  _selectedIndex = 1; // Set the home icon as selected
                });
                break;
            }
          },
        ),
        if (_selectedIndex == index)
          Positioned(
            top: 0,
            child: Container(
              width: 7,
              height: 8,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green,
              ),
            ),
          ),
      ],
    );
  }
}
