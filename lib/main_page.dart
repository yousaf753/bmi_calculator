import 'package:flutter/material.dart';
import 'screens/input_page.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return NeumorphicApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color(0xFFFFFFFF),
        lightSource: LightSource.top,
        depth: 10,
      ),
      home: InputPage(),
    );
  }
}

