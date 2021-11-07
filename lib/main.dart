import 'package:flutter/material.dart';
import 'package:food_course/provider/auth.dart';
import 'package:food_course/src/screen/home.dart';
import 'package:food_course/src/screen/login_screen.dart';
import 'package:food_course/src/widget/loading.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider.value(value: AuthProvider.initialize()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ScreenController(),
    ),
  ));
}

class ScreenController extends StatelessWidget {
  const ScreenController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);
    switch (auth.status) {
      case Status.Uninitialized:
        return Loading();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return LoginScreen();
      case Status.Authenticated:
        return Home();
      default:
        return LoginScreen();
    }
  }
}
