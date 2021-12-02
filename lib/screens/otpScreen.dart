import 'package:flutter/material.dart';
import 'package:loginpage/constants.dart';
import 'package:loginpage/screens/home.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

String btnName = "Login", otp = "", verifyOtp = "741356";

class _OtpScreenState extends State<OtpScreen> {
  bool isButtonClick = true;

  void ButtonClick() async {
    Duration seconds = Duration(seconds: 3);

    if (verifyOtp == otp) {
      setState(() {
        isButtonClick = false;
        btnName = "Verifying";
        Future.delayed(seconds, () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Home()));
        });
      });
    } else {
      ShowDlgMsg(context, "OTP Missmatch");
      isButtonClick = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Spacer(flex: 3,),
              Container(
                padding: EdgeInsets.only(top: 70),
                width: MediaQuery.of(context).size.width * .25,
                height: MediaQuery.of(context).size.height * .25,
                child: Image(
                  image: AssetImage("images/otpimage.png"),
                ),
              ),
              Spacer( flex: 3,),
              Container(
                padding: EdgeInsets.only(top: 60),
                child: Text(
                  "Verify OTP",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Spacer(flex: 2,),
              Container(
                padding: EdgeInsets.only(top: 20, bottom: 20),
                child: Text(
                  "Enter the code from the SMS we just sent you.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              Spacer(),
              Container(
                padding:
                    EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                child: OTPTextField(
                  length: 6,
                  width: double.infinity,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  fieldWidth: 50,
                  fieldStyle: FieldStyle.box,
                  outlineBorderRadius: 15,
                  style: TextStyle(fontSize: 17),
                  onCompleted: (text) {
                    otp = text;
                    print(otp);
                  },
                ),
              ),
              Spacer(flex: 1,),
              Container(
                padding: EdgeInsets.only(left: 5, right: 5),
                margin: EdgeInsets.all(10),
                height: 50,
                width: double.infinity,
                child: Opacity(
                  opacity: isButtonClick ? 1.0 : 0.2,
                  child: ElevatedButton(
                    style: LoginBUtton(),
                    child: Text("$btnName"),
                    onPressed: () {
                      if (isButtonClick) {
                        ButtonClick();
                      }
                    },
                  ),
                ),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.only(top: 30, bottom: 10),
                child: Text('Didn\'t received OTP?'),
              ),
              Container(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Resend OTP",
                  style: TextStyle(fontSize: 18, color: Color(0xff3333ff)),
                ),
              ),
              Spacer(flex: 2,),
            ],
          ),
        ),
      ),
    );
  }
}
