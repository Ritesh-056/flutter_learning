import 'package:flutter/material.dart';
import 'package:session_app/custom_paint/custom_circle.dart';

class DrawCircle extends StatelessWidget {
  const DrawCircle({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final alphabets = List.generate(26, (index) => String.fromCharCode(65 + index));
    final circleDiameter  = size.width/4;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: alphabets.map((letter)=> GestureDetector(
            onTap: (){
              print("Tapped:$letter");
            },
            child: Padding(
              padding: EdgeInsets.only(right: 16.0),
              child: CustomPaint(
                  painter: CustomCircle(letter),
                  size: Size(circleDiameter, circleDiameter),
                ),
            ),
          )).toList()
        ),
      ),
    );
  }
}
