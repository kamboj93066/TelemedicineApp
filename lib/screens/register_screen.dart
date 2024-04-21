import 'package:atal_new_dispenser/screens/otp_screen.dart';
import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:atal_new_dispenser/provider/auth_provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  Country selectedCountry = Country(
    phoneCode: "91",
    countryCode: "IN",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "India",
    example: "India",
    displayName: "India",
    displayNameNoCountryCode: "IN",
    e164Key: "",
  );
  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: Row(
                children: [
                  // Image.asset(
                  //     "/Users/ishantkamboj/Documents/Personal/Projects/Atal_Dispenser/Atal_new_software/atal_dispenser/assets/images/Welcome.jpg"),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 80, top: 100),
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
                    width: 100,
                  ),

                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 200.0),
                      child: Column(
                        children: [
                          Text(
                            "Welcome To ATAL",
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Please Enter Your Contact number to get OTP",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black54),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Container(
                            width: 400,
                            child: TextField(
                              controller: phoneController,
                              onChanged: (value) {
                                setState(() {
                                  phoneController.text = value;
                                });
                              },
                              decoration: InputDecoration(
                                  hintText: "Enter 10 digit phone number",
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.black12),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                    borderSide:
                                        BorderSide(color: Colors.black54),
                                  ),
                                  prefixIcon: Container(
                                    padding: EdgeInsets.all(10),
                                    child: InkWell(
                                      onTap: () {
                                        showCountryPicker(
                                            context: context,
                                            countryListTheme:
                                                CountryListThemeData(
                                              bottomSheetHeight: 700,
                                            ),
                                            onSelect: (value) {
                                              setState(() {
                                                selectedCountry = value;
                                              });
                                            });
                                      },
                                      child: Text(
                                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                  suffixIcon: phoneController.text.length == 10
                                      ? Container(
                                          height: 30,
                                          width: 30,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green,
                                          ),
                                          child: Icon(
                                            Icons.done,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        )
                                      : null),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                          ),
                          ElevatedButton(
                            // onPressed: () => sendPhoneNumber(),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => OtpScreen()));
                            },
                            // style: ButtonStyle(),
                            child: Text(
                              "Get OTP",
                              style: TextStyle(fontSize: 30),
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // void sendPhoneNumber() {
  //   final ap = Provider.of<AuthProvider>(context, listen: false);
  //   String phoneNumber = phoneController.text.trim();
  //   print("Formatted phone number: +${selectedCountry.phoneCode}$phoneNumber");
  //   ap.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber");
  // }
}
