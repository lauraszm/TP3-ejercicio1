import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final VoidCallback onPressed;
  final String titulo;

  const Button(this.titulo, this.onPressed, {Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(titulo)
    ) ;   
  }
}