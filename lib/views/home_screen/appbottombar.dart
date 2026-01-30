import 'package:flutter/material.dart';

class AppBottomBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;
  final Color primaryRed;

  const AppBottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
    this.primaryRed = const Color(0xFF8B0000),
  });

  @override
  Widget build(BuildContext context) {
    Icon _icon(IconData icon, int index) {
      return Icon(
        icon,
        color: Colors.white,
        size: selectedIndex == index ? 28 : 24,
      );
    }

    return SafeArea(
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: primaryRed,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: primaryRed.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () => onTap(0),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _icon(Icons.home, 0),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(1),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _icon(Icons.person_outline, 1),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(2),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _icon(Icons.mail_outline, 2),
              ),
            ),
            GestureDetector(
              onTap: () => onTap(3),
              behavior: HitTestBehavior.opaque,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: _icon(Icons.smart_toy_outlined, 3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
