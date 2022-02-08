import 'package:flutter/material.dart';

class DoctorProfileTabs extends StatelessWidget {
  final List tabOptions;
  final String activeTab;
  final Function onClick;
  const DoctorProfileTabs(
      {Key? key,
      required this.tabOptions,
      required this.activeTab,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: tabOptions
          .map((option) => GestureDetector(
                onTap: () => onClick(option),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: activeTab == option
                        ? Theme.of(context).primaryColor
                        : const Color(0xfff9f6f4),
                  ),
                  child: Text(
                    option,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: activeTab == option
                          ? Colors.white
                          : const Color(0xff393938),
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}
