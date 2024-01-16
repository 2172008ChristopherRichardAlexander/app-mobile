import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:tugasbesar_2172008/pages/editprofile.dart';
import 'package:tugasbesar_2172008/pages/home.dart';

class NavbarPage extends StatefulWidget {
  const NavbarPage({Key? key}) : super(key: key);

  @override
  State<NavbarPage> createState() => _NavbarPageState();
}

class _NavbarPageState extends State<NavbarPage> {
  final items = const [
    Icon(Icons.home),
    Icon(Icons.people),
  ];
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      bottomNavigationBar: CurvedNavigationBar(
        index: _index,
        items: items,
        backgroundColor: Colors.orange,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (myIndex) {
          setState(() {
            _index = myIndex;
          });
        },
      ),
      body: Container(
        child: getSelectedWidget(index: _index),
      ),
    );
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 1:
      widget =  HomePage();
      break;
    case 2:
      widget = const EditProfilePage();
      break;
    default:
      widget =  HomePage();
      break;
  }
  return widget;
}
