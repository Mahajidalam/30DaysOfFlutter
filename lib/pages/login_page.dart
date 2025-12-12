import 'package:flutter/material.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        changeButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changeButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset("assets/images/hey_image.png", fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 32.0,
                ),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Enter User Name",
                        labelText: "User Name",
                      ),
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Username cannot be empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Password cannot be empty";
                        } else if (value.length < 6) {
                          return "Password length should be atleast 6";
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
              Material(
                color: context.theme.appBarTheme.foregroundColor,
                borderRadius: BorderRadius.circular(changeButton ? 50 : 8),
                child: InkWell(
                  onTap: () => moveToHome(context),
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    height: 40,
                    width: changeButton ? 100 : 150,
                    alignment: Alignment.center,
                    // decoration: BoxDecoration(
                    // shape: changeButton ? BoxShape.circle : BoxShape.rectangle
                    // ),
                    child: changeButton
                        ? Icon(Icons.done, color: Colors.white)
                        : Text(
                            "Login",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pushNamed(context, MyRoutes.HomeRoute);
              //   },
              //   child: Text("Login"),
              //   style: TextButton.styleFrom(minimumSize: Size(150, 30), backgroundColor: Colors.cyanAccent)
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//         child: Text("Login Page",
//         style: TextStyle(
//           fontSize: 20,
//           color: Colors.blue,
//           fontWeight: FontWeight.bold
//         ),),
//       )
