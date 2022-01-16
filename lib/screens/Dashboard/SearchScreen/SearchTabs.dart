import 'package:flutter/material.dart';

class SearchTabs extends StatelessWidget {
  final List tabOptions;
  final String activeTab;
  final Function onClick;
  const SearchTabs(
      {Key? key,
      required this.tabOptions,
      required this.activeTab,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 23, right: 54),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        boxShadow: const [
          BoxShadow(
            blurRadius: 20,
            color: Color(0xfffcfdfd),
            offset: Offset(0, 1),
            spreadRadius: 1,
          ),
        ],
      ),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: tabOptions
            .map((option) => GestureDetector(
                  onTap: () => onClick(option),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 0),
                    margin: const EdgeInsets.only(right: 32),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: activeTab == option
                            ? BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff393938),
                      ),
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
