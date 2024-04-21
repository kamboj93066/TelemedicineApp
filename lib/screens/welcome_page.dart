// import 'package:atal_new_dispenser/screens/register_screen.dart';
import 'package:atal_new_dispenser/screens/home_screen.dart';
import 'package:atal_new_dispenser/screens/register_screen.dart';
import 'package:atal_new_dispenser/screens/sensor_screen.dart';
import 'package:atal_new_dispenser/screens/servo_screen.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    // final ap = Provider.of<AuthProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Row(
                children: [
                  // Image.asset(
                  //     "/Users/ishantkamboj/Documents/Personal/Projects/Atal_Dispenser/Atal_new_software/atal_dispenser/assets/images/Welcome.jpg"),
                  Expanded(
                    child: Container(
                      // padding: EdgeInsets.only(left: 200),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 180, top: 40),
                            child: CircleAvatar(
                              radius: 150, //radius of avatar
                              backgroundColor: Colors.black12, //color
                              child: Padding(
                                padding:
                                    const EdgeInsets.all(8), // Border radius
                                child: ClipOval(
                                  child:
                                      Image.asset("assets/images/welcome.jpg"),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 200,
                            margin: EdgeInsets.only(left: 50),
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 6,
                                  spreadRadius: 4,
                                ),
                              ],
                            ),
                            child: Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                      color: Colors.orange[100],
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.payment,
                                      color:
                                          const Color.fromARGB(255, 255, 0, 0),
                                      size: 35,
                                    ),
                                  ),
                                  SizedBox(height: 30),
                                  Text(
                                    "SOS",
                                    style: TextStyle(
                                      fontSize: 40,
                                      color: Colors.red[500],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    "Emergency Call",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 500,
                  // ),

                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: Expanded(
                          child: Column(
                            children: [
                              Text(
                                "Namaste",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/images/namaste.png",
                                height: 200,
                              ),
                              Text(
                                "Welcome To ATAL",
                                style: TextStyle(
                                    fontSize: 50, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "HealthCare Made Easy..",
                                style: TextStyle(
                                    fontSize: 30, color: Colors.black54),
                              ),
                              SizedBox(
                                height: 100,
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => RegisterScreen(),
                                    ),
                                  );
                                },
                                style: ButtonStyle(
                                    // backgroundColor:
                                    //     MaterialStatePropertyAll(Colors.amber),
                                    ),
                                child: Text(
                                  "Get Started",
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => HomeScreen(),
                                      ),
                                    );
                                  },
                                  style: ButtonStyle(
                                      // backgroundColor:
                                      //     MaterialStatePropertyAll(Colors.amber),
                                      ),
                                  child: Text(
                                    "Go to HOME SCREEN",
                                    style: TextStyle(fontSize: 30),
                                  )),
                              SizedBox(
                                width: 300,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
