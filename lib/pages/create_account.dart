// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fosec/pages/register_form.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  int currentStep = 0;

  void goToNextStep() {
    setState(() {
      currentStep = currentStep + 1;
    });
  }

  List<Step> getSteps() => [
        Step(
          title: Text(''),
          content: RegisterForm(
            title: "Create Account",
            formTitle: "Personal Information",
            onNext: goToNextStep,
          ),
        ),
        Step(
          title: Text(''),
          content: RegisterForm(
            title: "Project",
            formTitle: "Project Information",
            onNext: goToNextStep,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stepper(
        steps: getSteps(),
        type: StepperType.horizontal,
        currentStep: currentStep,
        onStepContinue: () {},
      ),
    );
  }
}
