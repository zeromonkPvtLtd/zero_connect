import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '/constants.dart';
import '/login_registration/enter_details_screen.dart';
import 'components/text_field_login.dart';
import 'components/bottom_sheet.dart';

class EmailCheckScreen extends StatefulWidget {
  static const id = '/EmailCheckScreen';

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  List<String> emails = [
    "pankaj@gmail.com",
    "abhi@gmail.com",
    "soumyadeep@gmail.com",
    "divya@quantumuniversity.edu.in"
  ];

  final emailController = TextEditingController();

  void checkEmail() {
    var conts = emailController.text;
    for (int i = 0; i < emails.length; i++) {
      if (conts == emails[i]) {
        showModalBottomSheet(
            enableDrag: false,
            isDismissible: false,
            context: context,
            builder: (context) => BottomSheetContainer());
      }
    }
    if (!emails.contains(conts)) showAlertDialog();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            home: Builder(builder: (BuildContext context) {
              return Scaffold(
                backgroundColor: Colors.white,
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                        fit: FlexFit.loose,
                        child: Image(
                            image: AssetImage('images/zero_logo.png'),
                            height: 100.h)),
                    SizedBox(
                      height: 20.h,
                    ),
                    Center(
                      child: Text(
                        companyName,
                        style: TextStyle(
                            fontSize: 40.sp,
                            fontFamily: 'Lombok',
                            color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),

                    TextFieldLogin(
                        hintText: 'Enter your mail ID',
                        textInputType: TextInputType.emailAddress,
                        controller: emailController),
                    // TextFormField(
                    //   key: _emailFormKey,
                    //   decoration: InputDecoration(
                    //       hintText: 'Enter your mail ID',
                    //       hintStyle:
                    //           TextStyle(color: Color.fromARGB(88, 0, 0, 0)),
                    //       border: InputBorder.none,
                    //       fillColor: Color(0xFFDBDCDC)),
                    //   controller: emailController,
                    //   cursorColor: Colors.black,
                    //   cursorHeight: 25.sp,
                    // ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            emailController.text.isEmpty ||
                                    !emailController.text.contains('@')
                                ? showAlertDialog()
                                : checkEmail();
                          });
                        },
                        child: Text(
                          'Verify',
                          style: TextStyle(
                              color: Color(0xFFFFFFFF), fontSize: 16.sp),
                        ),
                        style: ElevatedButton.styleFrom(
                          padding: EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(13.r)),
                          primary: Color(0xFF000000),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25.h,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            height: 1.5.h,
                            color: Colors.black45,
                            indent: 40.sp,
                            endIndent: 20.sp,
                          ),
                        ),
                        Text(
                          'or',
                          style: TextStyle(
                              fontSize: 16.sp, color: Color(0xFFA3A3A3)),
                        ),
                        Expanded(
                          child: Divider(
                            height: 1.5.h,
                            color: Colors.black45,
                            indent: 20.sp,
                            endIndent: 40.sp,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 20),
                      child: TextButton(
                          onPressed: () {},
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Image(
                                image: AssetImage('images/gmail_icon.png'),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Log in using Google',
                                style: TextStyle(
                                    fontSize: 15, color: Color(0xFFA3A3A3)),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              );
            }),
          );
        });
  }

  void showAlertDialog() {
    Alert(
      context: context,
      title: "Enter a valid email",
      style: AlertStyle(
          descStyle: TextStyle(
            color: Colors.black54,
            fontSize: 16,
          ),
          descTextAlign: TextAlign.justify),
      desc: "Please enter your college domain email id "
          "or the email reistered by you in your college",
      buttons: [
        DialogButton(
          child: Text(
            "Ok",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
          color: Colors.black,
        )
      ],
    ).show();
  }
}
