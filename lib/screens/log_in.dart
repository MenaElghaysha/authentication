import 'package:flutter/material.dart';
import 'package:profile/SQLite/sqlite.dart';
import 'package:profile/customs.dart/buttons.dart';
import 'package:profile/customs.dart/caption_text.dart';
import 'package:profile/customs.dart/route_text.dart';
import 'package:profile/customs.dart/text_field.dart';
import 'package:profile/customs.dart/title_text.dart';
import 'package:profile/screens/home_screen.dart';
import 'package:profile/screens/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:profile/JsonModels/users.dart';

class SignInScreen extends StatefulWidget {

  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  //we have to make global key for our form
  final formKey = GlobalKey<FormState>();
  //toggle the password
  bool isVisible =false;
  bool isLoginTrue =false;

  final db = DatabaseHelper();
  login()async{
   var response = await db.login(Users(userEmail : emailController.text, userPassword: passController.text));


   if(response == true){
     if(!mounted) return;
     // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>HomeScreen()));
     Navigator.of(context).pushReplacementNamed('navigation');
   }else {
     setState(() {
       isLoginTrue = true;
     });
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child:
              //we put all the text fields in a form to be controlled and not allow as empty
          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TitleText(
                  text: 'Sign In',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                const CaptionText(
                  text: 'welcome back. Please sign in to continue',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Image(image: AssetImage("assets/2.png")),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$").hasMatch(value)) {
                      return "Invalid email format";
                    }
                    return null;
                  },
                  controller: emailController,
                  keyboardType:TextInputType.emailAddress,
                  decoration: const InputDecoration(
                    icon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                  ),
                 ),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),

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
                    icon: const Icon(Icons.lock_outline,),
                    hintText: 'Password',
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
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                 AuthButton(formKey: formKey,login: login),

                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('You are new here? '),
                    RouteText(
                        text: 'Sign Up',
                        funtion: () async {
                          SharedPreferences prefs =
                              await SharedPreferences.getInstance();
                          prefs.setString('email', emailController.text);
                          prefs.setString('pass', passController.text);
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SignUpScreen()));
                        })
                  ],
                ),
                
                isLoginTrue? const Text(
                    "Username or Password is incorrect",
                style: (TextStyle(color: Colors.red)),) : const SizedBox(),
                
              ],
            ),
          ),
        ),
      )),
    );
  }
}
