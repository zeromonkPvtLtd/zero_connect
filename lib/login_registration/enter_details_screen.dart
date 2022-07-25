import 'package:flutter/material.dart';
import 'components/text_field_login.dart';
import '/home_screen/home_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EnterDetailsScreen extends StatefulWidget {
  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
    XFile _image;
  final ImagePicker _picker = ImagePicker();
  DateTime  _selectedDate;
final nameController = TextEditingController();
final departmentController = TextEditingController();
final mobNumController = TextEditingController();
final dobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: ListView.builder(
              itemCount: 1,
              itemBuilder: (BuildContext context, int index) {
                return SingleChildScrollView(
                    child: Container(
                        //  width: MediaQuery.of(context).size.width,
                        color: Colors.white,
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
                    child: Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Color(0xFFF2F2F2)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Icon(
                            Icons.camera_alt_rounded,
                            size: 30,
                            color: Colors.black26,
                          ),
                          Text(
                            'Tap to click/select ',
                            style: TextStyle(color: Colors.black26, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            'your profile picture',
                            style: TextStyle(color: Colors.black26, fontSize: 14.sp),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                onTap: (){
                  bottomSheet2(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Create your account ',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25.sp,
                      fontFamily: 'Comfortaa'),
                  textAlign: TextAlign.center,
                ),
              ),
                 Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 25.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                          Color.fromARGB(255, 244, 242, 242)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Full name',
                                        hintStyle: TextStyle(
                                            fontSize: 20,
                                            color:
                                                Color.fromARGB(103, 0, 0, 0))),
                                                controller: nameController,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10),
                                      color:
                                          Color.fromARGB(255, 244, 242, 242)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Department',
                                      hintStyle: TextStyle(
                                          fontSize: 20,
                                          color: Color.fromARGB(103, 0, 0, 0),
                                          ),
                                      suffixIcon: GestureDetector(
                                        child: Icon(
                                          Icons.keyboard_arrow_down,
                                          size: 40,
                                        ),
                                        onTap: () {
                                          print('Me too working');
                                          showAlertDialog1(context);
                                        },
                                      ),
                                    ),
                                    controller: departmentController,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                          Color.fromARGB(255, 244, 242, 242)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                        hintText: 'Mobile Number',
                                        hintStyle: TextStyle(
                                            fontSize: 20.sp,
                                            color:
                                                Color.fromARGB(103, 0, 0, 0))),
                                                controller: mobNumController,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.w, vertical: 15.h),
                                child: Container(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(10.r),
                                      color:
                                          Color.fromARGB(255, 244, 242, 242)),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'Date Of Birth',
                                      hintStyle: TextStyle(
                                          fontSize: 20.sp,
                                          color: Color.fromARGB(103, 0, 0, 0)),
                                      suffixIcon: GestureDetector(
                                        child: Icon(
                                          Icons.calendar_month_rounded,
                                          size: 35.sp,
                                        ),
                                        onTap: () {
                                           _presentDatePicker(context);
                                        },
                                      ),
                                    ),
                                    controller: dobController,
                                  ),
                                ),
                              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Proceed',
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
            ],
          ),));
              },
            ),
          );
        });
  }
  showAlertDialog1(BuildContext context) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
       
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text('Add Department'),
      content: Container(
        width: MediaQuery.of(context).size.width*0.3,
        height: MediaQuery.of(context).size.height*0.3,
        child: GestureDetector(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               Divider(),
              GestureDetector(
                child: Text('B.Tech'),
                onTap: (){},
              ),
              Divider(),
              GestureDetector(
                child: Text('BCA'),
                onTap: (){},
              ),
               Divider(),
              GestureDetector(
                child: Text('B Pharma'),
                onTap: (){},
              ),
               Divider(),
              GestureDetector(
                child: Text('Business'),
                onTap: (){},
              ),
               Divider(),
            ],
          ),
          onTap: () {
          },
        ),
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
  void _presentDatePicker (context) {
  showDatePicker(context: context, 
  initialDate: DateTime.now(), 
  firstDate: DateTime(2022), 
  lastDate: DateTime.now(),
  
  ).then((pickedDate) {
    if(pickedDate == null)
    return; 
    setState(() {
      
    _selectedDate = pickedDate;
    });
  });
}

bottomSheet2(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext c) {
        return Container(
          height: 100.0.h,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 20.h,
          ),
          child: Column(
            children: <Widget>[
              Text(
                "Choose Profile photo",
                style: TextStyle(
                  fontSize: 20.0.sp,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    FlatButton.icon(
                      icon: Icon(Icons.camera),
                      onPressed: () {
                        takePhoto(ImageSource.camera);
                      },
                      label: Text("Camera"),
                    ),
                    FlatButton.icon(
                      icon: Icon(Icons.image),
                      onPressed: () {
                        takePhoto(ImageSource.gallery);
                      },
                      label: Text("Gallery"),
                    ),
                  ])
            ],
          ),
        );
      },
    );
  }

  void takePhoto(ImageSource Source) async {
    // ignore: deprecated_member_use
    final pickedFile = await _picker.getImage(
      source: Source,
    );
    setState(() {
      _image = pickedFile as XFile;
    });
  }
}
