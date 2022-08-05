import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:smarcra/shared/themes/colors.dart';

class HomeBottomNavigation extends StatefulWidget {
  final List<Widget> pages;
  const HomeBottomNavigation({Key? key, required this.pages}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeBottomNavigationState createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.pages.elementAt(_selectedIndex),
      backgroundColor: Colors.white,
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 1),
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 0
                  ? Ionicons.document_text
                  : Ionicons.document_text_outline,
              color: AppColors.primaryColor,
            ),
            label: 'Time Sheet',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 1
                  ? Ionicons.calendar
                  : Ionicons.calendar_outline,
              color: AppColors.primaryColor,
            ),
            label: 'Leaves',
          ),
          NavigationDestination(
            icon: Icon(
              _selectedIndex == 2 ? Ionicons.cash : Ionicons.cash_outline,
              color: AppColors.primaryColor,
            ),
            label: 'Expenses',
          ),
        ],
      ),
    );
  }
}
