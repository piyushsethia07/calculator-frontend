import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final color;
  final textColor;
  final String buttonText;
  final buttonTapped;

  const MyButton(
      {super.key,
        this.color,
        this.textColor,
        required this.buttonText,
        this.buttonTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttonTapped,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Card(
            shadowColor: Colors.indigoAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            elevation: 20,
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    shadows: const [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(4.0, 4.0),
                        spreadRadius: 20,
                        blurRadius: 70,
                      ),
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(-4.0, -4.0),
                        spreadRadius: 10,
                        blurRadius: 70,
                      ),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
