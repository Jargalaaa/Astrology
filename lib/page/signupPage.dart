import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _dateController = TextEditingController();

  @override
  void dispose() {
    _dateController
        .dispose(); // Dispose of the controller to avoid memory leaks
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      // Format the picked date and update the controller
      setState(() {
        _dateController.text =
            "${pickedDate.day.toString().padLeft(2, '0')}/${pickedDate.month.toString().padLeft(2, '0')}/${pickedDate.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21), // Dark Navy Background
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21), // Matches background
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/arrow_back.png', width: 30, height: 30),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Бүртгүүлэх',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _buildTextField('Овог Нэр', 'Овог нэрээ оруулна уу'),
              const SizedBox(height: 15),
              _buildTextField('Утасны Дугаар', 'Утасны дугаараа оруулна уу'),
              const SizedBox(height: 15),
              _buildDateField(context),
              const SizedBox(height: 15),
              _buildTextField('Нууц Үг', 'Нууц үгээ оруулна уу',
                  isPassword: true),
              const SizedBox(height: 15),
              _buildTextField(
                  'Нууц Үг Баталгаажуулах', 'Нууц үгээ дахин оруулна уу',
                  isPassword: true),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight, // Align the text to the right
                child: TextButton(
                  onPressed: () {
                    // Navigate to login page
                  },
                  child: const Text(
                    'Бүртгэлтэй бол энд дарна уу?',
                    style: TextStyle(color: Colors.white54),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF101136), // Button Background
                  side: const BorderSide(
                    color: Color(0xFFF8B9FF), // Button Border
                    width: 2,
                  ),
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/gender');
                },
                child: const Text(
                  'Үргэлжлүүлэх',
                  style: TextStyle(
                    color: Colors.white, // Button Text Color
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 8),
        TextField(
          obscureText: isPassword,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: Colors.white54),
            filled: true,
            fillColor: Colors.transparent, // Transparent field background
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFF8B9FF), // Light Purple Border
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Color(0xFFF8B9FF), // Focused Border Color
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDateField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Төрсөн Он Сар Өдөр',
          style: TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            _selectDate(context); // Trigger the date picker
          },
          child: AbsorbPointer(
            // Prevent manual typing in the date field
            child: TextField(
              controller: _dateController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Төрсөн огноо оруулна уу',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.transparent, // Transparent field background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFFF8B9FF), // Light Purple Border
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(
                    color: Color(0xFFF8B9FF), // Focused Border Color
                  ),
                ),
                suffixIcon: Image.asset('assets/quill_calendar.png',
                    color: Colors.white54,
                    width: 20,
                    height: 20), // Calendar Icon
              ),
            ),
          ),
        ),
      ],
    );
  }
}
