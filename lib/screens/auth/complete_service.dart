import 'package:flutter/material.dart';
import 'package:irone/view_models/complete_service_view_model.dart';
import 'package:stacked/stacked.dart';

import '/widgets/atoms/button.dart';
import '/widgets/organisms/emergency_services_list.dart';

class CompleteServiceScreen extends StatefulWidget {
  static const routeName = 'complete-service';
  const CompleteServiceScreen({Key? key}) : super(key: key);

  @override
  _CompleteServiceScreenState createState() => _CompleteServiceScreenState();
}

class _CompleteServiceScreenState extends State<CompleteServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CompleteServiceViewModel>.reactive(
      viewModelBuilder: () => CompleteServiceViewModel(),
      onModelReady: (model) => model.init(),
      builder: (context, viewModel, child) => Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 100),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 52, vertical: 14),
                    color: const Color(0xffF9F6F4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "What type of service you want for emergency ?",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "You can choose as many as you like, we will  show recommended doctor and articles according to this",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 44),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: EmergencyServicesList(
                      title: "Find Your Services",
                      titleSize: 24,
                      services: viewModel.services,
                      selectedEmergencyServices:
                          viewModel.selectedEmergencyServices,
                      onClick: (service) =>
                          viewModel.handleServiceClick(service),
                      showMore: false,
                    ),
                  ),
                  const SizedBox(height: 36),
                  Button(
                    loading: false,
                    buttonText: 'Done',
                    buttonClick: viewModel.handleFormSubmit,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
