import 'package:flutter/material.dart';

import 'aps_color.dart';

class ListBottomNavigation {
  List<Widget> get defaultBottomNavigasi {
    return const <Widget>[
      NavigationDestination(
        selectedIcon: Icon(
          Icons.home_filled,
          color: ApsColor.primaryColor,
        ),
        icon: Icon(
          Icons.home_filled,
          color: ApsColor.grey,
        ),
        label: 'Dashboard',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.insert_chart_outlined,
          color: ApsColor.primaryColor,
        ),
        icon: Icon(
          Icons.insert_chart_outlined,
          color: ApsColor.grey,
        ),
        label: 'College',
      ),
      NavigationDestination(
        selectedIcon: Icon(
          Icons.person,
          color: ApsColor.primaryColor,
        ),
        icon: Icon(
          Icons.person,
          color: ApsColor.grey,
        ),
        label: 'Profile',
      ),
    ];
  }
}
