// import 'package:atal_new_dispenser/provider/auth_provider.dart';
// import 'package:atal_new_dispenser/screens/user_entry.dart';
import 'package:atal_new_dispenser/screens/sign_up_sceen.dart';
// import 'package:atal_new_dispenser/utils/snackBar.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
// import 'package:provider/provider.dart';

class OtpScreen extends StatefulWidget {
  // final String verificationId;
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    // final isLoading =
    //     Provider.of<AuthProvider>(context, listen: true).isLoading;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.of(context),
                        child: Icon(Icons.arrow_back),
                      ),
                    ),
                    // Image.asset(
                    //     "/Users/ishantkamboj/Documents/Personal/Projects/Atal_Dispenser/Atal_new_software/atal_dispenser/assets/images/Welcome.jpg"),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 60, top: 100),
                        child: CircleAvatar(
                          radius: 200, //radius of avatar
                          backgroundColor: Colors.black12, //color
                          child: Padding(
                            padding: const EdgeInsets.all(8), // Border radius
                            child: ClipOval(
                              child: Image.asset("assets/images/register.jpg"),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    ),

                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(top: 150.0),
                        child: Column(
                          children: [
                            Text(
                              "Welcome To ATAL",
                              style: TextStyle(
                                  fontSize: 50, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Please Enter Your OTP",
                              style: TextStyle(
                                  fontSize: 30, color: Colors.black54),
                            ),
                            SizedBox(
                              height: 100,
                            ),
                            Pinput(
                              length: 6,
                              showCursor: true,
                              defaultPinTheme: PinTheme(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.black54),
                                  ),
                                  textStyle: TextStyle(fontSize: 30)),
                              onCompleted: (value) => setState(() {
                                otpCode = value;
                              }),
                            ),
                            SizedBox(
                              height: 80,
                            ),
                            ElevatedButton(
                              onPressed: () {
                                // if (otpCode != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignUpScreen()));
                                // } else {
                                //   showSnackBar(context, "Enter 6-Digit Code");
                                // }
                              },
                              // style: ButtonStyle(),
                              child: Text(
                                "Verify",
                                style: TextStyle(fontSize: 30),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Didn't recieve any code?",
                              style: TextStyle(
                                  fontSize: 16, color: Colors.black38),
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Resend OTP?",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.purple),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // // verify otp
  // void verifyOTP(BuildContext context, String userOtp) {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   ap.verifyOtp(
  //       context: context,
  //       verificationId: widget.verificationId,
  //       userOtp: userOtp,
  //       onSuccess: () async {
  //         // check if user already exist or not
  //         await ap.checkExistingUser().then(
  //           (value) async {
  //             if (value == true) {
  //               // user exists
  //             } else {
  //               // new user
  //               Navigator.pushAndRemoveUntil(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => SignUpScreen()),
  //                   (route) => false);
  //             }
  //           },
  //         );
  //       });
  // }
}
