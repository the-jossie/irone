import 'package:flutter/material.dart';

class NavTabs extends StatelessWidget {
  final List tabOptions;
  final String activeTab;
  final Function onClick;
  const NavTabs(
      {Key? key,
      required this.tabOptions,
      required this.activeTab,
      required this.onClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 23),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: tabOptions
            .map((option) => GestureDetector(
                  onTap: () => onClick(option),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        option,
                        style: TextStyle(
                            fontSize: activeTab == option ? 18 : 13,
                            fontWeight: FontWeight.bold),
                      ),
                      activeTab == option
                          ? Container(
                              width: 30,
                              height: 2,
                              color: Theme.of(context).primaryColor,
                            )
                          : Container(),
                    ],
                  ),
                ))
            .toList(),
      ),
    );
  }
}
