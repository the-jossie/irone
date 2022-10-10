import 'package:irone/models/Doctor.dart';
import 'package:irone/screens/Dashboard/SearchScreen/index.dart';
import 'package:irone/widgets/organisms/DoctorsList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreenArguments {
  final String category;
  CategoryScreenArguments(this.category);
}

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CategoryScreenArguments;

    final doctors = Provider.of<Doctors>(context);
    final doctorsList = doctors.items;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xffF9F6F4),
              borderRadius: BorderRadius.circular(7),
            ),
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(args.category),
        centerTitle: false,
        titleTextStyle: const TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, SearchScreen.routeName),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
              decoration: BoxDecoration(
                color: const Color(0xffF9F6F4),
                borderRadius: BorderRadius.circular(7),
              ),
              child: Icon(
                Icons.search_outlined,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          const SizedBox(
            width: 23,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 23),
          child: Column(
            children: [
              const SizedBox(height: 20),
              DoctorsList(doctorsList: doctorsList),
            ],
          ),
        ),
      ),
    );
  }
}
