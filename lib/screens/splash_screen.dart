import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../view_models/splash_view_model.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = 'splash_screen';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        body: Center(
          child: Container(
            width: 173,
            height: 173,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Text(
                "iRone",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
