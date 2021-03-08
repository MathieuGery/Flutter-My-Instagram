import 'package:flutter/material.dart';

import '../Components/inputField.dart';

import '../Views/login.dart';

class RegisterPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterForm());
  }
}

class RegisterForm extends StatefulWidget {
  @override
  RegisterFormState createState() {
    return RegisterFormState();
  }
}

class RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            InputField('name', Icons.badge),
            SizedBox(height: 25.0),
            InputField('username', Icons.account_box),
            SizedBox(height: 25.0),
            InputField('email', Icons.email),
            SizedBox(height: 25.0),
            InputField('password', Icons.lock),
            SizedBox(height: 25.0),
            InputField('password', Icons.lock),
            SizedBox(height: 25.0),
            InputField('description', Icons.description),
            SizedBox(height: 25.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    debugPrint('Registering...');
                  }
                },
                child: Text('Sign up'),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account?',
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text('Sign in.'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
