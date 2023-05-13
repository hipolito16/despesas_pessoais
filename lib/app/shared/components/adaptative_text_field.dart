import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class AdaptativeTextField extends StatefulWidget {
  final String label;
  final TextEditingController controller;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final void Function(String)? onSubmitted;

  const AdaptativeTextField({
    required this.label,
    required this.controller,
    required this.focusNode,
    required this.keyboardType,
    this.onSubmitted,
    Key? key,
  }) : super(key: key);

  @override
  State<AdaptativeTextField> createState() => _AdaptativeTextFieldState();
}

class _AdaptativeTextFieldState extends State<AdaptativeTextField> {
  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              controller: widget.controller,
              focusNode: widget.focusNode,
              keyboardType: widget.keyboardType,
              onSubmitted: widget.onSubmitted,
              placeholder: widget.label,
              padding: const EdgeInsets.symmetric(
                horizontal: 6,
                vertical: 12,
              ),
            ),
          )
        : TextField(
            controller: widget.controller,
            focusNode: widget.focusNode,
            keyboardType: widget.keyboardType,
            onSubmitted: widget.onSubmitted,
            decoration: InputDecoration(
              labelText: widget.label,
            ),
          );
  }
}
