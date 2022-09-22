import 'package:flutter/material.dart';

class CityAllItem extends StatelessWidget {
  final String imageAsset;
  final String cityName;
  Function() onclik = () {};

  CityAllItem(
      {Key? key, required this.imageAsset, required this.cityName,required this.onclik})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclik,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/$imageAsset.webp"), opacity: .5),
        ),
        child: Text(
          cityName,
          style: const TextStyle(fontSize: 22),
        ),
      ),
    );
  }
}
