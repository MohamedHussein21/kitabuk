import 'package:flutter/material.dart';
import 'package:mybook/config/routes/routes.dart';
import 'package:mybook/core/utils/mediaQuary.dart';
import 'package:mybook/core/utils/valudation.dart';

import '../../../core/componant.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';
import '../widgets/default_button.dart';
import '../widgets/default_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validations {
  final TextEditingController nameControl = TextEditingController();
  final TextEditingController emailControl = TextEditingController();
  final TextEditingController passwordControl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Register To Join us',
                style: TextStyle(
                    color: AppColor.defaultColor,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              Image.asset(
                AppImages.bookLogo,
                width: 150,
                height: 150,
              ),
              DefaultTextForm(
                prefix: Icons.person,
                controller: nameControl,
                type: TextInputType.name,
                validate: generalValidation,
                label: 'Name',
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              DefaultTextForm(
                prefix: Icons.email,
                controller: emailControl,
                type: TextInputType.emailAddress,
                validate: emailValidation,
                label: 'Email',
              ),
              SizedBox(
                height: context.heigh * 0.03,
              ),
              DefaultTextForm(
                prefix: Icons.lock,
                controller: passwordControl,
                type: TextInputType.visiblePassword,
                validate: passwordValidation,
                label: 'Password',
              ),
              SizedBox(
                height: context.heigh * 0.05,
              ),
              DefaultButton(
                submit: () {
                  // no Auth need
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                title: 'Sign up',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('I have an account'),
                  defaultTextButton(
                      function: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.loginRoute);
                      },
                      text: 'Sign in '),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
