import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// 🔴 CURVED RED HEADER
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            child: ClipPath(
              clipper: CurvedHeaderClipper(),
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/background1.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          /// 📜 MAIN CONTENT
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 14),
                  _buildHeader(),
                  const SizedBox(height: 24),
                  _buildWelcomeBox(),
                  const SizedBox(height: 24),
                  _buildDashboardSection(context),
                  const SizedBox(height: 24),
                  _buildQuickActions(),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  /// 🔝 HEADER
  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "FWG India",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Text(
              "Security & Facility Services",
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
          ],
        ),
        Row(
          children: const [
            Icon(Icons.notifications, size: 26, color: Colors.white),
            SizedBox(width: 12),
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage("assets/userr.jpg"),
            ),
          ],
        ),
      ],
    );
  }

  /// 👋 WELCOME BOX
  Widget _buildWelcomeBox() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        image: const DecorationImage(
          image: AssetImage("assets/rectangle.png"),
          fit: BoxFit.cover,
          opacity: 0.12,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 6),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 28,
                backgroundImage: AssetImage("assets/userr.jpg"),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() => Text(
                        "Hi, ${controller.userName.value} 👋",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(0xff7A001F),
                        ),
                      )),
                  Text(
                    "Welcome back FWG",
                    style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            "Protecting People. Ensuring Safety. Delivering Excellence.",
            style: GoogleFonts.poppins(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: const Color(0xff7A001F),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1,
            color: const Color(0xff7A001F).withOpacity(0.3),
          ),
          const SizedBox(height: 10),
          Text(
            "Welcome to FWG India — your trusted partner in integrated security and facility solutions.\n"
            "Track services, request support, and access instant help — all in one place.",
            style: GoogleFonts.poppins(
              fontSize: 13,
              color: Colors.black54,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }



  /// 📦 DASH CARD
 Widget _dashCard(String title, RxInt count, bool isPrimary, IconData icon) {
  return Container(
    padding: const EdgeInsets.all(14),
    decoration: BoxDecoration(
      color: isPrimary ? const Color(0xffA00020) : Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.15),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 28,
          color: isPrimary ? Colors.white : const Color(0xffA00020),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isPrimary ? Colors.white : Colors.black87,
          ),
        ),
        const SizedBox(height: 6),
        Obx(
          () => Text(
            count.value.toString().padLeft(2, '0'),
            style: GoogleFonts.poppins(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: isPrimary ? Colors.white : const Color(0xffA00020),
            ),
          ),
        ),
      ],
    ),
  );
}



Widget _buildDashboardSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Dashboard",
        style: GoogleFonts.poppins(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      const SizedBox(height: 15),

      Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 125,
              child: _dashCard(
                "Active Service",
                controller.activeServiceCount,
                true,
                Icons.design_services,
              ),
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: SizedBox(
              height: 125,
              child: _dashCard(
                "Pending Requests",
                controller.pendingRequestsCount,
                false,
                Icons.pending_actions,
              ),
            ),
          ),
          const SizedBox(width: 10),

          Expanded(
            child: SizedBox(
              height: 125,
              child: _dashCard(
                "Open Tickets",
                controller.openTicketsCount,
                false,
                Icons.warning_amber,
              ),
            ),
          ),
        ],
      ),
    ],
  );
}





  /// 📊 DASHBOARD SECTION
  // Widget _buildDashboardSection(BuildContext context) {
  //   return Column(
  //     crossAxisAlignment: CrossAxisAlignment.start,
  //     children: [
  //       Text(
  //         "Dashboard",
  //         style: GoogleFonts.poppins(
  //           fontSize: 18,
  //           fontWeight: FontWeight.bold,
  //           color: Colors.black,
  //         ),
  //       ),
  //       const SizedBox(height: 15),
        
  //       /// ---- All Cards Centered ----
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 125,
  //             child: _dashCard("Active Service", controller.activeServiceCount, true, Icons.design_services),
  //           ),
  //           const SizedBox(width: 12),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 125,
  //             child: _dashCard("Pending Requests", controller.pendingRequestsCount, false, Icons.pending_actions),
  //           ),
  //         ],
  //       ),
  //       const SizedBox(height: 12),
  //       Row(
  //         mainAxisAlignment: MainAxisAlignment.center,
  //         children: [
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 125,
  //             child: _dashCard("Open Tickets", controller.openTicketsCount, false, Icons.warning_amber),
  //           ),
  //           const SizedBox(width: 12),
  //           SizedBox(
  //             width: MediaQuery.of(context).size.width * 0.44,
  //             height: 125,
  //             child: Container(), // Empty container to maintain symmetry
  //           ),
  //         ],
  //       ),




  //     ],
  //   );
  // }

  /// ⚡ QUICK ACTIONS
  Widget _buildQuickActions() {
    final actions = [
      {"title": "Lead Form", "icon": Icons.description},
      {"title": "Quotation details", "icon": Icons.receipt_long},
      {"title": "View Services", "icon": Icons.list_alt},
      {"title": "Emergency Call", "icon": Icons.warning_amber},
      {"title": "Request Service", "icon": Icons.handshake},
      {"title": "Contact Support", "icon": Icons.support_agent},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Overview",
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 15),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: actions.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 14,
            crossAxisSpacing: 14,
            childAspectRatio: 1.7,
          ),
          itemBuilder: (_, i) {
            return InkWell(
              borderRadius: BorderRadius.circular(14),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  image: const DecorationImage(
                    image: AssetImage("assets/background1.png"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 6,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(actions[i]["icon"] as IconData,
                        size: 36, color: Colors.white),
                    const SizedBox(height: 8),
                    Text(
                      actions[i]["title"] as String,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }


  /// 🔻 BOTTOM NAV
  Widget _buildBottomNavigationBar() {
    return Obx(
      () => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onBottomNavTap,
        selectedItemColor: const Color(0xff7A001F),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.miscellaneous_services), label: "Service"),
          BottomNavigationBarItem(
              icon: Icon(Icons.support_agent), label: "Support"),
          BottomNavigationBarItem(
              icon: Icon(Icons.notifications), label: "Alerts"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}

/// ✂️ CURVED HEADER CLIPPER
class CurvedHeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, size.height - 40);
    path.quadraticBezierTo(
        size.width / 2, size.height + 10, size.width, size.height - 40);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
