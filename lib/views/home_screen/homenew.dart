import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:get/get.dart';

import '../../models/login_response_model.dart';

import 'form.dart';

import 'quotataion.dart';

import 'leads_page.dart';

import 'appbottombar.dart';

import 'quoatationspage.dart';

import 'reportspage.dart';

import 'drawer.dart';



class SalesDashboardUI extends StatelessWidget {

  const SalesDashboardUI({super.key});

  

  static final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();



  static const Color darkRed = Color(0xFF8B1E1E);

  static const Color primaryRed = Color(0xFF8B0000);

  static const Color darkGreen = Color(0xFF2F6B5A);

  static const Color cardBg = Colors.white;



  @override

  Widget build(BuildContext context) {

    // Get user data from login arguments

    final User? user = Get.arguments as User?;

    final String displayName = user != null 

        ? '${user.first_name} ${user.last_name}' 

        : 'User';

    

    return Scaffold(

      key: _scaffoldKey,

      drawer: const DarkRedDrawer(),

      backgroundColor: const Color(0xFFF6FBF9),

      body: SafeArea(

        child: ListView(

          padding: const EdgeInsets.all(16),

          children: [



            /// 🔹 TOP BAR

            Row(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Row(

                  children: [

                    Container(

                      height: 70,

                      width: 70,

                      padding: const EdgeInsets.all(4),

                      decoration: BoxDecoration(

                        color: Colors.white,

                        borderRadius: BorderRadius.circular(8),

                      ),

                      child: Image.asset(

                        "assets/logo.png",

                        fit: BoxFit.contain,

                      ),

                    ),

                    const SizedBox(width: 10),

                    Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Row(

                          children: [

                            Text(

                              "Hi, $displayName",

                              style: GoogleFonts.poppins(

                                fontSize: 15,

                                fontWeight: FontWeight.w600,

                              ),

                            ),

                            const SizedBox(width: 6),

                            Icon(

                              Icons.waving_hand_rounded,

                              size: 18,

                              color: darkRed,

                            ),

                          ],

                        ),

                        Text(

                          "Sales Executive",

                          style: GoogleFonts.poppins(

                            fontSize: 12,

                            color: Colors.grey.shade600,

                          ),

                        ),

                      ],

                    ),

                  ],

                ),

                const Spacer(),

                GestureDetector(

                  onTap: () => _scaffoldKey.currentState?.openDrawer(),

                  child: Container(

                    padding: const EdgeInsets.all(10),

                    decoration: BoxDecoration(

                      color: darkRed,

                      shape: BoxShape.circle,

                    ),

                    child: const Icon(Icons.apps_rounded, color: Colors.white),

                  ),

                ),

              ],

            ),



            const SizedBox(height: 24),



            /// 🔹 TITLE

            Text(

              "Sales Overview",

              style: GoogleFonts.poppins(

                fontSize: 18,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 16),



            /// 🔴 BANNER

            Container(

              height: 180,

              padding: const EdgeInsets.all(16),

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(18),

                image: const DecorationImage(

                  image: AssetImage("assets/bcb.jpg"),

                  fit: BoxFit.cover,

                ),

              ),

              child: Row(

                children: [

                  Expanded(

                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.center,

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(

                          "FWG SECURITY SERVICES",

                          style: GoogleFonts.poppins(

                            color: Colors.white,

                            fontSize: 15,

                            fontWeight: FontWeight.w700,

                          ),

                        ),

                        const SizedBox(height: 12),

                        GestureDetector(

                          onTap: () {

                            Navigator.push(

                              context,

                              MaterialPageRoute(

                                builder: (_) => const JobApplicationForm(),

                              ),

                            );

                          },

                          child: Container(

                            padding: const EdgeInsets.symmetric(

                              horizontal: 16,

                              vertical: 8,

                            ),

                            decoration: BoxDecoration(

                              color: Colors.white,

                              borderRadius: BorderRadius.circular(20),

                            ),

                            child: Text(

                              "New Lead",

                              style: GoogleFonts.poppins(

                                color: darkRed,

                                fontWeight: FontWeight.w600,

                                fontSize: 13,

                              ),

                            ),

                          ),

                        ),

                      ],

                    ),

                  ),

                ],

              ),

            ),



            const SizedBox(height: 20),



            /// 🔹 STAT CARDS

            Row(

              children: [

                _statCard("Today's Lead", "3", Icons.person),

                _statCard("New Leads", "12", Icons.group),

                _statCard("Closed Leads", "4", Icons.check_circle),

              ],

            ),



            const SizedBox(height: 24),



            /// 🔹 LEADS INSIGHTS TITLE

            Row(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                Text(

                  "Leads Insights",

                  style: GoogleFonts.poppins(

                    fontSize: 18,

                    fontWeight: FontWeight.bold,

                    color: Colors.black87,

                  ),

                ),

                Text(

                  "This Week",

                  style: GoogleFonts.poppins(

                    fontSize: 14,

                    fontWeight: FontWeight.w500,

                    color: Colors.grey.shade600,

                  ),

                ),

              ],

            ),



            const SizedBox(height: 16),



            /// 🔹 SUMMARY CARDS

            Row(

              children: [

                _summaryCard(

                  icon: Icons.person_outline,

                  title: "Total Leads",

                  value: "200",

                  percent: "+4.00%",

                  isPositive: true,

                  onTap: () => Get.to(() => LeadsPage()),

                ),

                const SizedBox(width: 12),

                _summaryCard(

                  icon: Icons.remove_red_eye_outlined,

                  title: "Quotation Views",

                  value: "189",

                  percent: "+3.00%",

                  isPositive: false,

                  onTap: () => Get.to(() => QuotationsPage()),

                ),

              ],

            ),



            const SizedBox(height: 12),



            Row(

              children: [

                _summaryCard(

                  icon: Icons.inventory_2_outlined,

                  title: "New Leads",

                  value: "3",

                  percent: "+1.32%",

                  isPositive: false,

                  onTap: () => Get.to(() => JobApplicationForm()),

                ),

                const SizedBox(width: 12),

                _summaryCard(

                  icon: Icons.receipt,

                  title: "Reports",

                  value: "4",

                  percent: "+2.01%",

                  isPositive: true,

                  onTap: () => Navigator.push(

                    context,

                    MaterialPageRoute(

                      builder: (_) => const QuotationReportsPage(),

                    ),

                  ),

                ),

              ],

            ),



            const SizedBox(height: 90), // ✅ space for bottom bar

          ],

        ),

      ),

      bottomNavigationBar: AppBottomBar(

        selectedIndex: 1, // change per page

        onTap: (index) {

          print("Bottom bar tapped: index = $index");

          if (index == 0) {

            Navigator.push(context, MaterialPageRoute(builder: (_) => const SalesDashboardUI()));

          } else if (index == 1) {

            Navigator.push(context, MaterialPageRoute(builder: (_) => const SecurityInvoicePage()));

          } else if (index == 2) {

            Navigator.push(context, MaterialPageRoute(builder: (_) => QuotationsPage()));

          } else if (index == 3) {

            print("Navigating to QuotationReportsPage");

            Navigator.push(

              context,

              MaterialPageRoute(builder: (_) => const QuotationReportsPage()),

            ).catchError((error) {

              print("Navigation error: $error");

            });

          }

        },

      ),

    );

  }





//   Widget _summaryCard({

//   required IconData icon,

//   required String title,

//   required String value,

//   required String percent,

//   required bool isPositive,

// }) {

//   return Expanded(

//     child: Container(

//       padding: const EdgeInsets.all(14),

//       decoration: BoxDecoration(

//         color: Colors.white,

//         borderRadius: BorderRadius.circular(16),

//         boxShadow: [

//           BoxShadow(

//             color: Colors.black.withOpacity(0.04),

//             blurRadius: 6,

//             offset: const Offset(0, 3),

//           ),

//         ],

//       ),

//       child: Column(

//         crossAxisAlignment: CrossAxisAlignment.start,

//         children: [

//           /// ICON + PERCENT

//           Row(

//             mainAxisAlignment: MainAxisAlignment.spaceBetween,

//             children: [

//               Icon(icon, size: 20, color: darkRed),

//               Container(

//                 padding:

//                     const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

//                 decoration: BoxDecoration(

//                   color: isPositive

//                       ? Colors.green.withOpacity(0.1)

//                       : Colors.red.withOpacity(0.1),

//                   borderRadius: BorderRadius.circular(12),

//                 ),

//                 child: Text(

//                   percent,

//                   style: GoogleFonts.poppins(

//                     fontSize: 10,

//                     fontWeight: FontWeight.w600,

//                     color: isPositive ? Colors.green : Colors.red,

//                   ),

//                 ),

//               ),

//             ],

//           ),



//           const SizedBox(height: 12),



//           /// TITLE

//           Text(

//             title,

//             style: GoogleFonts.poppins(

//               fontSize: 12,

//               color: Colors.grey.shade600,

//             ),

//           ),



//           const SizedBox(height: 4),



//           /// VALUE

//           Text(

//             value,

//             style: GoogleFonts.poppins(

//               fontSize: 16,

//               fontWeight: FontWeight.bold,

//             ),

//           ),

//         ],

//       ),

//     ),

//   );

// }





Widget _summaryCard({

  required IconData icon,

  required String title,

  required String value,

  required String percent,

  required bool isPositive,

  required VoidCallback onTap,

}) {

  return Expanded(

    child: Material(

      color: Colors.transparent,

      child: InkWell(

        borderRadius: BorderRadius.circular(16), // same radius

        onTap: onTap,

        child: Container(

          padding: const EdgeInsets.all(14),

          decoration: BoxDecoration(

            color: Colors.white,

            borderRadius: BorderRadius.circular(16),

            boxShadow: [

              BoxShadow(

                color: Colors.black.withOpacity(0.04),

                blurRadius: 6,

                offset: const Offset(0, 3),

              ),

            ],

          ),

          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              /// ICON + PERCENT

              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [

                  Icon(icon, size: 20, color: darkRed),

                  Container(

                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),

                    decoration: BoxDecoration(

                      color: isPositive

                          ? Colors.green.withOpacity(0.1)

                          : Colors.red.withOpacity(0.1),

                      borderRadius: BorderRadius.circular(12),

                    ),

                    child: Text(

                      percent,

                      style: GoogleFonts.poppins(

                        fontSize: 10,

                        fontWeight: FontWeight.w600,

                        color: isPositive ? Colors.green : Colors.red,

                      ),

                    ),

                  ),

                ],

              ),



              const SizedBox(height: 12),



              /// TITLE

              Text(

                title,

                style: GoogleFonts.poppins(

                  fontSize: 12,

                  color: Colors.grey.shade600,

                ),

              ),



              const SizedBox(height: 4),



              /// VALUE

              Text(

                value,

                style: GoogleFonts.poppins(

                  fontSize: 16,

                  fontWeight: FontWeight.bold,

                ),

              ),

            ],

          ),

        ),

      ),

    ),

  );

}





  /// 🔹 STAT CARD WIDGET (MATCH IMAGE)

  Widget _statCard(String title, String value, IconData icon) {

    return Expanded(

      child: Container(

        margin: const EdgeInsets.only(right: 8),

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(

          color: cardBg,

          borderRadius: BorderRadius.circular(16),

        ),

        child: Column(

          children: [

            CircleAvatar(

              backgroundColor: darkRed,

              radius: 18,

              child: Icon(icon, color: Colors.white, size: 18),

            ),

            const SizedBox(height: 8),

            Text(

              title,

              style: GoogleFonts.poppins(fontSize: 12),

              textAlign: TextAlign.center,

            ),

            const SizedBox(height: 4),

            Text(

              value,

              style: GoogleFonts.poppins(

                fontWeight: FontWeight.bold,

                fontSize: 15,

              ),

            ),

          ],

        ),

      ),

    );

  }



  /// 🔹 BAR

  Widget _bar(double height, Color color) {

    return Container(

      width: 18,

      height: height,

      decoration: BoxDecoration(

        color: color,

        borderRadius: BorderRadius.circular(8),

      ),

    );

  }

}

