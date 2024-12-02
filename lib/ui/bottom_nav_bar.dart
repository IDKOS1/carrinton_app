import 'package:carrinton_app/theme/colors.dart';
import 'package:carrinton_app/ui/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<String> _icons = [
    'assets/icons/icon_home.svg',
    'assets/icons/icon_collected.svg',
    'assets/icons/icon_warehouse.svg',
    'assets/icons/icon_setting.svg',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    Center(child: Text('Collected', style: TextStyle(fontSize: 24))),
    Center(child: Text('Warehous', style: TextStyle(fontSize: 24))),
    Center(child: Text('Settings', style: TextStyle(fontSize: 24))),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Color(0x19000000),
                blurRadius: 10,
                offset: Offset(0, -4),
                spreadRadius: 0,
              )
            ],
          ),
          padding: EdgeInsets.all(10),
          child: Flex(
            direction: Axis.horizontal,
            children: List.generate(_icons.length, (index) {
              final bool isSelected = index == _selectedIndex;

              return Flexible(
                flex: 1,
                child: GestureDetector(
                  onTap: () => _onItemTapped(index),
                  behavior: HitTestBehavior.translucent,
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: isSelected ? 35 : 30,
                      height: isSelected ? 35 : 30,
                      child: SvgPicture.asset(
                        _icons[index],
                        color: isSelected ? mainColor : Colors.grey,
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
