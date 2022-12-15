import 'package:flutter/material.dart';
import 'package:flutter_appvutrungvinh_406394402/widgets/constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({Key? key, required this.option, required this.color, p})
      : super(key: key);
  final String option;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: ListTile(
        title: Text(
          option,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            color: color.red != color.green ? neutral : Colors.black,
          ),
        ),
      ),
    );
  }
}
