import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

const blueColor = Color(0xff000066);
const btntxtColor = Color(0xffffffff);
const alertColor = Colors.red;
const alertMessage = Colors.redAccent;

OutlineInputBorder btnOutlineBordr() {
  return OutlineInputBorder(
    borderSide: BorderSide(
      color: blueColor,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(20),
  );
}

ButtonStyle LoginBUtton() {
  return ButtonStyle(
    foregroundColor: MaterialStateProperty.all(btntxtColor),
    backgroundColor: MaterialStateProperty.all(blueColor),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

Widget okButton(BuildContext context) {
  return TextButton(
    child: Text("OK"),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

AlertDialog alert(BuildContext context, String msgContent) {
  return AlertDialog(
    title: Text(
      "Failed!",
      style: TextStyle(color: alertColor),
    ),
    content: Text(
      "$msgContent",
      style: TextStyle(color: alertMessage),
    ),
    actions: [
      okButton(context),
    ],
  );
}

Future<dynamic> ShowDlgMsg(BuildContext context, String msgContent) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert(context, msgContent);
    },
  );
}

InputDecoration TxtInput() {
  return InputDecoration(
      counterText: "",
      hintText: "Enter your mobile number",
      contentPadding: EdgeInsets.only(left: 25),
      prefixIcon: CountryCodePicker(
        initialSelection: "IN",
        enabled: false,
      ),
      enabledBorder: btnOutlineBordr(),
      focusedBorder: btnOutlineBordr());
}

TextStyle TxtStyleSmall() {
  return TextStyle(
    fontSize: 16,
    color: Color(0x8a000000),
    fontWeight: FontWeight.bold,
  );
}
