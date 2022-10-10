import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/models/article.dart';
import '/models/doctor.dart';
import '/screens/dashboard/search_screen/search_tabs.dart';
import '/widgets/organisms/article_list.dart';
import '/widgets/organisms/doctors_list.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = 'search';
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String activeTab = "Top";
  final TextEditingController textController = TextEditingController();

  List<Doctor> matchedDoctors = [];
  List<Article> matchedArticles = [];

  setActiveTab(value) {
    setState(() {
      activeTab = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final articles = Provider.of<Articles>(context);
    final articlesList = articles.items;

    final doctors = Provider.of<Doctors>(context);
    final doctorsList = doctors.items;
    void handleSearch(text) {
      if (text.isNotEmpty) {
        if (activeTab == "Doctor") {
          setState(() {
            matchedDoctors = doctorsList
                .where((doctor) => doctor.name.toLowerCase().contains(text))
                .toList();
          });
        } else if (activeTab == "Articles") {
          setState(() {
            matchedArticles = articlesList
                .where((article) => article.title.toLowerCase().contains(text))
                .toList();
          });
        }
      }
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                margin: const EdgeInsets.symmetric(horizontal: 23),
                decoration: BoxDecoration(
                  color: const Color(0xfff9f6f4),
                  borderRadius: BorderRadius.circular(12),
                ),
                width: double.infinity,
                child: Row(
                  children: [
                    GestureDetector(
                        onTap: () {},
                        child: const Icon(
                          Icons.search_outlined,
                        )),
                    const SizedBox(width: 17),
                    Expanded(
                      child: TextFormField(
                        onChanged: (text) => handleSearch(
                          text.toLowerCase(),
                        ),
                        onFieldSubmitted: (text) => handleSearch(
                          text.toLowerCase(),
                        ),
                        decoration: const InputDecoration(
                          hintText: "Search Doctor,articles,services....",
                          border: InputBorder.none,
                        ),
                        controller: textController,
                      ),
                    ),
                    const SizedBox(width: 17),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.mic,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 13),
              SizedBox(
                height: 30,
                child: SearchTabs(
                  tabOptions: const [
                    "Top",
                    "Doctor",
                    "Articles",
                    "Services",
                    "Tags",
                  ],
                  activeTab: activeTab,
                  onClick: (val) {
                    handleSearch(textController.text.toLowerCase());
                    setActiveTab(val);
                  },
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 23),
                child: activeTab == "Doctor"
                    ? DoctorsList(
                        doctorsList: matchedDoctors,
                      )
                    : activeTab == "Articles"
                        ? ArticleList(
                            articlesList: matchedArticles,
                          )
                        : Container(),
              ),
              const SizedBox(height: 13),
            ],
          ),
        ),
      ),
    );
  }
}
