import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    final emailController = TextEditingController();
  var _emailFormKey = GlobalKey<FormState>();
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
                body: Container(
                  height: MediaQuery.of(context).size.height * 1.0,
                  //  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return SingleChildScrollView(
                        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Image(
                    image: AssetImage('images/zero_logo.png'), height: 100.h)),
            SizedBox(
              height: 20.h,
            ),
            Center(
              child: Text(
                companyName,
                style: TextStyle(
                    fontSize: 40.sp, fontFamily: 'Lombok', color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            TextFormField(
                                  key: _emailFormKey,
                                  decoration: InputDecoration(
                                    hintText: 'Enter your mail ID',
                                    
                                    hintStyle: TextStyle(
                                        color: Color.fromARGB(88, 0, 0, 0)),
                                    border: InputBorder.none,
                                  ),
                                   controller: emailController,
                                  cursorColor: Colors.black,
                                  cursorHeight: 25.sp,
                                  ),
            SizedBox(height: 15.h),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  
                       setState(() {
                                      emailController.text.isEmpty ||
                                              !emailController.text
                                                  .contains('@')
                                          ? showAlertDialog(context)
                                          :showModalBottomSheet(
                      enableDrag: false,
                      isDismissible: false,
                      context: context,
                      builder: (context) => BottomSheetContainer());
                                    });
                },
                child: Text(
                  'Verify',
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16.sp),
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
                  style: TextStyle(fontSize: 16.sp, color: Color(0xFFA3A3A3)),
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
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
                        style:
                            TextStyle(fontSize: 15, color: Color(0xFFA3A3A3)),
                      )
                    ],
                  )),
            )
          ],
        )
                      );
                    },
                  ),
                ),
              );
            }),
          );
        });
  }

  _bottomSheet(context){
    showModalBottomSheet(context: context, builder: (BuildContext c){
           return Container(
             width: MediaQuery.of(context).size.width,
             height:MediaQuery.of(context).size.height,        
                  child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 Container(
                 
                              width: 50.w,
                              height: 1, decoration: BoxDecoration(border: Border.all(color: Colors.black))),
                              Image(width: 100.w,
                                image: (AssetImage('images/en-removebg-preview.png'))),
                               Text('Please check your E-mail',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25.sp),),
                              Column(
                                children: [
                                 Text('A Verification link has been sent to your',style: TextStyle(color: Color.fromARGB(111, 0, 0, 0)),),
                               Text('mail Id Please Verify to Proceed',style: TextStyle(color: Color.fromARGB(111, 0, 0, 0)),),
                                ],
                              ),
                               GestureDetector(
                                 child: Container(
                                  width: 100.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Color.fromARGB(111, 0, 0, 0)),
                                    borderRadius: BorderRadius.circular(30.r),
                                  ),
                                  child: Center(child: Text('Send Again',style: TextStyle(color: Color.fromARGB(111, 0, 0, 0)),)),
                                 ),
                                 onTap: (){
                                  print('I am working');
                                 },
                               )
              ],
             ),
           );
    },
    );
  }

  }
  
  showAlertDialog(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Enter Valid Email ID'),
      content: GestureDetector(
        child: Text(
          'Tap here if You Don\'t Have an Account',
          style: TextStyle(color: Colors.grey),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => EmailCheckScreen()),
          );
        },
      ),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
}
