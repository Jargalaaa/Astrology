import 'package:flutter/material.dart';

class Startpage extends StatelessWidget {
  const Startpage({super.key});

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            width: screenWidth,
            height: screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/stars_background.jpg'),
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
          ),
          // Centered content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/earth.png',
                  width: 215,
                  height: 215,
                ),
                const SizedBox(
                  height: 60, // Space between the image and the button
                ),
              ],
            ),
          ),
          // Positioned button at the bottom center
          Positioned(
            bottom:
                30, // You can adjust this value to fine-tune the button position
            left: screenWidth *
                0.25, // Position button at the center horizontally
            child: SizedBox(
              width: 200, // Set width of the button
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/login');
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(
                    color: Color.fromARGB(255, 248, 185, 255), // Border color
                    width: 2, // Border width
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 15), // Padding inside the button
                  backgroundColor: const Color.fromARGB(
                      255, 16, 17, 54), // Background color of the button
                ),
                child: const Text(
                  'эхлэх',
                  style: TextStyle(
                    color: Colors.white, // Text color
                    fontSize: 18, // Text size
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  } // End of build method
}
