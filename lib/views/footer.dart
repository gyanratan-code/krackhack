import 'package:flutter/material.dart';

class FooterWidget extends StatelessWidget {
  final int selectedIndex; // ✅ Store selected tab index

  const FooterWidget({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60, // ✅ Footer height
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, icon: Icons.home, index: 0, route: "/home"),
          _buildNavItem(context, icon: Icons.search, index: 1, route: "/search"),
          _buildAddButton(context), // ✅ Special case for "Add"
          _buildNavItem(context, icon: Icons.notifications, index: 3, route: "/notification"),
          _buildNavItem(context, icon: Icons.person, index: 4, route: "/profile"),
        ],
      ),
    );
  }

  // ✅ Function to build navigation item with dynamic color
  Widget _buildNavItem(BuildContext context, {required IconData icon, required int index, required String route}) {
    return IconButton(
      icon: Icon(icon, size: 30, color: selectedIndex == index ? Colors.black : Colors.black26), // Change color based on selection
      onPressed: () {
        if (selectedIndex != index) {
          Navigator.pushNamed(context, route);
        }
      },
    );
  }

  // ✅ Special "Add" Button with Square & Plus Icon
  Widget _buildAddButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (selectedIndex != 2) {
          Navigator.pushNamed(context, "/new");
        }
      },
      icon: Stack(
        alignment: Alignment.center,
        children: [
          Icon(Icons.crop_square, size: 32, color: selectedIndex == 2 ? Colors.black : Colors.black26), // Square icon
          Icon(Icons.add, size: 22, color: selectedIndex == 2 ? Colors.black : Colors.black26), // Centered Plus
        ],
      ),
    );
  }
}

