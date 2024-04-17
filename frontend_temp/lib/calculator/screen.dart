import 'package:flutter/material.dart';
import 'package:frontend_temp/calculator/button.dart';
import 'package:frontend_temp/calculator/glass_container.dart';
import 'package:math_expressions/math_expressions.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  //variables
  String x = "*";
  var input = '';
  var output = '';

  final List<String> buttons = [
    'AC',
    'C',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image.asset(
              "assets/6.jpg",
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Glassmorphism(
                height: size.height,
                width: size.width,
                blur: 50,
                opacity: 0.4,
                radius: 20,
                child: Column(
                  children: <Widget>[
                    Expanded(
                        child: SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                const SizedBox(height: 100),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    input,
                                    style: TextStyle(
                                      fontSize: 35,
                                      color: Colors.indigoAccent.shade100,),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    output,
                                    style:  TextStyle(
                                      fontSize: 42, color: Colors.indigoAccent.shade700,),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const Padding(
                      padding: EdgeInsets.all(5.0),
                      child: Divider(
                        thickness: 2,
                        height: 1,
                        color: Colors.black,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.bottomCenter,
                          child: GridView.builder(
                            itemCount: buttons.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4),
                            itemBuilder: (BuildContext context, int index) {
                              if (index == 19) {
                                return MyButton(
                                  buttonTapped: () {
                                    setState(() {
                                      equalPressed();
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.lightBlue,
                                  textColor: Colors.white,
                                );
                              } else if (index == 0) {
                                return MyButton(
                                  buttonTapped: () {
                                    setState(() {
                                      input = '';
                                      output = '';
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.black,
                                  textColor: Colors.blue[100],
                                );
                              } else if (index == 1) {
                                return MyButton(
                                  buttonTapped: () {
                                    setState(() {
                                      input =
                                          input.substring(0, input.length - 1);
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.black,
                                  textColor: Colors.red[50],
                                );
                              } else {
                                return MyButton(
                                  buttonTapped: () {
                                    setState(() {
                                      input += buttons[index];
                                    });
                                  },
                                  buttonText: buttons[index],
                                  color: Colors.black,
                                  textColor: isOperator(buttons[index])
                                      ? Colors.lightBlue
                                      : Colors.indigoAccent.shade100,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '+' || x == '-' || x == '%') {
      return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion = input;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    output = eval.toStringAsPrecision(9);
  }
}
