import 'package:flutter/material.dart';
import '../navbar/navBar.dart';

class PlanetPage extends StatefulWidget {
  @override
  _PlanetPageState createState() => _PlanetPageState();
}

class _PlanetPageState extends State<PlanetPage> {
  int _selectedIndex = 0;

  // List of items for the navigation bar
  final List<Map<String, String>> navItems = [
    {'iconPath': 'assets/menu/today.png', 'label': 'Өнөөдөр'},
    {'iconPath': 'assets/menu/month.png', 'label': 'Сар'},
    {'iconPath': 'assets/menu/orduud.png', 'label': 'Хослол'},
    {'iconPath': 'assets/menu/hoslol.png', 'label': 'Ордууд'},
    {'iconPath': 'assets/menu/profile.png', 'label': 'Профайл'},
  ];

  String selectedPlanet = 'Cap'; // Default planet
  double selectedScale = 1.2; // Scale for selected planet
  double otherScale = 1.0; // Scale for other planets

  // List of planets data with descriptions
  final List<Map<String, String>> planets = [
    {
      'name': 'Cap',
      'image': 'assets/moon.png',
      'description':
          'Cap is a fictional planet with a mystical landscape.Cap is a fictional planet with a mystical landscapeCap is a fictional planet with a mystical landscapeCap is a fictional planet with a mystical landscape',
    },
    {
      'name': 'Mars',
      'image': 'assets/mars.png',
      'description':
          'Mars, the Red Planet, is famous for its dry surface and red color.',
    },
    {
      'name': 'Sun',
      'image': 'assets/sun.png',
      'description':
          'The Sun is the center of our solar system and provides energy for Earth.The Sun is the center of our solar system and provides energy for Earth.The Sun is the center of our solar system and provides energy for Earth.The Sun is the center of our solar system and provides energy for Earth.',
    },
    {
      'name': 'Earth',
      'image': 'assets/earth.png',
      'description':
          'Earth is our home planet, known for its rich biodiversity and atmosphere.',
    },
    {
      'name': 'Venus',
      'image': 'assets/sugar.png',
      'description':
          'Venus is known for its dense clouds and scorching temperatures.',
    },
    {
      'name': 'Jupiter',
      'image': 'assets/barhasbadi.png',
      'description':
          'Jupiter is the largest planet in the Solar System with its iconic Great Red Spot.',
    },
    {
      'name': 'Saturn',
      'image': 'assets/sanchir.png',
      'description': 'Saturn is famous for its rings, made of ice and rock.',
    },
  ];

  // Function to handle the selected item in the navigation bar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  // ScrollController for scrolling between planets
  ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      body: SafeArea(
        child: Column(
          children: [
            // Top Spacing for planets
            SizedBox(height: 20),

            // Planets (Fixed with animation)
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _scrollController,
                  itemCount: planets.length,
                  clipBehavior: Clip.none,
                  itemBuilder: (context, index) {
                    final planet = planets[index];
                    final isSelected = planet['name'] == selectedPlanet;

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPlanet = planet['name']!;
                        });

                        // Calculate the offset to center the selected planet
                        double screenWidth = MediaQuery.of(context).size.width;
                        double itemWidth =
                            140.0; // Adjust to match your item's actual width
                        double targetOffset =
                            (index * itemWidth) - (screenWidth - itemWidth) / 2;

                        // Clamp the offset to ensure it stays within bounds
                        targetOffset = targetOffset.clamp(
                          _scrollController.position.minScrollExtent,
                          _scrollController.position.maxScrollExtent,
                        );

                        _scrollController.animateTo(
                          targetOffset,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );

                        // Scroll to the selected planet
                        _scrollController.animateTo(
                          targetOffset, // Adjusted scroll position based on index
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: AnimatedScale(
                        scale: isSelected ? selectedScale : otherScale,
                        duration: Duration(milliseconds: 300),
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 100, // Set a specific width for images
                                height: 100, // Set a specific height for images
                                child: Image.asset(
                                  planet['image']!,
                                  fit: BoxFit
                                      .contain, // Ensure the image fits within the box
                                ),
                              ),
                              SizedBox(height: 6),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

            // Planet Name
            Text(
              selectedPlanet,
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),

            // Planet Description
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Align(
                alignment: Alignment
                    .topCenter, // Align the description at the top center
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF0A0E21), // Background color
                    borderRadius: BorderRadius.circular(16), // Rounded corners
                    border: Border.all(
                      color: Color(0xFFF8B9FF), // Border color
                      width: 2, // Border width
                    ),
                  ),
                  child: Text(
                    planets.firstWhere((planet) =>
                        planet['name'] == selectedPlanet)['description']!,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: MyNavBarPage(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ), // Custom bottom navigation bar
    );
  }

  // Planet navigation item with animation
  Widget _buildNavItem(String iconPath, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          iconPath,
          width: 30, // Icon size
          height: 30,
        ),
        SizedBox(height: 6),
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Color(0xFF0A0E21)),
        ),
      ],
    );
  }
}
