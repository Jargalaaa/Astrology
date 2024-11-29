import 'package:flutter/material.dart';

class GenderPage extends StatefulWidget {
  @override
  _GenderPageState createState() => _GenderPageState();
}

class _GenderPageState extends State<GenderPage> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21), // Background color matching the image
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/arrow_back.png', width: 30, height: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Хүйсээ сонгоно уу",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            _buildGenderOption("Эрэгтэй", "male"),
            SizedBox(height: 16),
            _buildGenderOption("Эмэгтэй", "female"),
            Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: selectedGender != null
                    ? () {
                        // Perform action with the selected gender
                        Navigator.pushNamed(context, '/planet');
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color.fromARGB(255, 219, 162, 223), // Button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32.0, vertical: 12.0),
                  child: Text(
                    "Нэвтрэх",
                    style: TextStyle(fontSize: 16, color: Color(0xFF0A0E21)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildGenderOption(String label, String value) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedGender = value;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: selectedGender == value
              ? Color.fromARGB(255, 219, 162, 223)
              : Colors.transparent,
          border: Border.all(color: Color.fromARGB(255, 219, 162, 223)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: TextStyle(
                  color: selectedGender == value
                      ? const Color(0xFF0A0E21)
                      : Color.fromARGB(255, 254, 254,
                          254), // Change text color based on selection
                  fontSize: 18,
                  fontWeight: selectedGender == value
                      ? FontWeight.bold
                      : FontWeight.normal, // Optional: make selected text bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
