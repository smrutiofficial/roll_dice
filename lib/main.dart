import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
        home: Scaffold(
      body: GradientContainer(),
    )),
  );
}

// ========================================================
class GradientContainer extends StatelessWidget {
  const GradientContainer({super.key});
  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(255, 77, 29, 209),
            Color.fromARGB(231, 161, 23, 23),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(child: Diceroller()),
    );
  }
}

// ======================================================
class Diceroller extends StatefulWidget {
  const Diceroller({super.key});
  @override
  State<Diceroller> createState() {
    return _DicerollerState();
  }
}

class _DicerollerState extends State<Diceroller> {
  var currentDice = 2;

  void rollDice() {
    setState(() {
      currentDice = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDice.png',
          width: 200,
        ),
        Container(
          margin: const EdgeInsets.only(top: 100),
          child: TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 255, 255, 255),
              foregroundColor: const Color.fromARGB(255, 50, 7, 7),
              padding: const EdgeInsets.fromLTRB(28, 10, 28, 10),
              textStyle: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold
              ),
            ),
            child: const Text("Roll Dice"),
          ),
        )
      ],
    );
  }
}
