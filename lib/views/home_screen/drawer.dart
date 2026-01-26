import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../models/login_response_model.dart';
import '../login_screen/login_view.dart';
import '../../services/session_service.dart';

const Color darkRed = Color(0xFF8B0000);

class DarkRedDrawer extends StatelessWidget {
  const DarkRedDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // Get user data from login arguments
    final User? user = Get.arguments as User?;
    final String displayName = user != null 
        ? '${user.first_name} ${user.last_name}' 
        : 'User';
    final String partnerId = user?.id.toString() ?? '000000';
    
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            // HEADER (same layout, dark red)
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: darkRed,
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: darkRed, size: 28),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          displayName,
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user?.designations.isNotEmpty == true 
                              ? user!.designations.first.name 
                              : 'Sales Executive',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          user?.email ?? 'employee@example.com',
                          style: GoogleFonts.poppins(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right, color: Colors.white, size: 26),
                ],
              ),
            ),

            // BODY
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const SizedBox(height: 10),

                  _sectionTitle("Work Location"),
                  _drawerTile(
                    icon: Icons.location_on_outlined,
                    title: user?.departments.isNotEmpty == true 
                        ? user!.departments.first.name 
                        : 'Department Not Assigned',
                    onTap: () {},
                  ),
                  _drawerTile(
                    icon: Icons.business_outlined,
                    title: user?.departments.isNotEmpty == true 
                        ? user!.departments.first.description 
                        : 'No Description',
                    onTap: () {},
                  ),

                  const SizedBox(height: 16),
                  _sectionTitle("Sales Information"),
                  _drawerTile(
                    icon: Icons.work_outline,
                    title: "My Quotations",
                    onTap: () {},
                  ),
                  _drawerTile(
                    icon: Icons.people_outline,
                    title: "My Leads",
                    onTap: () {},
                  ),
                  _drawerTile(
                    icon: Icons.description_outlined,
                    title: "Reports",
                    onTap: () {},
                  ),

                  const Divider(height: 24, thickness: 1),
                  _drawerTile(
                    icon: Icons.logout,
                    title: "Logout",
                    onTap: () async {
                      Get.back();
                      await SessionService.clearSession();
                      Get.offAll(() => LoginView());
                    },
                    isLogout: true,
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: Text(
        text,
        style: GoogleFonts.poppins(
          color: Colors.black87,
          fontSize: 13,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _drawerTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    bool isLogout = false,
  }) {
    return ListTile(
      dense: true,
      leading: Icon(
        icon,
        color: isLogout ? darkRed : Colors.black54,
        size: 22,
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: isLogout ? darkRed : Colors.black87,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
