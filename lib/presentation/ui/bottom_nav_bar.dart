import 'package:carrinton_app/presentation/view_models/base/nav_enum_model.dart';
import 'package:carrinton_app/presentation/ui/base/base_screen.dart';
import 'package:carrinton_app/presentation/ui/collected/collected_screen.dart';
import 'package:carrinton_app/presentation/ui/container/ware_house_screen.dart';
import 'package:carrinton_app/presentation/ui/home/home_screen.dart';
import 'package:carrinton_app/presentation/ui/setting/setting_screen.dart';
import 'package:carrinton_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  final List<Nav> pages = [
    Nav.home,
    Nav.collected,
    Nav.wareHouse,
    Nav.settings,
  ];

  final List<Widget> bodies = [
    const HomeScreen(),
    const CollectedScreen(),
    const WarehouseScreen(),
    const SettingScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isBaseScreenApplied = _selectedIndex != 3; // Settings는 BaseScreen 미적용

    return SafeArea(
      top: false,
      child: Scaffold(
        body: isBaseScreenApplied
            ? BaseScreen(
          page: pages[_selectedIndex],
          body: bodies[_selectedIndex],
        )
            : bodies[_selectedIndex], // Settings는 BaseScreen 없이 바로 표시
        bottomNavigationBar: Container(
          height: 70,
          decoration: const BoxDecoration(
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
          padding: const EdgeInsets.all(10),
          child: Row(
            children: List.generate(pages.length, (index) {
              final isSelected = index == _selectedIndex;

              return Expanded(
                child: GestureDetector(
                  onTap: () => _onItemTapped(index),
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    width: isSelected ? 35 : 30,
                    height: isSelected ? 35 : 30,
                    child: SvgPicture.asset(
                      'assets/icons/icon_${pages[index].name.toLowerCase()}.svg',
                      color: isSelected ? mainColor : Colors.grey,
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

