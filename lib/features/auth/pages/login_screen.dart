import 'package:flutter/material.dart';
import 'package:mybook/config/routes/routes.dart';
import 'package:mybook/core/componant.dart';
import 'package:mybook/core/utils/mediaQuary.dart';
import 'package:mybook/core/utils/valudation.dart';
import '../../../core/utils/colors.dart';
import '../../../core/utils/images.dart';
import '../widgets/default_button.dart';
import '../widgets/default_form_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with Validations {
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
                'Login To Read a Books',
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
                prefix: Icons.email,
                controller: emailControl,
                type: TextInputType.emailAddress,
                validate: emailValidation,
                label: 'Email',
              ),
              SizedBox(
                height: context.heigh * 0.05,
              ),
              DefaultTextForm(
                prefix: Icons.lock,
                controller: passwordControl,
                type: TextInputType.visiblePassword,
                validate: passwordValidation,
                label: 'Password',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  defaultTextButton(
                      function: () {}, text: 'Forget your password?')
                ],
              ),
              SizedBox(
                height: context.heigh * 0.05,
              ),
              DefaultButton(
                submit: () {
                  Navigator.pushReplacementNamed(context, Routes.homeRoute);
                },
                title: 'Login',
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  defaultTextButton(
                      function: () {
                        Navigator.pushReplacementNamed(
                            context, Routes.registerRoute);
                      },
                      text: 'Sign up '),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
