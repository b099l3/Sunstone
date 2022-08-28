import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const Button({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(const EdgeInsets.all(0.0)),
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0))),
      ),
      child: Ink(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.purple.withOpacity(0.7),
              Colors.blueAccent.withOpacity(0.7),
            ],
          ),
          borderRadius: const BorderRadius.all(Radius.circular(40.0)),
        ),
        child: Container(
          constraints: const BoxConstraints(
              minWidth: 88.0,
              maxWidth: 500.0,
              maxHeight: 40.0,
              minHeight: 36.0), // min sizes for Material buttons
          alignment: Alignment.center,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
