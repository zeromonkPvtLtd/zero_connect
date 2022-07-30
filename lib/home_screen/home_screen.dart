import 'package:flutter/material.dart';
import 'package:zero_connect/home_screen/pages/audio_room_display_page.dart';
import 'package:zero_connect/home_screen/pages/chat_users_display_page.dart';
import 'package:zero_connect/home_screen/pages/events_page.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:zero_connect/home_screen/pages/post_display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final Tabs = [PostDisplayScreen(), EventsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        backgroundColor: Colors.white,
        title: Text(
          'Zero Connect',
        ),
        leadingWidth: 40,
        leading: Padding(
          padding: const EdgeInsets.only(left: 4),
          child: CircleAvatar(
            backgroundImage: AssetImage('images/zero_logo.png'),
            backgroundColor: Colors.grey,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.black87,
              ))
        ],
      ),
      body: Tabs[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   selectedItemColor: Colors.black,
      //   type: BottomNavigationBarType.fixed,
      //   items: [
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: 'rooms'),
      //     BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: 'events'),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      //   showSelectedLabels: true,
      //   showUnselectedLabels: false,
      //   currentIndex: _currentIndex,
      //   iconSize: 30,
      //   elevation: 3,
      // ),
      bottomNavigationBar: GNav(
        // tab button ripple color when pressed
        hoverColor: Colors.grey.shade700, // tab button hover color
        tabBorderRadius: 25,
        // tab button border
        curve: Curves.easeInExpo, // tab animation curves
        duration: Duration(milliseconds: 100), // tab animation duration
        color: Colors.grey[800], // unselected icon color
        activeColor: Colors.black,
        selectedIndex: _currentIndex, // selected icon and text color
        iconSize: 24, // tab button icon size
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 30),
        tabBackgroundColor:
            Colors.grey.withOpacity(0.2), // selected tab background color
        tabs: [
          GButton(
            icon: Icons.multitrack_audio_rounded,
            iconActiveColor: Colors.black,
            text: 'Rooms',
          ),
          GButton(
            icon: Icons.laptop_chromebook_outlined,
            text: 'Events',
          )
        ],
        haptic: true,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        onTabChange: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
