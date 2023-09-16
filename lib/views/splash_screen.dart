import 'package:cotton_plant/views/intro_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration:const  BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.5,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              color: Color(0xF80D3001),
            ),
          ),
          const Positioned(
            top: 20.0,
            right: 20.0,
            child: Text(
              "Cotton",
              style: TextStyle(
                color: Colors.black,
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Positioned(
            top: 90.0,
            right: 35.0,
            child: Text(
              "Gossypium",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.44,
            width: MediaQuery.of(context).size.width,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Detect a disease &',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 245, 245),
                  fontSize: 24.0,
                  fontFamily: 'univers',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.41,
            width: MediaQuery.of(context).size.width,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'save our cotton',
                style: TextStyle(
                  color: Color.fromARGB(255, 250, 245, 245),
                  fontSize: 24.0,
                  fontFamily: 'univers',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.29,
            width: MediaQuery.of(context).size.width,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Detect a disease and help',
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 240, 150),
                  fontSize: 20.0,
                  fontFamily: 'univers',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width,
            child: const Align(
              alignment: Alignment.topCenter,
              child: Text(
                'us to cure our cotton',
                style: TextStyle(
                  color: Color.fromARGB(255, 98, 240, 150),
                  fontSize: 20.0,
                  fontFamily: 'univers',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.06,
            width: MediaQuery.of(context).size.width,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 50,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  IntroPage( )),
                    );
                  },
                
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(64, 152, 12, 1),
                    onPrimary: Colors.white,
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'univers',
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
