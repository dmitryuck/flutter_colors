import 'package:color_change/common/Utils.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen();

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  Color screenBackgroundColor = Colors.white;

  void onScreenClick() {
    setState(() {
      screenBackgroundColor = Utils.randomizeColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: GestureDetector(
          onTap: onScreenClick,
          child: DecoratedBox(
            decoration: BoxDecoration(color: screenBackgroundColor),
            child: Center(
              child: Text(
                'Hey there',
                style: TextStyle(
                  color: Utils.isColorLight(screenBackgroundColor) ? Colors.black : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
