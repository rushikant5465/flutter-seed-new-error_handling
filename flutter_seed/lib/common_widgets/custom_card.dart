import 'package:flutter/material.dart';
import 'package:flutter_seed/config/themes/colors.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({this.childWidget, Key? key}) : super(key: key);
  final Widget? childWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: CustomColors.customCardBackgroundColor,
        borderRadius: const BorderRadius.all(
          Radius.circular(4),
        ),
        border: Border.all(color: CustomColors.customCardBorderColor, width: 1),
      ),
      child: childWidget,
    );
  }
}
