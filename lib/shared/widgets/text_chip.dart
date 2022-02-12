import 'package:flutter/material.dart';

/// A more performant alternative to [Chip] when we just need a the label property
class TextChip extends StatelessWidget {
  const TextChip(this.text, {Key? key}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
      ),
      child: SelectableText(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
