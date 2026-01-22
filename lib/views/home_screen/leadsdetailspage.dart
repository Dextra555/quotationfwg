// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:get/get.dart';

// class LeadDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> lead;
//   const LeadDetailsPage({super.key, required this.lead});

//   static const Color darkRed = Color(0xFF8B1E1E);
//   static const Color bg = Color(0xFFF6FBF9);

//   Color _statusColor(String status) {
//     switch (status) {
//       case "Converted":
//         return Colors.green;
//       case "Closed":
//         return Colors.grey;
//       case "In Progress":
//         return Colors.orange;
//       default:
//         return Colors.blue;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final statusColor = _statusColor(lead['status']);

//     return Scaffold(
//       backgroundColor: bg,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // 🔴 TOP APPBAR LIKE SCREENSHOT
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//               decoration: BoxDecoration(
//                 color: darkRed,
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(18),
//                   bottomRight: Radius.circular(18),
//                 ),
//               ),
//               child: Row(
//                 children: [
//                   InkWell(
//                     onTap: () => Get.back(),
//                     child: const Icon(Icons.arrow_back_ios_new,
//                         color: Colors.white, size: 18),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: Text(
//                       "Lead Details",
//                       textAlign: TextAlign.center,
//                       style: GoogleFonts.poppins(
//                         color: Colors.white,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 28), // keep center title
//                 ],
//               ),
//             ),

//             Expanded(
//               child: SingleChildScrollView(
//                 padding: const EdgeInsets.all(14),
//                 child: Column(
//                   children: [
//                     // 🔹 CARD 1: LEAD INFO (LIKE TASK #77777)
//                     _whiteCard(
//                       child: Column(
//                         children: [
//                           Text(
//                             "Lead ID: ${lead['id']}",
//                             style: GoogleFonts.poppins(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 13,
//                             ),
//                           ),
//                           const SizedBox(height: 12),
//                           Container(
//                             padding: const EdgeInsets.all(12),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFFF9F2F2),
//                               borderRadius: BorderRadius.circular(12),
//                               border: Border.all(color: Colors.black12),
//                             ),
//                             child: Row(
//                               children: [
//                                 // LOGO
//                                 ClipRRect(
//                                   borderRadius: BorderRadius.circular(10),
//                                   child: Image.asset(
//                                     lead['logo'],
//                                     height: 44,
//                                     width: 44,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),

//                                 Expanded(
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         lead['name'],
//                                         style: GoogleFonts.poppins(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 13,
//                                         ),
//                                       ),
//                                       const SizedBox(height: 2),
//                                       Text(
//                                         lead['contact'],
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 11,
//                                           color: Colors.grey.shade700,
//                                         ),
//                                       ),
//                                       Text(
//                                         lead['email'],
//                                         style: GoogleFonts.poppins(
//                                           fontSize: 11,
//                                           color: Colors.grey.shade700,
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),

//                                 // STATUS CHIP
//                                 Container(
//                                   padding: const EdgeInsets.symmetric(
//                                       horizontal: 10, vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: statusColor.withOpacity(0.12),
//                                     borderRadius: BorderRadius.circular(20),
//                                   ),
//                                   child: Text(
//                                     lead['status'],
//                                     style: GoogleFonts.poppins(
//                                       fontSize: 11,
//                                       fontWeight: FontWeight.w600,
//                                       color: statusColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 12),

//                     // 🔹 CARD 2: DETAILS (Company, phone, address etc)
//                     _whiteCard(
//                       title: "Company Details",
//                       child: Column(
//                         children: [
//                           _infoRow("Company Name", lead['name']),
//                           _infoRow("Email", lead['email']),
//                           _infoRow("Phone", lead['contact']),
//                           _infoRow("Address", 'N/A'),
//                           _infoRow("Security Needed Count",
//                               '0'),
//                           _infoRow("Uniform Count", '0'),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 12),

//                     // 🔹 CARD 3: TRACKER (LIKE SCREENSHOT)
//                     _whiteCard(
//                       title: "Lead Tracker",
//                       rightIcon: Icons.refresh,
//                       onRightTap: () {
//                         // you can refresh API here
//                       },
//                       child: _trackerTimeline(step: 1),
//                     ),

//                     const SizedBox(height: 14),

//                     // 🔹 BOTTOM BUTTONS LIKE SCREENSHOT
//                     Row(
//                       children: [
//                         Expanded(
//                           child: _outlineBtn(
//                             text: "Contact Support",
//                             onTap: () {
//                               // open support page / whatsapp
//                             },
//                           ),
//                         ),
//                         const SizedBox(width: 12),
//                         Expanded(
//                           child: _fillBtn(
//                             text: "Manage Lead",
//                             onTap: () {
//                               // open manage lead page
//                             },
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 8),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- UI Helpers ----------------

//   Widget _whiteCard({
//     String? title,
//     IconData? rightIcon,
//     VoidCallback? onRightTap,
//     required Widget child,
//   }) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.all(14),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(16),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.05),
//             blurRadius: 8,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (title != null)
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   title,
//                   style: GoogleFonts.poppins(
//                     fontSize: 13,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//                 if (rightIcon != null)
//                   InkWell(
//                     onTap: onRightTap,
//                     child: Icon(rightIcon, size: 18, color: Colors.grey.shade700),
//                   ),
//               ],
//             ),
//           if (title != null) const SizedBox(height: 10),
//           child,
//         ],
//       ),
//     );
//   }

//   Widget _infoRow(String label, String value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             flex: 4,
//             child: Text(
//               label,
//               style: GoogleFonts.poppins(
//                 fontSize: 11,
//                 color: Colors.grey.shade700,
//               ),
//             ),
//           ),
//           Expanded(
//             flex: 6,
//             child: Text(
//               value,
//               textAlign: TextAlign.right,
//               style: GoogleFonts.poppins(
//                 fontSize: 11.5,
//                 fontWeight: FontWeight.w600,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _trackerTimeline({required int step}) {
//     final items = [
//       "Step 1 : Lead created (form submitted)",
//       "Step 2 : Contacted customer",
//       "Step 3 : Site visit scheduled/Done",
//       "Step 4 : Quotation sent",
//       "Step 5 : Converted to client",
//     ];

//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF9F2F2),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.black12),
//       ),
//       child: Column(
//         children: List.generate(items.length, (index) {
//           final i = index + 1;
//           final isDone = i < step;
//           final isCurrent = i == step;

//           Color dotColor;
//           if (isDone) {
//             dotColor = Colors.green;
//           } else if (isCurrent) {
//             dotColor = darkRed;
//           } else {
//             dotColor = Colors.grey.shade400;
//           }

//           return Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // left timeline
//               Column(
//                 children: [
//                   Container(
//                     height: 18,
//                     width: 18,
//                     decoration: BoxDecoration(
//                       color: dotColor,
//                       shape: BoxShape.circle,
//                     ),
//                     child: isDone
//                         ? const Icon(Icons.check, size: 12, color: Colors.white)
//                         : null,
//                   ),
//                   if (index != items.length - 1)
//                     Container(
//                       width: 2,
//                       height: 34,
//                       color: Colors.grey.shade300,
//                     ),
//                 ],
//               ),
//               const SizedBox(width: 12),

//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 1),
//                   child: Text(
//                     items[index],
//                     style: GoogleFonts.poppins(
//                       fontSize: 11.5,
//                       fontWeight:
//                           isCurrent ? FontWeight.w700 : FontWeight.w500,
//                       color: isCurrent ? Colors.black : Colors.grey.shade800,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           );
//         }),
//       ),
//     );
//   }

//   Widget _outlineBtn({required String text, required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: darkRed.withOpacity(0.35)),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: darkRed,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _fillBtn({required String text, required VoidCallback onTap}) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           color: darkRed,
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: GoogleFonts.poppins(
//               fontWeight: FontWeight.w600,
//               fontSize: 12,
//               color: Colors.white,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LeadDetailsPage extends StatelessWidget {
  final Map<String, dynamic> lead;
  const LeadDetailsPage({super.key, required this.lead});

  static const Color darkRed = Color(0xFF8B1E1E);
  static const Color bg = Color(0xFFF6FBF9);

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "converted":
        return Colors.green;
      case "closed":
        return Colors.grey;
      case "in progress":
        return Colors.orange;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    final statusColor = _statusColor((lead['status'] ?? '').toString());

    return Scaffold(
      backgroundColor: bg,

      // ✅ REAL APPBAR (NO WHITE GAP)
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(62),
        child: AppBar(
          backgroundColor: darkRed,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            "Lead Details",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),

          // ✅ Rounded bottom like your header style
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
        ),
      ),

      // ✅ BODY STARTS DIRECTLY (NO EXTRA SAFEAREA TOP CONTAINER)
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            // 🔹 CARD 1
            _whiteCard(
              child: Column(
                children: [
                  Text(
                    "Lead ID: ${lead['id'] ?? 'N/A'}",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF9F2F2),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            lead['logo'] ?? "assets/logo.png",
                            height: 44,
                            width: 44,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                lead['name'] ?? "N/A",
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                lead['contact'] ?? "N/A",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                              Text(
                                lead['email'] ?? "N/A",
                                style: GoogleFonts.poppins(
                                  fontSize: 11,
                                  color: Colors.grey.shade700,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            color: statusColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            (lead['status'] ?? 'N/A').toString(),
                            style: GoogleFonts.poppins(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 CARD 2
            _whiteCard(
              title: "Company Details",
              child: Column(
                children: [
                  _infoRow("Company Name", lead['name'] ?? 'N/A'),
                  _infoRow("Email", lead['email'] ?? 'N/A'),
                  _infoRow("Phone", lead['contact'] ?? 'N/A'),
                  _infoRow("Address", lead['address'] ?? 'N/A'),
                  _infoRow("Security Needed Count",
                      (lead['securityCount'] ?? 0).toString()),
                  _infoRow("Uniform Count", (lead['uniformCount'] ?? 0).toString()),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // 🔹 CARD 3
            _whiteCard(
              title: "Lead Tracker",
              rightIcon: Icons.refresh,
              onRightTap: () {},
              child: _trackerTimeline(step: lead['step'] ?? 1),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _outlineBtn(
                    text: "Contact Support",
                    onTap: () {},
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _fillBtn(
                    text: "Manage Lead",
                    onTap: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- UI Helpers ----------------

  Widget _whiteCard({
    String? title,
    IconData? rightIcon,
    VoidCallback? onRightTap,
    required Widget child,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title != null)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (rightIcon != null)
                  InkWell(
                    onTap: onRightTap,
                    child: Icon(rightIcon, size: 18, color: Colors.grey.shade700),
                  ),
              ],
            ),
          if (title != null) const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: GoogleFonts.poppins(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _trackerTimeline({required int step}) {
    final items = [
      "Step 1 : Lead created (form submitted)",
      "Step 2 : Contacted customer",
      "Step 3 : Site visit scheduled/Done",
      "Step 4 : Quotation sent",
      "Step 5 : Converted to client",
    ];

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9F2F2),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.black12),
      ),
      child: Column(
        children: List.generate(items.length, (index) {
          final i = index + 1;
          final isDone = i < step;
          final isCurrent = i == step;

          Color dotColor = isDone
              ? Colors.green
              : isCurrent
                  ? darkRed
                  : Colors.grey.shade400;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Container(
                    height: 18,
                    width: 18,
                    decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
                    child: isDone
                        ? const Icon(Icons.check, size: 12, color: Colors.white)
                        : null,
                  ),
                  if (index != items.length - 1)
                    Container(width: 2, height: 34, color: Colors.grey.shade300),
                ],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    items[index],
                    style: GoogleFonts.poppins(
                      fontSize: 11.5,
                      fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                      color: isCurrent ? Colors.black : Colors.grey.shade800,
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  Widget _outlineBtn({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: darkRed.withOpacity(0.35)),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: darkRed,
            ),
          ),
        ),
      ),
    );
  }

  Widget _fillBtn({required String text, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: darkRed,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
