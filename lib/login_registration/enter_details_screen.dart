import 'package:flutter/material.dart';
import 'components/text_field_login.dart';
import '/home_screen/home_screen.dart';

class EnterDetailsScreen extends StatefulWidget {
  const EnterDetailsScreen({Key? key}) : super(key: key);

  @override
  State<EnterDetailsScreen> createState() => _EnterDetailsScreenState();
}

class _EnterDetailsScreenState extends State<EnterDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              CircleAvatar(
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
                          style: TextStyle(color: Colors.black26, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          'your profile picture',
                          style: TextStyle(color: Colors.black26, fontSize: 14),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
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
              ),
              TextFieldLogin(
                hintText: 'Department',
                iconData: Icons.keyboard_arrow_down,
              ),
              TextFieldLogin(
                hintText: 'Designation',
                iconData: Icons.keyboard_arrow_down,
              ),
              TextFieldLogin(
                hintText: 'Mobile Number',
                textInputType: TextInputType.text,
                obscureText: true,
              ),
              TextFieldLogin(
                hintText: 'Date Of Birth',
                iconData: Icons.calendar_month_rounded,
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                  child: Text(
                    'Proceed',
                    style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(13)),
                    primary: Color(0xFF000000),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
