import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var formKey = GlobalKey<FormState>();

  var email = TextEditingController();

  var password = TextEditingController();

  bool passToggle = true;

  String? gender;

  String? lang = 'en';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/logo.png'),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: email,
                  // autovalidateMode: AutovalidateMode.always,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email_rounded),
                    labelText: 'Email',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PLease Enter your Email';
                    } else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return 'Your Email Not Valid';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: password,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.password),
                    suffixIcon: IconButton(
                      icon: Icon(
                        passToggle ? Icons.visibility_rounded : Icons.visibility_off_rounded,
                      ),
                      onPressed: () {
                        setState(() {
                          passToggle = !passToggle;
                        });
                      },
                    ),
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'PLease Enter your Password';
                    } else if(!value.contains(RegExp(r'[a-z]'))){
                      return 'should contain at least one lower case';
                    }else if(!value.contains(RegExp(r'[A-Z]'))){
                      return 'should contain at least one upper case';
                    }else if(!value.contains(RegExp(r'[!@#\$&*~]'))){
                      return 'should contain at least one Special character';
                    }else if(value.length<8){
                      return 'Password must be more than 8 character';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: 'male',
                  items: [
                    DropdownMenuItem(
                      child: Text('Male'),
                      value: 'male',
                    ),
                    DropdownMenuItem(
                      child: Text('Female'),
                      value: 'female',
                    ),
                  ],
                  onChanged: (value) {
                    gender = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'You must Select your Gender';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                      value: 'en',
                      groupValue: lang,
                      onChanged: (value) {
                        setState(() {
                          lang = value;
                        });
                      },
                    ),
                    Text('English'),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Radio(
                      value: 'ar',
                      groupValue: lang,
                      onChanged: (value) {
                        setState(() {
                          lang = value;
                        });
                      },
                    ),
                    Text('Arabic'),
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      print('You are Entered');
                      print(email.text);
                      print(password.text);
                    }
                  },
                  child: Text(
                    'Login',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
