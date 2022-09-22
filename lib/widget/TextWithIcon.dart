import 'package:flutter/material.dart';


class TextWithIcon extends StatefulWidget {
  final IconData iconData;
  final String textData;

  const TextWithIcon({Key? key, required this.iconData, required this.textData})
      : super(key: key);

  @override
  State<TextWithIcon> createState() => _TextWithIconState();
}

class _TextWithIconState extends State<TextWithIcon> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          widget.iconData,
          color: Colors.blue,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(widget.textData)
      ],
    );
  }
}