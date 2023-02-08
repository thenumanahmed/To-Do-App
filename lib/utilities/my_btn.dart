import 'package:flutter/material.dart ';

class MyBtn extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  const MyBtn({
    super.key,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Theme.of(context).primaryColor,
      child: Text(name),
    );
  }
}
