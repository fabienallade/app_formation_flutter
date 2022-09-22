import 'package:flutter/material.dart';

class AppDrawerContent extends StatelessWidget {
  String titleHead;

  List<Map<String, String>> dataList;

  AppDrawerContent({Key? key, required this.titleHead, required this.dataList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titleHead,
          style: const TextStyle(fontSize: 22),
        ),
        const SizedBox(
          height: 5,
        ),
        const Divider(
          height: 1,
          color: Colors.blue,
          thickness: 2,
        ),
        const SizedBox(
          height: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataList
              .map((e) => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        e["annee"]!,
                        style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(e["ecole"]!),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(e["pays"]!),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ))
              .toList(),
        )
      ],
    );
  }
}
