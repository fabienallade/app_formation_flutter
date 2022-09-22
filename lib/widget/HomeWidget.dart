import 'package:flutter/material.dart';
import 'package:formation/widget/TextWithIcon.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    Random random = Random();
    int randomImage = random.nextInt(10);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
              border: Border.all(
                  color: Colors.blue, style: BorderStyle.solid, width: 5),
              // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      "https://randomuser.me/api/portraits/lego/$randomImage.jpg"))),
        ),
        const SizedBox(
          height: 10,
        ),
        const TextWithIcon(
            iconData: Icons.account_box, textData: "ALLADE D. Fabien"),
        const SizedBox(
          height: 10,
        ),
        const TextWithIcon(
            iconData: Icons.email, textData: "alladefabien@gmail.com"),
        const SizedBox(
          height: 10,
        ),
        const TextWithIcon(
            iconData: Icons.phone_android, textData: "07 58 08 33 39"),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: _launchUrl,
          child: const TextWithIcon(
              iconData: Icons.language, textData: "https://github.com/fabienallade"),
        )
      ],
    );
  }

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse('https://github.com/fabienallade');
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
