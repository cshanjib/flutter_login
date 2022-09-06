import 'package:flutter/material.dart';
import 'package:flutter_login/utils/dialog_util.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Login',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
                onTap: () => DialogUtil.openLoginPopup(context, dismissible: false),
                child: const Text("Login")),

            InkWell(
                onTap: () => DialogUtil.openLoginPopup(context, dismissible: false, isRegister: true),
                child: const Text("Register")),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Flutter Login Design")),
    );
  }
}
