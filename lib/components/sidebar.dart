import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home.dart';
import 'package:flutter_tutorial/pages/settings.dart';
import 'package:sidebarx/sidebarx.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int _selectedIndex = 0;

    return Scaffold(body: StreamBuilder<int>(
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return SidebarX(
          controller: SidebarXController(selectedIndex: 0),
          theme: SidebarXTheme(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.black38,
              borderRadius: BorderRadius.circular(10),
            ),
            hoverColor: Colors.amber,
            textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
            selectedTextStyle: const TextStyle(color: Colors.white),
            itemTextPadding: const EdgeInsets.only(left: 30),
            // selectedItemTextPadding: const EdgeInsets.only(left: 30),
            itemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black26),
            ),
            selectedItemDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Colors.amber.withOpacity(0.37),
              ),
              // gradient: const LinearGradient(
              //   colors: [accentCanvasColor, canvasColor],
              // ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.28),
                  blurRadius: 30,
                )
              ],
            ),
            iconTheme: IconThemeData(
              color: Colors.white.withOpacity(0.7),
              size: 20,
            ),
            selectedIconTheme: const IconThemeData(
              color: Colors.white,
              size: 20,
            ),
          ),
          extendedTheme: const SidebarXTheme(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.black38,
            ),
          ),
          // headerBuilder: (context, extended) {
          //   return SizedBox(
          //     height: 100,
          //     child: Padding(
          //       padding: const EdgeInsets.all(16.0),
          //       child: Image.asset('assets/images/avatar.png'),
          //     ),
          //   );
          // },
          items: [
            SidebarXItem(
              icon: Icons.home,
              label: 'Home',
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => new HomePage()));
                Navigator.pop(context);
              },
            ),
            SidebarXItem(
                icon: Icons.settings,
                label: 'Settings',
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => new SettingsPage()));
                  Navigator.pop(context);
                }),
          ],
        );
      },
    ));
  }
}
