import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_checkbox.dart';
import 'custom_text_formfield.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  static final _formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                controller: controller,
                // labelText: 'Email',
                hintText: 'This field is required Email',
                validator: (value) {
                  debugPrint('Error Feb $value');
                  if (value != null && value.isNotEmpty && value.isEmail) {
                    return null;
                  } else {
                    return 'Please input valid Email.';
                  }
                },
              ),
              // CustomTextFormField(
              //   hintText: 'The minimun amount is \$500',
              //   validator: (value) {
              //     debugPrint('Error Feb $value');
              //     if (value != null &&
              //         value.isNotEmpty &&
              //         num.parse(value) >= 500) {
              //       return null;
              //     } else {
              //       return 'The minimun amount is \$500';
              //     }
              //   },
              // ),
              // CustomTextFormField(
              //   hintText: 'This field is required real name',
              //   validator: (value) {
              //     debugPrint('Error Feb $value');
              //     if (value != null &&
              //         value.isNotEmpty &&
              //         value.isAlphabetOnly) {
              //       return null;
              //     } else {
              //       return 'Real name alow only Alphabet.';
              //     }
              //   },
              // ),

              TextFormField(),

              CustomCheckBox(
                validator: (value) {
                  // debugPrint('Success $value');
                  // if (value!) {
                  //   return null;
                  // } else {
                  //   return 'please enable';
                  // }

                  return null;
                },
              ),

              // const Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  key: const Key('btnLogin'),
                  onPressed: () {
                    // final validate = _formKey.currentState?.validate();
                    // debugPrint('$validate');
                    controller.text = 'Hellosdasdas';
                    controller.selection = TextSelection.fromPosition(
                      TextPosition(offset: controller.text.length),
                    );
                  },
                  child: const Text('Validate'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
