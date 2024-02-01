import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:start/controller/math_controller.dart';

class InputContainer extends StatelessWidget {
  const InputContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.lightBlue,
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.lightGreen, width: 1),
          borderRadius: BorderRadius.circular(30)),
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Consumer<MathController>(
              //watch input value in math controller class
              builder: (context, value, child) => Text(
                value.input,
                maxLines: 2,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // A divider to separate the input and output
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(20),
            child: Consumer<MathController>(
              // watch result value in math controller class
              builder: (context, value, child) => Text(
                value.result,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // A divider to separate the output and the keypad
        ],
      ),
    );
  }
}
