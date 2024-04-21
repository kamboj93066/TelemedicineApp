// import 'package:flutter/cupertino.dart';
import 'package:atal_new_dispenser/screens/home_screen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 150.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, bottom: 30),
                    child: Image.asset(
                      "images/namaste.png",
                      height: 200,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Please enter your details to create an account.",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   "Already have account?",
                      //   style: TextStyle(
                      //     fontSize: 16,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      // TextButton(
                      //   onPressed: () {
                      //     // Navigator.push(
                      //     //     context,
                      //     //     MaterialPageRoute(
                      //     //       builder: (context) => loginScreen(),
                      //     //     ));
                      //   },
                      //   child: Text(
                      //     "Log In",
                      //     style: TextStyle(
                      //       fontSize: 18,
                      //       fontWeight: FontWeight.bold,
                      //       color: Color(0xFF7165D6),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),

                  SizedBox(height: 15),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Full Name",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                  //   child: TextField(
                  //     decoration: InputDecoration(
                  //       labelText: "Email Address",
                  //       border: OutlineInputBorder(),
                  //       prefixIcon: Icon(Icons.email),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Phone Number",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.phone),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: "Enter Health ID",
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.health_and_safety),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(12),
                  //   child: TextField(
                  //     obscureText: passToggle ? true : false,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(),
                  //       label: Text("Enter Password"),
                  //       prefixIcon: Icon(Icons.lock),
                  //       suffixIcon: InkWell(
                  //         onTap: () {
                  //           if (passToggle == true) {
                  //             passToggle = false;
                  //           } else {
                  //             passToggle = true;
                  //           }
                  //           setState(() {});
                  //         },
                  //         child: passToggle
                  //             ? Icon(CupertinoIcons.eye_slash_fill)
                  //             : Icon(CupertinoIcons.eye_fill),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                          (route) => false);
                    },
                    child: Text(
                      "Create Account",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  // InkWell(
                  //   onTap: () {
                  //     Navigator.pushAndRemoveUntil(
                  //         context,
                  //         MaterialPageRoute(builder: (context) => HomeScreen()),
                  //         (route) => false);
                  //   },
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(vertical: 15),
                  //     width: 350,
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF7165D6),
                  //       borderRadius: BorderRadius.circular(10),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.black12,
                  //           blurRadius: 4,
                  //           spreadRadius: 2,
                  //         ),
                  //       ],
                  //     ),
                  //     child: Center(
                  //       child: Text(
                  //         "Create Account",
                  //         style: TextStyle(
                  //           fontSize: 22,
                  //           color: Colors.white,
                  //           fontWeight: FontWeight.w600,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
