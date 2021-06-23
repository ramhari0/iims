import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:iimsapp/home.dart';
import 'package:iimsapp/my_args.dart';
import 'package:iimsapp/partial/facebook_section.dart';

class InstaLogin extends StatefulWidget {
  @override
  _InstaLoginState createState() => _InstaLoginState();
}

class _InstaLoginState extends State<InstaLogin> {
  //these variables can hold null value
  String? userNameHolder;
  String? passwordHolder;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300]!),
                    borderRadius: BorderRadius.all(Radius.circular(2)),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 100,
                        width: 270,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/insta.png'))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: TextFormField(
                          validator: userNameValidator,
                          onSaved: (userName) {
                            userNameHolder = userName;
                            print("VALUE AFTER USER CLICK IN LOGIN BUTTON" +
                                userName!);
                          },
                          onChanged: (userName) {
                            print(userName);
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'username',
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              contentPadding: const EdgeInsets.all(10)),
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(22.0),
                        child: TextFormField(
                          onSaved: (password) {
                            passwordHolder = password;
                          },
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              hintText: 'password',
                              hintStyle: TextStyle(
                                  fontSize: 18.0, color: Colors.black),
                              border:
                                  OutlineInputBorder(borderSide: BorderSide()),
                              contentPadding: const EdgeInsets.all(10)),
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ),
                      MaterialButton(
                        minWidth: 400,
                        color: Colors.blue,
                        onPressed: onPressed,
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      FacebookSection(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 80,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  //width: 300,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey[300]!),
                      color: Colors.white),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't  have an Account?",
                        style: TextStyle(color: Colors.black, fontSize: 18.0),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Sign up",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onPressed() async {
    String formUserName = "iims";
    String formPassword = "pw123";
    String formFavColor = "green";
    String formStatus = "WFH";

    //validate() triggers the validator of TextFormField
    if (_formKey.currentState!.validate()) {
      MyArguments formArgs =
          MyArguments(userName: formUserName, status: formStatus);
      //save() triggers the onSave method of TextFormField
      _formKey.currentState!.save();

      //if (passwordHolder == "iims_password") {
        final String? result =
            await Navigator.of(context).pushNamed('news-list');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(result!),
        ));
      //}
    }
  }

  String? userNameValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (value.length < 0) {
        return 'username length should be greater than 9';
      } else {
        return null;
      }
    } else {
      return 'username is a required field';
    }
  }
}
