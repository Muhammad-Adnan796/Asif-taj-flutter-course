import 'package:chapter_2_asif_taj/constants.dart';
import 'package:chapter_2_asif_taj/custom_button.dart';
import 'package:flutter/material.dart';

class Signupage extends StatefulWidget {
  const Signupage({Key? key}) : super(key: key);

  @override
  State<Signupage> createState() => _SignupageState();
}

class _SignupageState extends State<Signupage> {
  TextEditingController nameC = TextEditingController();
  TextEditingController contactC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();

  final FocusNode _focusNodename = FocusNode();
  final FocusNode _focusNodecontact = FocusNode();
  final FocusNode _focusNodeemail = FocusNode();
  final FocusNode _focusNodepassword = FocusNode();

  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.050,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "images/logo.png",
                  height: height * 0.1,
                  width: width * 0.11,
                ),
                SizedBox(
                  width: width * 0.02,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Constants.loginlogomaint,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Rubik Medium",
                          color: Color(0xff203142)),
                    ),
                    Text(
                      Constants.loginlogobox,
                      style: TextStyle(
                          fontSize: 22,
                          fontFamily: "Rubik Regular",
                          color: Color(0xffF97030)),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: height * 0.014,
            ),
            Center(
              child: Text(
                Constants.signuptitle,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xff203142)),
              ),
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Center(
              child: Text(
                Constants.logdescription,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14,
                    fontFamily: "Rubik Regular",
                    color: Color(0xff4C5980)),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            signupTextfield(
                Constants.name,
                Icon(
                  Icons.person_outline_rounded,
                  color: Color(0xFF323F48),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.remove_red_eye_outlined,
                    color: Color(0xffF8F9FA),
                  ),
                ),
                nameC,
                false,
                "Rubike Regular",
                _focusNodename),
            signupTextfield(
                Constants.contact,
                Icon(
                  Icons.call,
                  color: Color(0xFF323F48),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Color(0xffF8F9FA),
                    )),
                contactC,
                false,
                "Rubike Regular",
                _focusNodecontact),
            signupTextfield(
              Constants.textfield1hintemail,
              Icon(
                Icons.email_rounded,
                color: Color(0xFF323F48),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.abc,
                  color: Color(0xffF8F9FA),
                ),
              ),
              emailC,
              false,
              "Rubik Regular",
              _focusNodeemail,
            ),
            signupTextfield(
              Constants.textfield1hintpasword,
              Icon(
                Icons.lock_open_rounded,
                color: Color(0xFF323F48),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    _isObscure = !_isObscure;
                  });
                },
                icon: Icon(
                  _isObscure ? Icons.visibility : Icons.visibility_off,
                  color: _focusNodepassword.hasFocus
                      ? Color(0xFF323F48)
                      : Colors.black54,
                ),
              ),
              passwordC,
              _isObscure,
              "Rubike Regular",
              _focusNodepassword,
            ),
            SizedBox(
              height: height * 0.04,
            ),
            SizedBox(
              width: width * 1.5 / 2,
              height: height * 0.06,
              child: CustomButton(
                title: Text(
                  Constants.signuptitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Rubik Regular",
                    color: Colors.white,
                  ),
                ),
                onPress: () {
                  Navigator.pushNamed(context, "/forgot");
                },
                backgroundColor: Color(0xffF97030),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Constants.signupalreadyaccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik Regular",
                      color: Color(0xff4C5980)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/login");
                  },
                  child: Text(
                    Constants.logintitle,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontFamily: "Rubik Medium",
                        color: Color(0xffF97030)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding signupTextfield(var texthint, Icon prefixicon,
      IconButton? suffixiconb, var controllar, bool obscure, String fontfamily,
      [FocusNode? _focusNode]) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: TextFormField(
        obscureText: obscure,
        cursorColor: Color(0xFF323F48),
        focusNode: _focusNode,
        decoration: InputDecoration(
          suffixIcon: suffixiconb,
          filled: true,
          fillColor: Color(0xffF8F9FA),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: Color(0xffE4E7EB),
            ),
          ),
          prefixIcon: prefixicon,
          labelText: texthint,
          labelStyle: TextStyle(
            fontFamily: fontfamily,
            color: _focusNode!.hasFocus ? Color(0xffE4E7EB) : Colors.black26,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
