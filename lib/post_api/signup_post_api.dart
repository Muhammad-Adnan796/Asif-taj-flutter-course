import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PostSignupApi extends StatefulWidget {
  const PostSignupApi({Key? key}) : super(key: key);

  @override
  State<PostSignupApi> createState() => _PostSignupApiState();
}

class _PostSignupApiState extends State<PostSignupApi> {

  // signup and login post api integration page
  
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
 void  login(String email,password) async {
  try{

  final response = await http.post(Uri.parse("https://reqres.in/api/register"),
      body: {
        "email": email,
        "password": password,
      }
  );
  if(response.statusCode == 200){
    var data = jsonDecode(response.body.toString());
    print(data);
    print("Account created Succecfully");
  }else{
    print("Failed");
  }

  }catch(e){
  print(e.toString());
  }}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Sign up Api"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          
          children: [
            TextFormField(
              controller: emailC,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.7),
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: passwordC,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey.withOpacity(0.7),
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                login(emailC.text.toString(), passwordC.text.toString());
              },
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.purple.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(child: Text("Submit")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// eve.holt@reqres.in

// pistol