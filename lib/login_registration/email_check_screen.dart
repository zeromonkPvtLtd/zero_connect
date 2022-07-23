import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/constants.dart';
import '/login_registration/enter_details_screen.dart';
import 'components/text_field_login.dart';
import 'components/bottom_sheet.dart';

class EmailCheckScreen extends StatefulWidget {
  static const id = '/EmailCheckScreen';
  const EmailCheckScreen({Key? key}) : super(key: key);

  @override
  State<EmailCheckScreen> createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Flexible(
                fit: FlexFit.loose,
                child: Image(
                    image: AssetImage('images/zero_logo.png'), height: 100)),
            SizedBox(
              height: 20,
            ),
            Center(
              child: Text(
                companyName,
                style: TextStyle(
                    fontSize: 40, fontFamily: 'Lombok', color: Colors.black),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            TextFieldLogin(
              hintText: 'Enter your mail ID',
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 15),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      enableDrag: false,
                      isDismissible: false,
                      context: context,
                      builder: (context) => BottomSheetContainer());
                },
                child: Text(
                  'Verify',
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
            SizedBox(
              height: 25,
            ),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    height: 1.5,
                    color: Colors.black45,
                    indent: 40,
                    endIndent: 20,
                  ),
                ),
                Text(
                  'or',
                  style: TextStyle(fontSize: 16, color: Color(0xFFA3A3A3)),
                ),
                Expanded(
                  child: Divider(
                    height: 1.5,
                    color: Colors.black45,
                    indent: 20,
                    endIndent: 40,
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
        ));
  }
}
