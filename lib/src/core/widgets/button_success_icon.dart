// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonSuccessIcon extends StatelessWidget {
  final double? width;
  final double? height;
  const ButtonSuccessIcon({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return const Icon(Icons.check);
  }
}
