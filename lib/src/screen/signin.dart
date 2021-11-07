import 'package:flutter/material.dart';
import 'package:food_course/helper/navigations.dart';
import 'package:food_course/provider/auth.dart';
import 'package:food_course/src/screen/home.dart';
import 'package:food_course/src/widget/loading.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

bool isLogin = false;

class _SigninScreenState extends State<SigninScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final _key = GlobalKey<ScaffoldState>();
    return Scaffold(
      backgroundColor: Colors.white,
      body: authProvider.status == Status.Authenticating
          ? Loading()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                                text: 'WELCOME  ',
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold)),
                            TextSpan(
                                text: 'TO FOOD ',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: 'PALACE',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('images/logo.png', width: 240, height: 240),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.name,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              icon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.email,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              icon: Icon(Icons.email)),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: TextFormField(
                          controller: authProvider.password,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText:
                                  isLogin ? 'Password' : 'Create Password',
                              icon: Icon(Icons.password)),
                        ),
                      ),
                    ),
                  ),
                  if (!isLogin)
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Confirm Password',
                                icon: Icon(Icons.password)),
                          ),
                        ),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: GestureDetector(
                      onTap: () async {
                        if (!await authProvider.signUp()) {
                          _key.currentState?.showSnackBar(
                            SnackBar(
                              content: Text('Registration fails'),
                            ),
                          );
                          return;
                        }
                        authProvider.cleanController();
                        changeScreenReplacement(context, Home());
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 8),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.orange,
                            borderRadius: BorderRadius.circular(15)),
                        child: Center(
                          child: Text(
                            isLogin ? 'Login' : 'Register',
                            style: TextStyle(
                                letterSpacing: 1.4,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(isLogin ? 'New Here? ' : 'already Registed? ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          )),
                      GestureDetector(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(isLogin ? 'Register' : 'Login',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}

class TextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  TextField({required this.hintText, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: hintText, icon: Icon(icon)),
          ),
        ),
      ),
    );
  }
}
