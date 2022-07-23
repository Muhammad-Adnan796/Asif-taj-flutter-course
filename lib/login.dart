import 'package:chapter_2_asif_taj/constants.dart';
import 'package:chapter_2_asif_taj/custom_button.dart';
import 'package:chapter_2_asif_taj/signup.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailC = TextEditingController();
  TextEditingController password = TextEditingController();

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
              height: height * 0.03,
            ),
            Center(
              child: Text(
                Constants.logintitle,
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: "Rubik Medium",
                    color: Color(0xff203142)),
              ),
            ),
            SizedBox(
              height: height * 0.05,
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
              height: height * 0.08,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                cursorColor: Color(0xFF323F48),
                focusNode: _focusNodeemail,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color(0xffF8F9FA),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.email_rounded,
                    color: Color(0xFF323F48),
                  ),
                  labelText: Constants.textfield1hintemail,
                  labelStyle: TextStyle(
                    fontFamily: "Rubik Regular",
                    color: _focusNodeemail.hasFocus
                        ? Color(0xffE4E7EB)
                        : Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.04,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: _isObscure,
                cursorColor: Color(0xFF323F48),
                focusNode: _focusNodepassword,
                decoration: InputDecoration(
                  suffixIcon: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isObscure = !_isObscure;
                        });
                      },
                      child: Icon(_isObscure == true
                          ? Icons.visibility
                          : Icons.visibility_off)),
                  filled: true,
                  fillColor: Color(0xffF8F9FA),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color(0xffE4E7EB),
                    ),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open_rounded,
                    color: Color(0xFF323F48),
                  ),
                  labelText: Constants.textfield1hintpasword,
                  labelStyle: TextStyle(
                    fontFamily: "Rubik Regular",
                    color: _focusNodepassword.hasFocus
                        ? Color(0xffE4E7EB)
                        : Colors.black26,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/forgot");
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 230),
                child: Text(
                  Constants.forgotp,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    fontFamily: "Rubik Regular",
                    color: Color(0xFF323F48),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.15,
            ),
            SizedBox(
              width: width * 1.5 / 2,
              height: height * 0.06,
              child: CustomButton(
                title: Text(
                  Constants.logintitle,
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: "Rubik Regular",
                    color: Colors.white,
                  ),
                ),
                onPress: () {
                   Navigator.pushNamed(context, "/lottery");
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
                  Constants.logwithothersnotaccount,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16,
                      fontFamily: "Rubik Regular",
                      color: Color(0xff4C5980)),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, "/signup");
                  },
                  child: Text(
                    Constants.logwithotherssignup,
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
}
