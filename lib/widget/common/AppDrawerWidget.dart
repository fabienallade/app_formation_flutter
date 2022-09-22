import 'package:flutter/material.dart';

import 'AppDrawerContent.dart';

class AppDrawerWidget extends StatefulWidget {
  int randomImage;

  AppDrawerWidget({Key? key, required this.randomImage}) : super(key: key);

  @override
  State<AppDrawerWidget> createState() => _AppDrawerWidgetState();
}

class _AppDrawerWidgetState extends State<AppDrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: SafeArea(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 10, bottom: 10),
            height: 100,
            width: 100,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                        "https://randomuser.me/api/portraits/lego/${widget.randomImage}.jpg"))),
          ),
          const SizedBox(
            height: 20,
          ),
          AppDrawerContent(
            titleHead: "Education",
            dataList: const [
              {"annee": "2015-2018", "ecole": "ENEAM", "pays": "Bénin"},
              {"annee": "2021-2023", "ecole": "F2i", "pays": "France"}
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          AppDrawerContent(
            titleHead: "Experience",
            dataList: const [
              {"annee": "2018-2021", "ecole": "ETRILABS", "pays": "Bénin"},
              {"annee": "2021-2022", "ecole": "MARMELADE APP", "pays": "France"}
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          AppDrawerContent(
            titleHead: "Interest",
            dataList: const [
              {"annee": "Lecture de mangas", "ecole": "", "pays": ""}
            ],
          )
        ],
      ),
    ));
  }
}
