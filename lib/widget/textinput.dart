
import 'package:flutter/material.dart';

class InputText extends StatelessWidget {
  const InputText({
    super.key,
    required this.controller,
    required this.name,
    required this.validator,
  });

  final TextEditingController controller;
  final String name;
  final String? Function(String? value)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        labelText: name,
      ),
    );
  }
}