import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeButton extends StatefulWidget {
  final String label;
  final void Function()? onPressed;

  const AdaptativeButton({
    required this.label,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  @override
  State<AdaptativeButton> createState() => _AdaptativeButtonState();
}

class _AdaptativeButtonState extends State<AdaptativeButton> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: widget.onPressed,
            color: Theme.of(context).colorScheme.primary,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(widget.label),
          )
        : ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: Text(widget.label),
          );
  }
}
