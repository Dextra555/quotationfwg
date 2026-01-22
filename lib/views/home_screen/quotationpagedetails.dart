// // ==============================
// // quotation_details_page.dart
// // Dark Red UI + same style like your screenshot
// // ==============================
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// class QuotationDetailsPage extends StatelessWidget {
//   final Map<String, dynamic> quotation;
//   const QuotationDetailsPage({super.key, required this.quotation});

//   static const Color darkRed = Color(0xFF8B0000);
//   static const Color bg = Color(0xFFF6FBF9);

//   @override
//   Widget build(BuildContext context) {
//     final int amount = (quotation["amount"] ?? 0) as int;
//     final int securityGirls = (quotation["securityGirls"] ?? 0) as int;
//     final int guns = (quotation["guns"] ?? 0) as int;
//     final int uniformAmount = (quotation["uniformAmount"] ?? 0) as int;

//     final int gunAmount = guns * 2500; // ✅ sample calculation
//     final int securityAmount = securityGirls * 9000; // ✅ sample calculation
//     final int total = amount + uniformAmount + gunAmount + securityAmount;

//     return Scaffold(
//       backgroundColor: bg,
//       appBar: AppBar(
//         backgroundColor: darkRed,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black87),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Quotation Details",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//         // actions: [
//         //   IconButton(
//         //     icon: Icon(Icons.favorite_border, color: Colors.grey.shade700),
//         //     onPressed: () {},
//         //   ),
//         //   IconButton(
//         //     icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey.shade700),
//         //     onPressed: () {},
//         //   ),
//         //   const SizedBox(width: 6),
//         // ],
//       ),

//       body: SingleChildScrollView(
//         padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ✅ Big top image like screenshot
//             // Container(
//             //   height: 140,
//             //   width: 160,
//             //   decoration: BoxDecoration(
//             //     color: Colors.grey.shade100,
//             //     borderRadius: BorderRadius.circular(18),
//             //   ),
//             //   child: ClipRRect(
//             //     borderRadius: BorderRadius.circular(18),
//             //     child: Image.asset(
//             //       quotation["logo"] ?? "assets/logo.png",
//             //       fit: BoxFit.cover,
//             //       errorBuilder: (_, __, ___) => Icon(
//             //         Icons.business,
//             //         size: 60,
//             //         color: Colors.grey.shade400,
//             //       ),
//             //     ),
//             //   ),
//             // ),

//             const SizedBox(height: 10),

//             // Dots like carousel
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: List.generate(
//                 4,
//                 (i) => Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 3),
//                   height: 6,
//                   width: i == 0 ? 16 : 6,
//                   decoration: BoxDecoration(
//                     color: i == 0 ? darkRed : Colors.grey.shade300,
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                 ),
//               ),
//             ),

//             const SizedBox(height: 14),

//             // ✅ Title + price row
//             Row(
//               children: [
//                 Expanded(
//                   child: Text(
//                     quotation["companyName"] ?? "Company",
//                     style: GoogleFonts.poppins(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   "₹$total",
//                   style: GoogleFonts.poppins(
//                     fontSize: 16,
//                     fontWeight: FontWeight.w700,
//                     color: darkRed,
//                   ),
//                 ),
//               ],
//             ),

//             const SizedBox(height: 4),
//             Text(
//               "Quotation ID: ${quotation["id"] ?? "N/A"}",
//               style: GoogleFonts.poppins(
//                 fontSize: 11.5,
//                 color: Colors.grey.shade700,
//               ),
//             ),

//             const SizedBox(height: 14),

//             // ✅ Customer / company details card (like your LeadDetails style)
//             _whiteCard(
//               title: "Company Info",
//               child: Column(
//                 children: [
//                   _infoRow("Company Name", quotation["companyName"] ?? "N/A"),
//                   _infoRow("Email", quotation["email"] ?? "N/A"),
//                   _infoRow("Phone", quotation["phone"] ?? "N/A"),
//                   _infoRow("Send Date", quotation["date"] ?? "N/A"),
//                   _infoRow("Send Time", quotation["time"] ?? "N/A"),
//                   _infoRow("Status", quotation["status"] ?? "N/A"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ✅ Requirements
//             _whiteCard(
//               title: "Security Requirements",
//               child: Column(
//                 children: [
//                   _infoRow("Security Girls Needed", "$securityGirls"),
//                   _infoRow("Guns Needed", "$guns"),
//                   _infoRow("Uniform Amount", "₹$uniformAmount"),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ✅ Invoice breakup
//             _whiteCard(
//               title: "Invoice Summary",
//               child: Column(
//                 children: [
//                   _billRow("Base Quotation Amount", amount),
//                   _billRow("Uniform Charges", uniformAmount),
//                   _billRow("Gun Charges (₹2500 x $guns)", gunAmount),
//                   _billRow("Security Charges (₹9000 x $securityGirls)", securityAmount),
//                   const Divider(height: 22),
//                   _billRow("Total Payable", total, isTotal: true),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 12),

//             // ✅ Notes
//             _whiteCard(
//               title: "Notes",
//               child: Text(
//                 quotation["notes"] ?? "N/A",
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   color: Colors.grey.shade800,
//                   height: 1.4,
//                 ),
//               ),
//             ),

//             const SizedBox(height: 16),

//             // ✅ bottom buttons like your style
//             Row(
//               children: [
//                 Expanded(
//                   child: _outlineBtn(
//                     text: "View Invoice",
//                     onTap: () {
//                       // open invoice page or pdf
//                     },
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: _fillBtn(
//                     text: "Confirm Quotation",
//                     onTap: () {
//                       // update status / convert to invoice
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- UI HELPERS ----------------

//   Widget _whiteCard({required String title, required Widget child}) {
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
//           Text(
//             title,
//             style: GoogleFonts.poppins(
//               fontSize: 13,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//           const SizedBox(height: 10),
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

//   Widget _billRow(String label, int value, {bool isTotal = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: GoogleFonts.poppins(
//                 fontSize: 11.5,
//                 color: Colors.grey.shade800,
//                 fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
//               ),
//             ),
//           ),
//           Text(
//             "₹$value",
//             style: GoogleFonts.poppins(
//               fontSize: 12,
//               fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
//               color: isTotal ? darkRed : Colors.black87,
//             ),
//           ),
//         ],
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
import 'package:share_plus/share_plus.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class QuotationDetailsPage extends StatelessWidget {
  final Map<String, dynamic> quotation;
  const QuotationDetailsPage({super.key, required this.quotation});

  static const Color darkRed = Color(0xFF8B0000);
  static const Color bg = Color(0xFFF6FBF9);

  @override
  Widget build(BuildContext context) {
    final int amount = (quotation["amount"] ?? 0) as int;
    final int securityGirls = (quotation["securityGirls"] ?? 0) as int;
    final int guns = (quotation["guns"] ?? 0) as int;
    final int uniformAmount = (quotation["uniformAmount"] ?? 0) as int;

    final int gunAmount = guns * 2500;
    final int securityAmount = securityGirls * 9000;
    final int total = amount + uniformAmount + gunAmount + securityAmount;

    final String status = (quotation["status"] ?? "N/A").toString();
    final bool isCompleted = status.toLowerCase() == "completed";

    return Scaffold(
      backgroundColor: bg,

      // ✅ AppBar FIXED (dark red + white back arrow)
      appBar: AppBar(
        backgroundColor: darkRed,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Quotation Details",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Modern top summary card
            Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Container(
                    width: 94,
                    height: 54,
                    decoration: BoxDecoration(
                      color: darkRed.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        quotation["logo"] ?? "assets/logo.png",
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Icon(Icons.business, color: darkRed),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          quotation["companyName"] ?? "Company",
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          "Quotation ID: ${quotation["id"] ?? "N/A"}",
                          style: GoogleFonts.poppins(
                            fontSize: 11,
                            color: Colors.grey.shade700,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            _chip(
                              text: status,
                              bgColor: isCompleted
                                  ? Colors.green.withOpacity(0.12)
                                  : Colors.orange.withOpacity(0.12),
                              textColor: isCompleted ? Colors.green : Colors.orange,
                              icon: isCompleted ? Icons.check_circle : Icons.timelapse,
                            ),
                            const SizedBox(width: 8),
                            _chip(
                              text: "₹$total",
                              bgColor: darkRed.withOpacity(0.10),
                              textColor: darkRed,
                              icon: Icons.currency_rupee,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Company info
            _whiteCard(
              title: "Company Info",
              child: Column(
                children: [
                  _infoRowIcon(Icons.business, "Company", quotation["companyName"] ?? "N/A"),
                  _infoRowIcon(Icons.email_outlined, "Email", quotation["email"] ?? "N/A"),
                  _infoRowIcon(Icons.phone_outlined, "Phone", quotation["phone"] ?? "N/A"),
                  _infoRowIcon(Icons.calendar_month_outlined, "Send Date", quotation["date"] ?? "N/A"),
                  _infoRowIcon(Icons.access_time, "Send Time", quotation["time"] ?? "N/A"),
                  _infoRowIcon(Icons.flag_outlined, "Status", status),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Requirements
            _whiteCard(
              title: "Security Requirements",
              child: Column(
                children: [
                  _infoRowIcon(Icons.person_outline, "Security Girls", "$securityGirls"),
                  _infoRowIcon(Icons.security_outlined, "Guns Needed", "$guns"),
                  _infoRowIcon(Icons.checkroom_outlined, "Uniform Amount", "₹$uniformAmount"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Invoice Summary
            _whiteCard(
              title: "Invoice Summary",
              child: Column(
                children: [
                  _billRow("Base Quotation Amount", amount),
                  _billRow("Uniform Charges", uniformAmount),
                  _billRow("Gun Charges (₹2500 x $guns)", gunAmount),
                  _billRow("Security Charges (₹9000 x $securityGirls)", securityAmount),
                  const Divider(height: 22),
                  _billRow("Total Payable", total, isTotal: true),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Notes
            _whiteCard(
              title: "Notes",
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.notes_outlined, color: darkRed, size: 18),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      quotation["notes"] ?? "N/A",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey.shade800,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ✅ Buttons
            Row(
              children: [
                Expanded(
                  child: _outlineBtn(
                    text: "View Invoice",
                    icon: Icons.receipt_long,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => QuotationInvoicePage(
                            quotation: quotation,
                            total: total,
                            securityAmount: securityAmount,
                            gunAmount: gunAmount,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _fillBtn(
                    text: "Confirm Quotation",
                    icon: Icons.verified,
                    onTap: () {
                      // update status / convert to invoice
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- UI HELPERS ----------------

  Widget _chip({
    required String text,
    required Color bgColor,
    required Color textColor,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          const SizedBox(width: 6),
          Text(
            text,
            style: GoogleFonts.poppins(
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _whiteCard({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13.5,
              fontWeight: FontWeight.w700,
              color: darkRed, // ✅ title dark red
            ),
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _infoRowIcon(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Icon(icon, size: 18, color: darkRed),
          const SizedBox(width: 10),
          Expanded(
            flex: 4,
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11.5,
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
                fontSize: 11.8,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _billRow(String label, int value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11.5,
                color: Colors.grey.shade800,
                fontWeight: isTotal ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ),
          Text(
            "₹$value",
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: isTotal ? FontWeight.w700 : FontWeight.w600,
              color: isTotal ? darkRed : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget _outlineBtn({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: darkRed),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: darkRed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fillBtn({
    required String text,
    required IconData icon,
    required VoidCallback onTap,
  }) {
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
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 18, color: Colors.white),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class QuotationInvoicePage extends StatelessWidget {
//   final Map<String, dynamic> quotation;


//   final int total; // You can map this to MONTHLY GRAND TOTAL
//   final int securityAmount;
//   final int gunAmount;

//   const QuotationInvoicePage({
//     super.key,
//     required this.quotation,
//     required this.total,
//     required this.securityAmount,
//     required this.gunAmount,
//   });

//   static const Color darkRed = Color(0xFF8B0000);
//   static const Color bg = Color(0xFFF6FBF9);

//   String _rm(num v) => "RM ${v.toStringAsFixed(2)}";

//   Future<void> _generateAndSharePDF() async {
//     // Extract data from quotation
//     final int personnel = (quotation["personnel"] ?? 1) as int;
//     final int hoursRequired = (quotation["hoursRequired"] ?? 1) as int;
    
//     final double basicSalary = (quotation["basicSalary"] ?? 10200).toDouble();
//     final double otAmount = (quotation["otAmount"] ?? 5100).toDouble();
//     final double totalSalary = (quotation["totalSalary"] ?? (basicSalary + otAmount)).toDouble();
    
//     final double epfEmployer = (quotation["epfEmployer"] ?? 1224).toDouble();
//     final double socsoEmployer = (quotation["socsoEmployer"] ?? 29.25).toDouble();
//     final double sipAmount = (quotation["sipAmount"] ?? 1.50).toDouble();
//     final double hrdfAmount = (quotation["hrdfAmount"] ?? 10.20).toDouble();
    
//     final double performanceBonus = (quotation["performanceBonus"] ?? 1000).toDouble();
//     final double trainingCost = (quotation["trainingCost"] ?? 500).toDouble();
//     final double refreshmentCost = (quotation["refreshmentCost"] ?? 300).toDouble();
//     final double insuranceCost = (quotation["insuranceCost"] ?? 200).toDouble();
//     final double annualLeaveCost = (quotation["annualLeaveCost"] ?? 400).toDouble();
//     final double medicalLeaveCost = (quotation["medicalLeaveCost"] ?? 200).toDouble();
//     final double publicHolidayCost = (quotation["publicHolidayCost"] ?? 600).toDouble();
//     final double uniformCharges = (quotation["uniformCharges"] ?? 150).toDouble();
    
//     final double licensingCost = (quotation["licensingCost"] ?? 1000).toDouble();
//     final double operationCost = (quotation["operationCost"] ?? 500).toDouble();
    
//     final double monthlyGrandTotal = (quotation["monthlyGrandTotal"] ?? 20000).toDouble();
//     final double hourlyCost = (quotation["hourlyCost"] ?? 100).toDouble();
    
//     final pdf = pw.Document();
    
//     // Add company logo and header
//     final logoImage = pw.MemoryImage(
//       (await rootBundle.load('assets/logo.png')).buffer.asUint8List(),
//     );
    
//     pdf.addPage(
//       pw.Page(
//         pageFormat: PdfPageFormat.a4,
//         margin: const pw.EdgeInsets.all(32),
//         build: (pw.Context context) {
//           return pw.Column(
//             crossAxisAlignment: pw.CrossAxisAlignment.start,
//             children: [
//               // Company header
//               pw.Row(
//                 mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
//                 children: [
//                   pw.Container(
//                     width: 60,
//                     height: 60,
//                     child: pw.Image(logoImage),
//                   ),
//                   pw.Column(
//                     crossAxisAlignment: pw.CrossAxisAlignment.start,
//                     children: [
//                       pw.Text(
//                         "FWG Security Services India Pvt. Ltd.",
//                         style: pw.TextStyle(
//                           fontSize: 16,
//                           fontWeight: pw.FontWeight.bold,
//                           color: PdfColors.black,
//                         ),
//                       ),
//                       pw.Text(
//                         "Precision plaza, 1st Floor, No.397(Old No 281),\n"
//                         "Anna Salai, Teynampet, Chennai-600018,\n"
//                         "Tamilnadu, India.",
//                         style: pw.TextStyle(
//                           fontSize: 10,
//                           color: PdfColors.grey700,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 20),
              
//               // Title
//               pw.Center(
//                 child: pw.Text(
//                   "SECURITY SERVICES COST QUOTATION",
//                   style: pw.TextStyle(
//                     fontSize: 14,
//                     fontWeight: pw.FontWeight.bold,
//                     color: PdfColors.red,
//                   ),
//                 ),
//               ),
//               pw.SizedBox(height: 20),
              
//               // Personnel info
//               pw.Row(
//                 children: [
//                   pw.Expanded(
//                     child: pw.Text(
//                       "Personnel: $personnel",
//                       style: const pw.TextStyle(fontSize: 12),
//                     ),
//                   ),
//                   pw.Text(
//                     "Hours Required: $hoursRequired",
//                     style: const pw.TextStyle(fontSize: 12),
//                   ),
//                 ],
//               ),
//               pw.SizedBox(height: 20),
              
//               // Personnel Costs
//               _buildPDFSection("PERSONNEL COSTS", [
//                 _buildPDFRow("Basic Salary", _rm(basicSalary)),
//                 _buildPDFRow("OT Amount", _rm(otAmount)),
//                 _buildPDFRow("Total Salary", _rm(totalSalary), isBold: true),
//               ]),
              
//               pw.SizedBox(height: 15),
              
//               // Statutory Contributions
//               _buildPDFSection("STATUTORY CONTRIBUTIONS", [
//                 _buildPDFRow("EPF Employer", _rm(epfEmployer)),
//                 _buildPDFRow("SOCSO Employer", _rm(socsoEmployer)),
//                 _buildPDFRow("SIP Amount", _rm(sipAmount)),
//                 _buildPDFRow("HRDF Amount", _rm(hrdfAmount)),
//               ]),
              
//               pw.SizedBox(height: 15),
              
//               // Allowances & Benefits
//               _buildPDFSection("ALLOWANCES & BENEFITS", [
//                 _buildPDFRow("Performance Bonus", _rm(performanceBonus)),
//                 _buildPDFRow("Training Cost", _rm(trainingCost)),
//                 _buildPDFRow("Refreshment Cost", _rm(refreshmentCost)),
//                 _buildPDFRow("Insurance Cost", _rm(insuranceCost)),
//                 _buildPDFRow("Annual Leave Cost", _rm(annualLeaveCost)),
//                 _buildPDFRow("Medical Leave Cost", _rm(medicalLeaveCost)),
//                 _buildPDFRow("Public Holiday Cost", _rm(publicHolidayCost)),
//                 _buildPDFRow("Uniform Charges", _rm(uniformCharges)),
//               ]),
              
//               pw.SizedBox(height: 15),
              
//               // Management Costs
//               _buildPDFSection("MANAGEMENT COSTS", [
//                 _buildPDFRow("Licensing Cost", _rm(licensingCost)),
//                 _buildPDFRow("Operation Cost", _rm(operationCost)),
//               ]),
              
//               pw.SizedBox(height: 20),
              
//               // Totals
//               pw.Container(
//                 padding: const pw.EdgeInsets.all(16),
//                 decoration: pw.BoxDecoration(
//                   border: pw.Border.all(color: PdfColors.red),
//                   borderRadius: pw.BorderRadius.circular(8),
//                 ),
//                 child: pw.Column(
//                   children: [
//                     _buildPDFRow("MONTHLY GRAND TOTAL", _rm(monthlyGrandTotal), isBold: true),
//                     pw.SizedBox(height: 8),
//                     _buildPDFRow("HOURLY COST", _rm(hourlyCost), isBold: true),
//                   ],
//                 ),
//               ),
              
//               pw.SizedBox(height: 20),
              
//               // Footer
//               pw.Center(
//                 child: pw.Text(
//                   "This is a system generated quotation",
//                   style: pw.TextStyle(
//                     fontSize: 10,
//                     fontStyle: pw.FontStyle.italic,
//                     color: PdfColors.grey600,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );

//     // Save PDF and share
//     final bytes = await pdf.save();
//     final directory = await getApplicationDocumentsDirectory();
//     final file = File('${directory.path}/quotation_${DateTime.now().millisecondsSinceEpoch}.pdf');
//     await file.writeAsBytes(bytes);
    
//     await Share.shareXFiles([XFile(file.path)], subject: 'Security Cost Quotation');
//   }

//   pw.Widget _buildPDFSection(String title, List<pw.Widget> children) {
//     return pw.Container(
//       margin: const pw.EdgeInsets.only(bottom: 10),
//       child: pw.Column(
//         crossAxisAlignment: pw.CrossAxisAlignment.start,
//         children: [
//           pw.Container(
//             padding: const pw.EdgeInsets.symmetric(vertical: 8),
//             decoration: pw.BoxDecoration(
//               color: PdfColors.red100,
//               borderRadius: pw.BorderRadius.circular(4),
//             ),
//             child: pw.Text(
//               title,
//               style: pw.TextStyle(
//                 fontSize: 12,
//                 fontWeight: pw.FontWeight.bold,
//                 color: PdfColors.red,
//               ),
//             ),
//           ),
//           pw.SizedBox(height: 8),
//           ...children,
//         ],
//       ),
//     );
//   }

//   pw.Widget _buildPDFRow(String label, String value, {bool isBold = false}) {
//     return pw.Container(
//       margin: const pw.EdgeInsets.only(bottom: 6),
//       child: pw.Row(
//         children: [
//           pw.Expanded(
//             child: pw.Text(
//               label,
//               style: pw.TextStyle(
//                 fontSize: 11,
//                 fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
//                 color: PdfColors.black,
//               ),
//             ),
//           ),
//           pw.Text(
//             value,
//             style: pw.TextStyle(
//               fontSize: 11,
//               fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
//               color: PdfColors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     // PDF top summary
//     final int personnel = (quotation["personnel"] ?? 1) as int;
//     final int hoursRequired = (quotation["hoursRequired"] ?? 1) as int;

//     // --- Personnel Costs (PDF)
//     final double basicSalary = (quotation["basicSalary"] ?? 10200).toDouble();
//     final double otAmount = (quotation["otAmount"] ?? 5100).toDouble();
//     final double totalSalary = (quotation["totalSalary"] ?? (basicSalary + otAmount)).toDouble();

//     // --- Statutory Contributions (PDF)
//     final double epfEmployer = (quotation["epfEmployer"] ?? 1326).toDouble();
//     final double socsoEmployer = (quotation["socsoEmployer"] ?? 299.10).toDouble();
//     final double sipAmount = (quotation["sipAmount"] ?? 34.20).toDouble();
//     final double hrdfAmount = (quotation["hrdfAmount"] ?? 102).toDouble();

//     // --- Allowances & Benefits (PDF)
//     final double performanceBonus = (quotation["performanceBonus"] ?? 2100).toDouble();
//     final double trainingCost = (quotation["trainingCost"] ?? 300).toDouble();
//     final double refreshmentCost = (quotation["refreshmentCost"] ?? 600).toDouble();
//     final double insuranceCost = (quotation["insuranceCost"] ?? 54).toDouble();
//     final double annualLeaveCost = (quotation["annualLeaveCost"] ?? 0).toDouble();
//     final double medicalLeaveCost = (quotation["medicalLeaveCost"] ?? 0).toDouble();
//     final double publicHolidayCost = (quotation["publicHolidayCost"] ?? 1176.84).toDouble();
//     final double uniformCharges = (quotation["uniformCharges"] ?? 330).toDouble();

//     // --- Management Costs (PDF)
//     final double licensingCost = (quotation["licensingCost"] ?? 250).toDouble();
//     final double operationCost = (quotation["operationCost"] ?? 250).toDouble();

//     // Totals (PDF)
//     final double monthlyGrandTotal =
//         (quotation["monthlyGrandTotal"] ?? 25551.07).toDouble(); // display from pdf
//     final double hourlyCost = (quotation["hourlyCost"] ?? 27.30).toDouble();

//     return Scaffold(
//       backgroundColor: bg,
//       appBar: AppBar(
//         backgroundColor: darkRed,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Quotation",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [

//                 Column(
//   crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Container(
//       width: 90,
//       height: 50,
//       decoration: BoxDecoration(
//         color: darkRed.withOpacity(0.08),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ClipRRect(
//         borderRadius: BorderRadius.circular(12),
//         child: Image.asset(
//           quotation["logo"] ?? "assets/logo.png",
//           fit: BoxFit.cover,
//           errorBuilder: (_, __, ___) =>
//               Icon(Icons.business, color: darkRed),
//         ),
//       ),
//     ),

//     const SizedBox(height: 10),

//     Text(
//       "FWG Security Services India Pvt. Ltd.",
//       style: GoogleFonts.poppins(
//         fontSize: 13.5,
//         fontWeight: FontWeight.w700,
//         color: Colors.black87,
//       ),
//     ),

//     // const SizedBox(height: 6),

//     // Text(
//     //   "Precision plaza, 1st Floor, No.397(Old No 281),\n"
//     //   "Anna Salai, Teynampet, Chennai-600018,\n"
//     //   "Tamilnadu, India.",
//     //   style: GoogleFonts.poppins(
//     //     fontSize: 11.2,
//     //     color: Colors.grey.shade700,
//     //     height: 1.35,
//     //   ),
//     // ),
//   ],
// ),

//               // Company header (PDF)
//             //   Row(
//             //     children: [
//             //       Container(
//             //         width: 50,
//             //         height: 50,
//             //         decoration: BoxDecoration(
//             //           color: darkRed.withOpacity(0.08),
//             //           borderRadius: BorderRadius.circular(12),
//             //         ),
//             //         child: ClipRRect(
//             //           borderRadius: BorderRadius.circular(12),
//             //           child: Image.asset(
//             //             quotation["logo"] ?? "assets/logo.png",
//             //             fit: BoxFit.cover,
//             //             errorBuilder: (_, __, ___) =>
//             //                 Icon(Icons.business, color: darkRed),
//             //           ),
//             //         ),
//             //       ),
//             //       const SizedBox(width: 12),
//             //       Expanded(
//             //         child: Text(
//             //           "FWG Security Services India Pvt. Ltd.",
//             //           style: GoogleFonts.poppins(
//             //             fontSize: 13.5,
//             //             fontWeight: FontWeight.w700,
//             //             color: Colors.black87,
//             //           ),
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//               const SizedBox(height: 4),
//               Text(
//                 "Precision plaza, 1st Floor, No.397(Old No 281),\n"
//                 "Anna Salai, Teynampet, Chennai-600018,\n"
//                 "Tamilnadu, India.",
//                 style: GoogleFonts.poppins(
//                   fontSize: 11.2,
//                   color: Colors.grey.shade700,
//                   height: 1.35,
//                 ),
//               ),

//               const SizedBox(height: 14),

//               // Title (PDF)
//               Center(
//                 child: Text(
//                   "Security Services Cost Quotation",
//                   style: GoogleFonts.poppins(
//                     fontSize: 13.2,
//                     fontWeight: FontWeight.w700,
//                     color: darkRed,
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 14),

//               // Personnel + Hours line (PDF)
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   _miniInfo("Personnel", "$personnel"),
//                   _miniInfo("Hours Required", "$hoursRequired"),
//                 ],
//               ),

//               const SizedBox(height: 12),
//               const Divider(height: 20),

//               // Section 1: Personnel Costs
//               _sectionTitle("Personnel Costs"),
//               const SizedBox(height: 8),
//               _moneyRow("BASIC SALARY", basicSalary),
//               _moneyRow("OT AMOUNT", otAmount),
//               _moneyRow("TOTAL SALARY", totalSalary, bold: true),

//               const SizedBox(height: 14),

//               // Section 2: Statutory Contributions
//               _sectionTitle("Statutory Contributions"),
//               const SizedBox(height: 8),
//               _moneyRow("EPF EMPLOYER", epfEmployer),
//               _moneyRow("SOCSO EMPLOYER", socsoEmployer),
//               _moneyRow("SIP AMOUNT", sipAmount),
//               _moneyRow("HRDF AMOUNT", hrdfAmount),

//               const SizedBox(height: 14),

//               // Section 3: Allowances & Benefits
//               _sectionTitle("Allowances & Benefits"),
//               const SizedBox(height: 8),
//               _moneyRow("PERFORMANCE BONUS", performanceBonus),
//               _moneyRow("TRAINING COST", trainingCost),
//               _moneyRow("REFRESHMENT COST", refreshmentCost),
//               _moneyRow("INSURANCE COST", insuranceCost),
//               _moneyRow("ANNUAL LEAVE COST", annualLeaveCost),
//               _moneyRow("MEDICAL LEAVE COST", medicalLeaveCost),
//               _moneyRow("PUBLIC HOLIDAY COST", publicHolidayCost),
//               _moneyRow("UNIFORM CHARGES", uniformCharges),

//               const SizedBox(height: 14),

//               // Section 4: Management Costs
//               _sectionTitle("Management Costs"),
//               const SizedBox(height: 8),
//               _moneyRow("LICENSING COST", licensingCost),
//               _moneyRow("OPERATION COST", operationCost),

//               const SizedBox(height: 14),
//               const Divider(height: 24),

//               // Totals (PDF)
//               _totalRow("MONTHLY GRAND TOTAL", _rm(monthlyGrandTotal)),
//               const SizedBox(height: 6),
//               _totalRow("HOURLY COST", _rm(hourlyCost)),

//               const SizedBox(height: 12),
//               Text(
//                 "This is a system generated quotation",
//                 style: GoogleFonts.poppins(
//                   fontSize: 10.8,
//                   color: Colors.grey.shade700,
//                   fontStyle: FontStyle.italic,
//                 ),
//               ),

//               const SizedBox(height: 18),

//               // Buttons (keep your style)
//               Row(
//                 children: [
//                   Expanded(
//                     child: _btnOutline("Download PDF", Icons.download, () {
//                     }),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _btnFill("Share Quotation", Icons.share, () async {
//                       final text = """
// ╔════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗
// ║                                    INVOICE                                           ║
// ║                                                                                    ║
// ║  FWG Security Services India Pvt. Ltd.                                            ║
// ║  Precision plaza, 1st Floor, No.397(Old No 281)                               ║
// ║  Anna Salai, Teynampet, Chennai-600018, Tamilnadu, India.                      ║
// ║                                                                                    ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║                                                                                    ║
// ║  SECURITY SERVICES COST QUOTATION                                                   ║
// ║                                                                                    ║
// ║  Personnel: $personnel                    Hours Required: $hoursRequired                   ║
// ║                                                                                    ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║                                                                                    ║
// ║  PERSONNEL COSTS                                                                   ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║  Basic Salary:               ${_rm(basicSalary).padLeft(25)}                     ║
// ║  OT Amount:                 ${_rm(otAmount).padLeft(25)}                     ║
// ║  Total Salary:               ${_rm(totalSalary).padLeft(25)}                     ║
// ║                                                                                    ║
// ║  STATUTORY CONTRIBUTIONS                                                            ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║  EPF Employer:               ${_rm(epfEmployer).padLeft(25)}                     ║
// ║  SOCSO Employer:              ${_rm(socsoEmployer).padLeft(25)}                     ║
// ║  SIP Amount:                ${_rm(sipAmount).padLeft(25)}                     ║
// ║  HRDF Amount:                ${_rm(hrdfAmount).padLeft(25)}                     ║
// ║                                                                                    ║
// ║  ALLOWANCES & BENEFITS                                                             ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║  Performance Bonus:          ${_rm(performanceBonus).padLeft(25)}                     ║
// ║  Training Cost:              ${_rm(trainingCost).padLeft(25)}                     ║
// ║  Refreshment Cost:           ${_rm(refreshmentCost).padLeft(25)}                     ║
// ║  Insurance Cost:             ${_rm(insuranceCost).padLeft(25)}                     ║
// ║  Annual Leave Cost:          ${_rm(annualLeaveCost).padLeft(25)}                     ║
// ║  Medical Leave Cost:          ${_rm(medicalLeaveCost).padLeft(25)}                     ║
// ║  Public Holiday Cost:         ${_rm(publicHolidayCost).padLeft(25)}                     ║
// ║  Uniform Charges:            ${_rm(uniformCharges).padLeft(25)}                     ║
// ║                                                                                    ║
// ║  MANAGEMENT COSTS                                                                   ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║  Licensing Cost:             ${_rm(licensingCost).padLeft(25)}                     ║
// ║  Operation Cost:             ${_rm(operationCost).padLeft(25)}                     ║
// ║                                                                                    ║
// ║  ────────────────────────────────────────────────────────────────────────────────────────────── ║
// ║                                                                                    ║
// ║  MONTHLY GRAND TOTAL:        ${_rm(monthlyGrandTotal).padLeft(25)}                     ║
// ║  HOURLY COST:               ${_rm(hourlyCost).padLeft(25)}                     ║
// ║                                                                                    ║
// ║  This is a system generated quotation                                           ║
// ╚════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝
// """;

//                       await Share.share(text, subject: "Security Cost Quotation");
//                     }),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _sectionTitle(String t) {
//     return Text(
//       t,
//       style: GoogleFonts.poppins(
//         fontSize: 12.8,
//         fontWeight: FontWeight.w700,
//         color: darkRed,
//       ),
//     );
//   }

//   Widget _miniInfo(String label, String value) {
//     return Expanded(
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//         margin: const EdgeInsets.only(right: 10),
//         decoration: BoxDecoration(
//           color: bg,
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: Colors.black.withOpacity(0.06)),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(label,
//                 style: GoogleFonts.poppins(
//                   fontSize: 10.8,
//                   color: Colors.grey.shade700,
//                 )),
//             const SizedBox(height: 3),
//             Text(value,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12.2,
//                   fontWeight: FontWeight.w700,
//                   color: Colors.black87,
//                 )),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _moneyRow(String label, double value, {bool bold = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: GoogleFonts.poppins(
//                 fontSize: 11.6,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//           Text(
//             _rm(value),
//             style: GoogleFonts.poppins(
//               fontSize: 11.6,
//               fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _totalRow(String left, String right) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           left,
//           style: GoogleFonts.poppins(
//             fontSize: 12.5,
//             fontWeight: FontWeight.w800,
//             color: Colors.black87,
//           ),
//         ),
//         Text(
//           right,
//           style: GoogleFonts.poppins(
//             fontSize: 13.2,
//             fontWeight: FontWeight.w900,
//             color: darkRed,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _btnOutline(String text, IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: darkRed.withOpacity(0.35)),
//           color: Colors.white,
//         ),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, color: darkRed, size: 18),
//               const SizedBox(width: 8),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: darkRed,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _btnFill(String text, IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: darkRed,
//         ),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, color: Colors.white, size: 18),
//               const SizedBox(width: 8),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



class QuotationInvoicePage extends StatelessWidget {
  final Map<String, dynamic> quotation;

  final int total; // You can map this to MONTHLY GRAND TOTAL
  final int securityAmount;
  final int gunAmount;

  const QuotationInvoicePage({
    super.key,
    required this.quotation,
    required this.total,
    required this.securityAmount,
    required this.gunAmount,
  });

  static const Color darkRed = Color(0xFF8B0000);
  static const Color bg = Color(0xFFF6FBF9);

  String _rm(num v) => "RM ${v.toStringAsFixed(2)}";

  // ---------- PDF HELPERS ----------
  pw.Widget _buildPDFSection(String title, List<pw.Widget> children) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Container(
            width: double.infinity,
            padding: const pw.EdgeInsets.symmetric(vertical: 8, horizontal: 10),
            decoration: pw.BoxDecoration(
              color: PdfColor.fromInt(0xFFFFEBEE), // light red
              borderRadius: pw.BorderRadius.circular(4),
            ),
            child: pw.Text(
              title,
              style: pw.TextStyle(
                fontSize: 12,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.red,
              ),
            ),
          ),
          pw.SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }

  pw.Widget _buildPDFRow(String label, String value, {bool isBold = false}) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 6),
      child: pw.Row(
        children: [
          pw.Expanded(
            child: pw.Text(
              label,
              style: pw.TextStyle(
                fontSize: 11,
                fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
                color: PdfColors.black,
              ),
            ),
          ),
          pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 11,
              fontWeight: isBold ? pw.FontWeight.bold : pw.FontWeight.normal,
              color: PdfColors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Build PDF file and return File
  Future<File> _buildPdfFile() async {
    // Extract data from quotation
    final int personnel = (quotation["personnel"] ?? 1) as int;
    final int hoursRequired = (quotation["hoursRequired"] ?? 1) as int;

    final double basicSalary = (quotation["basicSalary"] ?? 10200).toDouble();
    final double otAmount = (quotation["otAmount"] ?? 5100).toDouble();
    final double totalSalary =
        (quotation["totalSalary"] ?? (basicSalary + otAmount)).toDouble();

    final double epfEmployer = (quotation["epfEmployer"] ?? 1224).toDouble();
    final double socsoEmployer = (quotation["socsoEmployer"] ?? 29.25).toDouble();
    final double sipAmount = (quotation["sipAmount"] ?? 1.50).toDouble();
    final double hrdfAmount = (quotation["hrdfAmount"] ?? 10.20).toDouble();

    final double performanceBonus =
        (quotation["performanceBonus"] ?? 1000).toDouble();
    final double trainingCost = (quotation["trainingCost"] ?? 500).toDouble();
    final double refreshmentCost =
        (quotation["refreshmentCost"] ?? 300).toDouble();
    final double insuranceCost = (quotation["insuranceCost"] ?? 200).toDouble();
    final double annualLeaveCost =
        (quotation["annualLeaveCost"] ?? 400).toDouble();
    final double medicalLeaveCost =
        (quotation["medicalLeaveCost"] ?? 200).toDouble();
    final double publicHolidayCost =
        (quotation["publicHolidayCost"] ?? 600).toDouble();
    final double uniformCharges = (quotation["uniformCharges"] ?? 150).toDouble();

    final double licensingCost = (quotation["licensingCost"] ?? 1000).toDouble();
    final double operationCost = (quotation["operationCost"] ?? 500).toDouble();

    final double monthlyGrandTotal =
        (quotation["monthlyGrandTotal"] ?? 20000).toDouble();
    final double hourlyCost = (quotation["hourlyCost"] ?? 100).toDouble();

    final pdf = pw.Document();

    // Logo load
    Uint8List logoBytes;
    try {
      logoBytes = (await rootBundle.load('assets/logo.png')).buffer.asUint8List();
    } catch (_) {
      logoBytes = Uint8List(0);
    }
    final logoImage = pw.MemoryImage(logoBytes);

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(32),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header
              pw.Row(
                crossAxisAlignment: pw.CrossAxisAlignment.start,
                mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                children: [
                  pw.Container(
                    width: 60,
                    height: 60,
                    child: logoBytes.isNotEmpty
                        ? pw.Image(logoImage, fit: pw.BoxFit.cover)
                        : pw.Container(
                            decoration: pw.BoxDecoration(
                              border: pw.Border.all(color: PdfColors.grey400),
                              borderRadius: pw.BorderRadius.circular(6),
                            ),
                            alignment: pw.Alignment.center,
                            child: pw.Text("LOGO", style: const pw.TextStyle(fontSize: 10)),
                          ),
                  ),
                  pw.SizedBox(width: 12),
                  pw.Expanded(
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          "FWG Security Services India Pvt. Ltd.",
                          style: pw.TextStyle(
                            fontSize: 16,
                            fontWeight: pw.FontWeight.bold,
                            color: PdfColors.black,
                          ),
                        ),
                        pw.SizedBox(height: 4),
                        pw.Text(
                          "Precision plaza, 1st Floor, No.397(Old No 281),\n"
                          "Anna Salai, Teynampet, Chennai-600018,\n"
                          "Tamilnadu, India.",
                          style: pw.TextStyle(
                            fontSize: 10,
                            color: PdfColors.grey700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              pw.SizedBox(height: 18),

              // Title
              pw.Center(
                child: pw.Text(
                  "SECURITY SERVICES COST QUOTATION",
                  style: pw.TextStyle(
                    fontSize: 14,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColors.red,
                  ),
                ),
              ),

              pw.SizedBox(height: 18),

              // Personnel row
              pw.Row(
                children: [
                  pw.Expanded(
                    child: pw.Text(
                      "Personnel: $personnel",
                      style: const pw.TextStyle(fontSize: 12),
                    ),
                  ),
                  pw.Text(
                    "Hours Required: $hoursRequired",
                    style: const pw.TextStyle(fontSize: 12),
                  ),
                ],
              ),

              pw.SizedBox(height: 18),

              _buildPDFSection("PERSONNEL COSTS", [
                _buildPDFRow("Basic Salary", _rm(basicSalary)),
                _buildPDFRow("OT Amount", _rm(otAmount)),
                _buildPDFRow("Total Salary", _rm(totalSalary), isBold: true),
              ]),

              pw.SizedBox(height: 10),

              _buildPDFSection("STATUTORY CONTRIBUTIONS", [
                _buildPDFRow("EPF Employer", _rm(epfEmployer)),
                _buildPDFRow("SOCSO Employer", _rm(socsoEmployer)),
                _buildPDFRow("SIP Amount", _rm(sipAmount)),
                _buildPDFRow("HRDF Amount", _rm(hrdfAmount)),
              ]),

              pw.SizedBox(height: 10),

              _buildPDFSection("ALLOWANCES & BENEFITS", [
                _buildPDFRow("Performance Bonus", _rm(performanceBonus)),
                _buildPDFRow("Training Cost", _rm(trainingCost)),
                _buildPDFRow("Refreshment Cost", _rm(refreshmentCost)),
                _buildPDFRow("Insurance Cost", _rm(insuranceCost)),
                _buildPDFRow("Annual Leave Cost", _rm(annualLeaveCost)),
                _buildPDFRow("Medical Leave Cost", _rm(medicalLeaveCost)),
                _buildPDFRow("Public Holiday Cost", _rm(publicHolidayCost)),
                _buildPDFRow("Uniform Charges", _rm(uniformCharges)),
              ]),

              pw.SizedBox(height: 10),

              _buildPDFSection("MANAGEMENT COSTS", [
                _buildPDFRow("Licensing Cost", _rm(licensingCost)),
                _buildPDFRow("Operation Cost", _rm(operationCost)),
              ]),

              pw.SizedBox(height: 14),

              pw.Container(
                padding: const pw.EdgeInsets.all(14),
                decoration: pw.BoxDecoration(
                  border: pw.Border.all(color: PdfColors.red),
                  borderRadius: pw.BorderRadius.circular(8),
                ),
                child: pw.Column(
                  children: [
                    _buildPDFRow(
                      "MONTHLY GRAND TOTAL",
                      _rm(monthlyGrandTotal),
                      isBold: true,
                    ),
                    pw.SizedBox(height: 6),
                    _buildPDFRow("HOURLY COST", _rm(hourlyCost), isBold: true),
                  ],
                ),
              ),

              pw.SizedBox(height: 18),

              pw.Center(
                child: pw.Text(
                  "This is a system generated quotation",
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontStyle: pw.FontStyle.italic,
                    color: PdfColors.grey600,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );

    final bytes = await pdf.save();

    final directory = await getApplicationDocumentsDirectory();
    final file = File(
      '${directory.path}/quotation_${DateTime.now().millisecondsSinceEpoch}.pdf',
    );
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  // Download only (save) + small snackbar
  Future<void> _downloadPdf(BuildContext context) async {
    final file = await _buildPdfFile();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("PDF saved: ${file.path}")),
    );
  }

  // Share PDF
  Future<void> _sharePdf(BuildContext context) async {
    final file = await _buildPdfFile();
    await Share.shareXFiles(
      [XFile(file.path)],
      subject: 'Security Cost Quotation',
    );
  }

  // ---------- UI HELPERS ----------
  Widget _sectionTitle(String t) {
    return Text(
      t,
      style: GoogleFonts.poppins(
        fontSize: 12.8,
        fontWeight: FontWeight.w700,
        color: darkRed,
      ),
    );
  }

  Widget _miniInfo(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black.withOpacity(0.06)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 10.8,
                color: Colors.grey.shade700,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 12.2,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _moneyRow(String label, double value, {bool bold = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11.6,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            _rm(value),
            style: GoogleFonts.poppins(
              fontSize: 11.6,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _totalRow(String left, String right) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: GoogleFonts.poppins(
            fontSize: 12.5,
            fontWeight: FontWeight.w800,
            color: Colors.black87,
          ),
        ),
        Text(
          right,
          style: GoogleFonts.poppins(
            fontSize: 13.2,
            fontWeight: FontWeight.w900,
            color: darkRed,
          ),
        ),
      ],
    );
  }

  Widget _btnOutline(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: darkRed.withOpacity(0.35)),
          color: Colors.white,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: darkRed, size: 18),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: darkRed,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _btnFill(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: darkRed,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // UI values
    final int personnel = (quotation["personnel"] ?? 1) as int;
    final int hoursRequired = (quotation["hoursRequired"] ?? 1) as int;

    final double basicSalary = (quotation["basicSalary"] ?? 10200).toDouble();
    final double otAmount = (quotation["otAmount"] ?? 5100).toDouble();
    final double totalSalary =
        (quotation["totalSalary"] ?? (basicSalary + otAmount)).toDouble();

    final double epfEmployer = (quotation["epfEmployer"] ?? 1326).toDouble();
    final double socsoEmployer = (quotation["socsoEmployer"] ?? 299.10).toDouble();
    final double sipAmount = (quotation["sipAmount"] ?? 34.20).toDouble();
    final double hrdfAmount = (quotation["hrdfAmount"] ?? 102).toDouble();

    final double performanceBonus =
        (quotation["performanceBonus"] ?? 2100).toDouble();
    final double trainingCost = (quotation["trainingCost"] ?? 300).toDouble();
    final double refreshmentCost =
        (quotation["refreshmentCost"] ?? 600).toDouble();
    final double insuranceCost = (quotation["insuranceCost"] ?? 54).toDouble();
    final double annualLeaveCost =
        (quotation["annualLeaveCost"] ?? 0).toDouble();
    final double medicalLeaveCost =
        (quotation["medicalLeaveCost"] ?? 0).toDouble();
    final double publicHolidayCost =
        (quotation["publicHolidayCost"] ?? 1176.84).toDouble();
    final double uniformCharges = (quotation["uniformCharges"] ?? 330).toDouble();

    final double licensingCost = (quotation["licensingCost"] ?? 250).toDouble();
    final double operationCost = (quotation["operationCost"] ?? 250).toDouble();

    final double monthlyGrandTotal =
        (quotation["monthlyGrandTotal"] ?? 25551.07).toDouble();
    final double hourlyCost = (quotation["hourlyCost"] ?? 27.30).toDouble();

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: darkRed,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Quotation",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 90,
                    height: 50,
                    decoration: BoxDecoration(
                      color: darkRed.withOpacity(0.08),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        quotation["logo"] ?? "assets/logo.png",
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) =>
                            Icon(Icons.business, color: darkRed),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "FWG Security Services India Pvt. Ltd.",
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                "Precision plaza, 1st Floor, No.397(Old No 281),\n"
                "Anna Salai, Teynampet, Chennai-600018,\n"
                "Tamilnadu, India.",
                style: GoogleFonts.poppins(
                  fontSize: 11.2,
                  color: Colors.grey.shade700,
                  height: 1.35,
                ),
              ),
              const SizedBox(height: 14),
              Center(
                child: Text(
                  "Security Services Cost Quotation",
                  style: GoogleFonts.poppins(
                    fontSize: 13.2,
                    fontWeight: FontWeight.w700,
                    color: darkRed,
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _miniInfo("Personnel", "$personnel"),
                  _miniInfo("Hours Required", "$hoursRequired"),
                ],
              ),
              const SizedBox(height: 12),
              const Divider(height: 20),

              _sectionTitle("Personnel Costs"),
              const SizedBox(height: 8),
              _moneyRow("BASIC SALARY", basicSalary),
              _moneyRow("OT AMOUNT", otAmount),
              _moneyRow("TOTAL SALARY", totalSalary, bold: true),

              const SizedBox(height: 14),

              _sectionTitle("Statutory Contributions"),
              const SizedBox(height: 8),
              _moneyRow("EPF EMPLOYER", epfEmployer),
              _moneyRow("SOCSO EMPLOYER", socsoEmployer),
              _moneyRow("SIP AMOUNT", sipAmount),
              _moneyRow("HRDF AMOUNT", hrdfAmount),

              const SizedBox(height: 14),

              _sectionTitle("Allowances & Benefits"),
              const SizedBox(height: 8),
              _moneyRow("PERFORMANCE BONUS", performanceBonus),
              _moneyRow("TRAINING COST", trainingCost),
              _moneyRow("REFRESHMENT COST", refreshmentCost),
              _moneyRow("INSURANCE COST", insuranceCost),
              _moneyRow("ANNUAL LEAVE COST", annualLeaveCost),
              _moneyRow("MEDICAL LEAVE COST", medicalLeaveCost),
              _moneyRow("PUBLIC HOLIDAY COST", publicHolidayCost),
              _moneyRow("UNIFORM CHARGES", uniformCharges),

              const SizedBox(height: 14),

              _sectionTitle("Management Costs"),
              const SizedBox(height: 8),
              _moneyRow("LICENSING COST", licensingCost),
              _moneyRow("OPERATION COST", operationCost),

              const SizedBox(height: 14),
              const Divider(height: 24),

              _totalRow("MONTHLY GRAND TOTAL", _rm(monthlyGrandTotal)),
              const SizedBox(height: 6),
              _totalRow("HOURLY COST", _rm(hourlyCost)),

              const SizedBox(height: 12),
              Text(
                "This is a system generated quotation",
                style: GoogleFonts.poppins(
                  fontSize: 10.8,
                  color: Colors.grey.shade700,
                  fontStyle: FontStyle.italic,
                ),
              ),

              const SizedBox(height: 18),

              // ✅ Buttons: Download PDF + Share PDF
              Row(
                children: [
                  Expanded(
                    child: _btnOutline(
                      "Download PDF",
                      Icons.download,
                      () async => _downloadPdf(context),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _btnFill(
                      "Share Quotation",
                      Icons.share,
                      () async => _sharePdf(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}




// class QuotationInvoicePage extends StatelessWidget {
//   final Map<String, dynamic> quotation;
//   final int total;
//   final int securityAmount;
//   final int gunAmount;

//   const QuotationInvoicePage({
//     super.key,
//     required this.quotation,
//     required this.total,
//     required this.securityAmount,
//     required this.gunAmount,
//   });

//   static const Color darkRed = Color(0xFF8B0000);
//   static const Color bg = Color(0xFFF6FBF9);

//   @override
//   Widget build(BuildContext context) {
//     final int amount = (quotation["amount"] ?? 0) as int;
//     final int uniformAmount = (quotation["uniformAmount"] ?? 0) as int;

//     return Scaffold(
//       backgroundColor: bg,
//       appBar: AppBar(
//         backgroundColor: darkRed,
//         elevation: 0,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           "Invoice",
//           style: GoogleFonts.poppins(
//             color: Colors.white,
//             fontWeight: FontWeight.w600,
//             fontSize: 15,
//           ),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Container(
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.05),
//                 blurRadius: 12,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Header
//               Row(
//                 children: [
//                   Icon(Icons.receipt_long, color: darkRed),
//                   const SizedBox(width: 10),
//                   Text(
//                     "FWG SECURITY SERVICES",
//                     style: GoogleFonts.poppins(
//                       fontSize: 13.5,
//                       fontWeight: FontWeight.w700,
//                       color: darkRed,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 6),
//               Text(
//                 "Invoice for ${quotation["companyName"] ?? "Company"}",
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   color: Colors.grey.shade700,
//                 ),
//               ),
//               const SizedBox(height: 14),

//               _row("Quotation ID", (quotation["id"] ?? "N/A").toString()),
//               _row("Date", (quotation["date"] ?? "N/A").toString()),
//               _row("Time", (quotation["time"] ?? "N/A").toString()),
//               _row("Email", (quotation["email"] ?? "N/A").toString()),
//               _row("Phone", (quotation["phone"] ?? "N/A").toString()),
//               const Divider(height: 22),

//               Text(
//                 "Charges",
//                 style: GoogleFonts.poppins(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w700,
//                   color: darkRed,
//                 ),
//               ),
//               const SizedBox(height: 10),

//               _moneyRow("Base Quotation", amount),
//               _moneyRow("Uniform Charges", uniformAmount),
//               _moneyRow("Security Charges", securityAmount),
//               _moneyRow("Gun Charges", gunAmount),

//               const Divider(height: 26),

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Total Payable",
//                     style: GoogleFonts.poppins(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w700,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   Text(
//                     "₹$total",
//                     style: GoogleFonts.poppins(
//                       fontSize: 14,
//                       fontWeight: FontWeight.w800,
//                       color: darkRed,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 18),

//               // Buttons
//               Row(
//                 children: [
//                   Expanded(
//                     child: _btnOutline("Download PDF", Icons.download, () {
//                       // TODO: if you want PDF generation later, tell me
//                     }),
//                   ),
//                   const SizedBox(width: 12),
//                   Expanded(
//                     child: _btnFill("Share Invoice", Icons.share, () async {
//                       final company = (quotation["companyName"] ?? "Company").toString();
//                       final qid = (quotation["id"] ?? "N/A").toString();
//                       final date = (quotation["date"] ?? "N/A").toString();
//                       final time = (quotation["time"] ?? "N/A").toString();

//                       final text = """
// FWG SECURITY SERVICES - INVOICE

// Company: $company
// Quotation ID: $qid
// Date: $date  Time: $time

// Charges:
// - Base Quotation: ₹$amount
// - Uniform Charges: ₹$uniformAmount
// - Security Charges: ₹$securityAmount
// - Gun Charges: ₹$gunAmount

// Total Payable: ₹$total
// """;

//                       await Share.share(
//                         text,
//                         subject: "Invoice - $company ($qid)",
//                       );
//                     }),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _row(String left, String right) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               left,
//               style: GoogleFonts.poppins(
//                 fontSize: 11.5,
//                 color: Colors.grey.shade700,
//               ),
//             ),
//           ),
//           Flexible(
//             child: Text(
//               right,
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

//   Widget _moneyRow(String label, int value) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         children: [
//           Expanded(
//             child: Text(
//               label,
//               style: GoogleFonts.poppins(
//                 fontSize: 11.8,
//                 color: Colors.black87,
//               ),
//             ),
//           ),
//           Text(
//             "₹$value",
//             style: GoogleFonts.poppins(
//               fontSize: 11.8,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _btnOutline(String text, IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(color: darkRed.withOpacity(0.35)),
//           color: Colors.white,
//         ),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, color: darkRed, size: 18),
//               const SizedBox(width: 8),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: darkRed,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _btnFill(String text, IconData icon, VoidCallback onTap) {
//     return InkWell(
//       onTap: onTap,
//       borderRadius: BorderRadius.circular(12),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 12),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(12),
//           color: darkRed,
//         ),
//         child: Center(
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Icon(icon, color: Colors.white, size: 18),
//               const SizedBox(width: 8),
//               Text(
//                 text,
//                 style: GoogleFonts.poppins(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w600,
//                   color: Colors.white,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
