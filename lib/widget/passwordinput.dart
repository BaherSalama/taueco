
import 'package:flutter/material.dart';

class PasswordText extends StatefulWidget {
  PasswordText({super.key,
    required this.controller,
    required this.name,
    required this.hide,
    required this.validator
  });

  final TextEditingController controller;
  final String name;
  final String? Function(String? value)? validator;
  bool hide;
  @override
  State<PasswordText> createState() => Password();
}


class Password extends State<PasswordText> {
  @override
  Widget build(BuildContext context) {
    return 
 TextFormField(
            controller: widget.controller,
            obscureText: widget.hide,
            validator: widget.validator,
            onFieldSubmitted: (value) { 
                  //Validator 
            },      
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                labelText:widget.name,
                suffixIcon: IconButton(
                    icon: Icon(
                        widget.hide ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        widget.hide = !widget.hide;
                      });
                    })),

          );
  }
}
