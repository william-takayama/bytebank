import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final TextInputType inputType;

  const Editor({
    @required this.controller,
    @required this.label,
    @required this.hint,
    this.inputType = TextInputType.number,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: TextField(
        controller: this.controller,
        style: TextStyle(
          fontSize: 24.0,
        ),
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: this.label,
          hintText: this.hint,
        ),
        keyboardType: this.inputType,
      ),
    );
  }
}
