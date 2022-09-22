import 'package:flutter/material.dart';
import 'package:formation/widget/CityAllItem.dart';
import 'package:formation/widget/CityModalBottomSheet.dart';
import 'package:formation/providers/CityAllNotifier.dart';
import 'package:formation/widget/common/AppBarWidget.dart';
import 'package:provider/provider.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({Key? key}) : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 15, crossAxisSpacing: 15),
        children: context
            .watch<CityAllNotifier>()
            .cityList
            .map((city) => CityAllItem(
                  imageAsset: city.name.toLowerCase(),
                  cityName: city.name,
                  onclik: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) => CityModalBottomSheet(
                              latitude: city.cordonne.values.first,
                              longitude: city.cordonne.values.last,
                            ));
                  },
                ))
            .toList(),
      ),
    );
  }
}
