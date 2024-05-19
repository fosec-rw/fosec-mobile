// lib/pages/sign_up_screen.dart

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  int _currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _phone = '';
  String _password = '';
  String _category = 'Buyer';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // handle back press
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            const Text(
              'Create Account',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Stepper(
                currentStep: _currentStep,
                onStepContinue: _nextStep,
                onStepCancel: _prevStep,
                steps: _getSteps(),
                controlsBuilder:
                    (BuildContext context, ControlsDetails details) {
                  return Row(
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: details.onStepContinue,
                        child: const Text('Next'),
                      ),
                      if (_currentStep != 0)
                        TextButton(
                          onPressed: details.onStepCancel,
                          child: const Text('Back'),
                        ),
                    ],
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                // Navigate to sign in screen
              },
              child: Text('Already have an account? Sign in'),
            ),
          ],
        ),
      ),
    );
  }

  List<Step> _getSteps() {
    return [
      Step(
        title: Text('Personal information'),
        isActive: _currentStep >= 0,
        content: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'example@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Phone',
                  hintText: 'example@gmail.com',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _phone = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'example@gmail.com',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 16),
              Text('Category'),
              ListTile(
                title: const Text('Buyer'),
                leading: Radio<String>(
                  value: 'Buyer',
                  groupValue: _category,
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ),
              ListTile(
                title: const Text('Farmer'),
                leading: Radio<String>(
                  value: 'Farmer',
                  groupValue: _category,
                  onChanged: (String? value) {
                    setState(() {
                      _category = value!;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      // Add more steps if needed
    ];
  }

  void _nextStep() {
    if (_currentStep == 0) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        setState(() {
          _currentStep += 1;
        });
      }
    } else {
      setState(() {
        _currentStep += 1;
      });
    }
  }

  void _prevStep() {
    setState(() {
      if (_currentStep > 0) {
        _currentStep -= 1;
      }
    });
  }
}
