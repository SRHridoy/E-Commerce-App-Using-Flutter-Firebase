import 'package:flutter/material.dart';

class CustomBoxForItemNumber extends StatefulWidget {
  String number;
  Color color;
  Color borderColor;
  Color textColor;
  final VoidCallback? onTap;

  CustomBoxForItemNumber(
      {super.key,
      required this.number,
      required this.color,
      required this.borderColor,
      required this.textColor,
      this.onTap});

  @override
  State<CustomBoxForItemNumber> createState() => _CustomBoxForItemNumberState();
}

class _CustomBoxForItemNumberState extends State<CustomBoxForItemNumber> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.color,
            border: Border.all(color: widget.borderColor),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.number,
            style: TextStyle(color: widget.textColor, fontSize: 18),
          ),
        ));
  }
}
