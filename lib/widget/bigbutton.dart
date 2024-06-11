import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  const BigButton({
    super.key,
    required this.name,
    required this.tap,
  });

  final String name;
  final void Function() tap;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: Card(
            surfaceTintColor: Colors.white,
            color: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 10,
            child: InkWell(
                borderRadius: BorderRadius.circular(30),
                onTap: tap,
                child: SizedBox(
                  height: 60,
                  child: Center(
                    child: Text(
                      name,
                      style: const TextStyle(fontWeight: FontWeight.bold)
                    ),
                  ),
                ))));
  }
}
