import 'package:doit/Icons/Photo.dart';
import 'package:doit/Screens/Home.dart';
import 'package:doit/Screens/Login.dart';
import 'package:flutter/material.dart';

class ONBording extends StatefulWidget {
  const ONBording({super.key});

  @override
  State<ONBording> createState() => _ONBordingState();
}

class _ONBordingState extends State<ONBording> {
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'image': on3,
      'title': 'Discover Art',
      'description': 'Explore masterpieces from renowned artists worldwide.'
    },
    {
      'image': on2,
      'title': 'Visit Museums',
      'description': 'Take a virtual tour of famous museums around the globe.'
    },
    {
      'image': muesm,
      'title': 'Inspire Yourself',
      'description': 'Get inspired by the beauty and creativity of art.'
    },
  ];

  void _nextPage() {
    setState(() {
      if (_currentIndex < _onboardingData.length - 1) {
        _currentIndex++;
      } else {
        // Navigate to the main app screen (e.g., HomeScreen) after onboarding
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LogIn()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              _onboardingData[_currentIndex]['image']!,
              fit: BoxFit.cover,
            ),
          ),
          // Overlay to make text stand out
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.black.withOpacity(0.5)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Spacer for aligning content near the bottom center
                Spacer(),
                Text(
                  _onboardingData[_currentIndex]['title']!,
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16.0),
                Text(
                  _onboardingData[_currentIndex]['description']!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _onboardingData.length,
                    (index) => buildDot(index, context),
                  ),
                ),
                SizedBox(height: 24.0),
                ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black, // Button background color
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(8.0), // Rounded corners
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                  ),
                  child: Text(
                    _currentIndex == _onboardingData.length - 1
                        ? 'Get Started'
                        : 'Next',
                    style: TextStyle(
                      color: Colors.white, // Text color
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8.0),
      height: 10.0,
      width: _currentIndex == index ? 20.0 : 10.0,
      decoration: BoxDecoration(
        color: _currentIndex == index ? Colors.blue : Colors.grey,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
