import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/screens/otpScreen.dart';

class LoginPage extends StatelessWidget {
  String mobNo = "";

  //final textFieldValueHolder = TextEditingController();
  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 50),
          width: double.infinity,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(80.0),
                  child: Text(
                    "Company Name",
                    style: TextStyle(fontSize: 24, color: blueColor),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Continue with phone number",
                    style: TxtStyleSmall(),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    decoration: TxtInput(),
                    onChanged: (value) {
                      mobNo = value;
                      print(value);
                    },
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 50,
                  child: TextButton(
                    style: LoginBUtton(),
                    child: Text("Login"),
                    onPressed: () {
                      if (mobNo.length < 10 || mobNo.isEmpty) {
                        print("Please Enter Valid Mobile Number");
                        ShowDlgMsg(context, "Please Enter Valid Mobile Number");
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OtpScreen()));
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
