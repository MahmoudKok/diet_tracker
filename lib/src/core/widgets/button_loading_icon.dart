// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ButtonLoadingIcon extends StatelessWidget {
  const ButtonLoadingIcon({super.key, this.width, this.height, this.color});
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator();
  }
}
