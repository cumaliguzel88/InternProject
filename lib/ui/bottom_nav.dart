import 'package:binamod/ui/theme/colors.dart';
import 'package:binamod/ui/view/pages/google_maps_page.dart';
import 'package:binamod/ui/view/pages/settings_page.dart';
import 'package:binamod/ui/view/pages/upload_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var indeks = 0;
  var pages = [
    const GoogleMapsPage(),
    const UploadPage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(),
        child: Container(
          color: colorDeepPurpleFifty,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: GNav(
              onTabChange: (index) {
                setState(() {
                  indeks = index;
                });
              },
              tabBackgroundColor: colorDeepPurple,
              activeColor: colorWhite,
              color: Colors.white,
              backgroundColor: colorDeepPurpleFifty,
              gap: 10,
              tabs: const [
                GButton(
                  icon: Icons.location_pin,
                  iconSize: 25,
                  text: "Maps",
                ),
                GButton(
                  icon: Icons.upload_sharp,
                  iconSize: 25,
                  text: "Upload",
                ),
                GButton(
                  icon: Icons.settings,
                  iconSize: 25,
                  text: "Settings",
                ),
              ],
            ),
          ),
        ),
      ),
      body: pages[indeks],
    );
  }
}
