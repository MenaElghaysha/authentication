import 'package:flutter/material.dart';
import 'package:profile/JsonModels/users.dart';
import 'package:profile/SQLite/sqlite.dart';
import 'package:profile/constants.dart';
import 'package:profile/customs.dart/buttons.dart';
import 'package:profile/customs.dart/caption_text.dart';
import 'package:profile/customs.dart/route_text.dart';
import 'package:profile/customs.dart/text_field.dart';
import 'package:profile/customs.dart/title_text.dart';
import 'package:profile/screens/log_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {

  SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  final formKey =GlobalKey<FormState>();
  bool isVisible=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TitleText(
                    text: 'Sign Up',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const CaptionText(
                    text: 'welcome!. Please sign up to continue',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  const Image(image: AssetImage("assets/1.png")),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text_Field(
                    icon: Icons.person,
                    text: 'User Name',
                    input: TextInputType.name,
                    controller: nameController,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  //email field
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                    controller: emailController,
                    keyboardType:TextInputType.emailAddress,
                    decoration:  InputDecoration(
                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText:'Email',
                      labelStyle: const TextStyle(color: Colors.black),
                    ),
                  ),

                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  //password field
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\_$&*~]).{8,}$').hasMatch(value)) {
                        return "Invalid password format";
                      }
                      return null;
                    },
                    controller: passController,
                    keyboardType:TextInputType.visiblePassword,
                    obscureText:!isVisible,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          }); },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  //confirm password field
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty || !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\_$&*~]).{8,}$').hasMatch(value)) {
                        return "Invalid password format";
                      }else if (passController.text != confirmPassController.text){
                        return "password doesn't match";
                      }
                      return null;
                    },
                    controller: confirmPassController,
                    keyboardType:TextInputType.visiblePassword,
                    obscureText:!isVisible,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(borderSide: BorderSide.none),
                      prefixIcon: const Icon(
                        Icons.lock_outline,
                        color: Colors.black,
                      ),
                      fillColor: Colors.grey.shade200,
                      filled: true,
                      labelText: 'Confirm Password',
                      labelStyle: const TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                        icon: Icon(isVisible? Icons.visibility : Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          }); },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),

                  //sign up button
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Constants.primaryColor),
                          minimumSize: MaterialStatePropertyAll(Size(360, 50))),
                      onPressed: () {
                       if(formKey.currentState!.validate()){
                        //   AlertDialog(
                        //     title: Text("Alert!!!"),
                        //     content: Text("Try to fill all fields!"),
                        //   );
                        // } else {
                         final db = DatabaseHelper();
                         db.signUp(Users(userEmail: emailController.text, userPassword: passController.text , userName: nameController.text)
                         ).whenComplete(() => Navigator.push(
                             context,
                             MaterialPageRoute(
                                 builder: (context) => SignInScreen())));

                         print(db.users);
                        }
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      )),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Have an account? '),
                      RouteText(
                          text: 'Sign In',
                          funtion: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('email', emailController.text);
                            prefs.setString('pass', passController.text);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => SignInScreen()));
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
