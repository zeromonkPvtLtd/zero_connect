import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zero_connect/login_registration/components/selection_container.dart';
import 'components/text_field_login.dart';
import '/home_screen/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterDetailsScreen extends StatefulWidget {
  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  late var _image;
  File? image;
  bool imagePicked = false;
  DateTime? _selectedDate;
  final nameController = TextEditingController();
  final departmentController = TextEditingController();
  final mobNumController = TextEditingController();
  var dobController = TextEditingController();

  @override
  void initState() {
    dobController.text = "";
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 30),
                    GestureDetector(
                      child: CircleAvatar(
                        backgroundColor: Color(0xFFDFDFDF),
                        radius: 100,
                        child: Padding(
                          padding: const EdgeInsets.all(1),
                          child: image != null
                              ? ClipOval(
                                  child: Container(
                                    margin: EdgeInsets.zero,
                                    color: Colors.white,
                                    constraints: BoxConstraints.tight(
                                        Size.fromRadius(95)),
                                    child: Image.file(
                                      image!,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xFFF2F2F2)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Icon(
                                        Icons.camera_alt_rounded,
                                        size: 30,
                                        color: Colors.black26,
                                      ),
                                      Text(
                                        'Tap to click/select ',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 14),
                                        textAlign: TextAlign.center,
                                      ),
                                      Text(
                                        'your profile picture',
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontSize: 14),
                                        textAlign: TextAlign.center,
                                      )
                                    ],
                                  ),
                                ),
                        ),
                      ),
                      onTap: () {
                        bottomSheet2(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Create your account ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: 'Comfortaa'),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    TextFieldLogin(
                      hintText: 'Full name',
                      textInputType: TextInputType.text,
                      controller: nameController,
                      obscureText: false,
                    ),
                    SelectionContainer(
                        title: "Department",
                        icon: Icons.keyboard_arrow_down_rounded),
                    SelectionContainer(
                        title: "Designation",
                        icon: Icons.keyboard_arrow_down_rounded),
                    TextFieldLogin(
                      controller: mobNumController,
                      hintText: 'Mobile Number',
                      textInputType: TextInputType.number,
                      obscureText: false,
                    ),
                    SelectionContainer(
                        title: "Date of birth",
                        icon: Icons.calendar_month_rounded),
                    SizedBox(height: 30.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomeScreen()));
                        },
                        child: Text(
                          'Proceed',
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
                  ],
                ),
              ),
            ),
          );
        });
  }

  showAlertDialog1(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add Department'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.3,
        height: MediaQuery.of(context).size.height * 0.3,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Divider(),
              GestureDetector(
                child: Text('B.Tech'),
                onTap: () {},
              ),
              Divider(),
              GestureDetector(
                child: Text('BCA'),
                onTap: () {},
              ),
              Divider(),
              GestureDetector(
                child: Text('B Pharma'),
                onTap: () {},
              ),
              Divider(),
              GestureDetector(
                child: Text('Business'),
                onTap: () {},
              ),
              Divider(),
            ],
          ),
          onTap: () {},
        ),
      ),
      actions: [
        okButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _presentDatePicker(context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) return;
      setState(() {
        _selectedDate = pickedDate;
        dobController.text = _selectedDate as String;
      });
    });
  }

  bottomSheet2(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Choose Profile Picture",
                style: TextStyle(fontSize: 20.0.sp, color: Colors.black54),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.camera),
                      iconSize: 50.h,
                      onPressed: () {
                        pickImage(ImageSource.camera);
                        Navigator.pop(context);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.image, semanticLabel: 'Gallery'),
                      iconSize: 50.h,
                      onPressed: () {
                        pickImage(ImageSource.gallery);
                        Navigator.pop(context);
                      },
                    ),
                  ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text('camera'),
                  Text('Gallery'),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() {
        this.image = imageTemp;
      });
    } on PlatformException catch (e) {
      print('platform not supported');
    }
  }
}
