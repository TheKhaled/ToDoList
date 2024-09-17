import 'package:doit/Icons/Photo.dart';
import 'package:flutter/material.dart';

class SpinImageScreen extends StatefulWidget {
  @override
  _SpinImageScreenState createState() => _SpinImageScreenState();
}

class _SpinImageScreenState extends State<SpinImageScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Initialize the AnimationController
    _controller = AnimationController(
      duration: Duration(
          seconds: 2), // Total duration for one 360-degree rotation with pauses
      vsync: this,
    );

    // Set up the animation to rotate by 45-degree increments with pauses
    _animation = TweenSequence([
      TweenSequenceItem(
        tween: Tween<double>(
            begin: 0, end: 0.125), // Rotate 45 degrees (1/8 of a full rotation)
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.125), // Pause at 45 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.125, end: 0.25), // Rotate to 90 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.25), // Pause at 90 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.25, end: 0.375), // Rotate to 135 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.375), // Pause at 135 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.375, end: 0.5), // Rotate to 180 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.5), // Pause at 180 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.5, end: 0.625), // Rotate to 225 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.625), // Pause at 225 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.625, end: 0.75), // Rotate to 270 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.75), // Pause at 270 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.75, end: 0.875), // Rotate to 315 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(0.875), // Pause at 315 degrees
        weight: 0.5,
      ),
      TweenSequenceItem(
        tween: Tween<double>(begin: 0.875, end: 1.0), // Rotate to 360 degrees
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ConstantTween<double>(1.0), // Pause at 360 degrees
        weight: 0.5,
      ),
    ]).animate(_controller);

    // Start the animation with repeating behavior
    _controller.repeat(reverse: false); // No need to reverse, just loop
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffD9DFCC),
      body: Center(
        child: RotationTransition(
          turns: _animation,
          child: Image.asset(
            thelogo, // Replace with your image path
            width: 100.0, // Adjust the size as needed
            height: 100.0,
          ),
        ),
      ),
    );
  }
}
