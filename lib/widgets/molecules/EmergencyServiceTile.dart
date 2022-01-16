import 'package:flutter/material.dart';

class EmergencyServiceTile extends StatelessWidget {
  final dynamic service;
  final bool selected;
  const EmergencyServiceTile(
      {Key? key, required this.service, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, bottom: 10),
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color:
            selected ? Theme.of(context).primaryColor : const Color(0xffF9F6F4),
        borderRadius: BorderRadius.circular(7),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: AssetImage(service.imgPath),
            height: 35,
            width: 39,
          ),
          Text(
            service.name,
            style: TextStyle(
                fontSize: 10, color: selected ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}
