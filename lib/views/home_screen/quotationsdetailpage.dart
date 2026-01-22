// ==============================
// quotation_details_page.dart
// Dark Red UI + same style like your screenshot
// ==============================
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

    final int gunAmount = guns * 2500; // ✅ sample calculation
    final int securityAmount = securityGirls * 9000; // ✅ sample calculation
    final int total = amount + uniformAmount + gunAmount + securityAmount;

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Quotation Details",
          style: GoogleFonts.poppins(
            color: Colors.black87,
            fontWeight: FontWeight.w600,
            fontSize: 15,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite_border, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart_outlined, color: Colors.grey.shade700),
            onPressed: () {},
          ),
          const SizedBox(width: 6),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ✅ Big top image like screenshot
            Container(
              height: 240,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(18),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18),
                child: Image.asset(
                  quotation["logo"] ?? "assets/logo.png",
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Icon(
                    Icons.business,
                    size: 60,
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Dots like carousel
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (i) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  height: 6,
                  width: i == 0 ? 16 : 6,
                  decoration: BoxDecoration(
                    color: i == 0 ? darkRed : Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Title + price row
            Row(
              children: [
                Expanded(
                  child: Text(
                    quotation["companyName"] ?? "Company",
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Text(
                  "₹$total",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: darkRed,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 4),
            Text(
              "Quotation ID: ${quotation["id"] ?? "N/A"}",
              style: GoogleFonts.poppins(
                fontSize: 11.5,
                color: Colors.grey.shade700,
              ),
            ),

            const SizedBox(height: 14),

            // ✅ Customer / company details card (like your LeadDetails style)
            _whiteCard(
              title: "Company Info",
              child: Column(
                children: [
                  _infoRow("Company Name", quotation["companyName"] ?? "N/A"),
                  _infoRow("Email", quotation["email"] ?? "N/A"),
                  _infoRow("Phone", quotation["phone"] ?? "N/A"),
                  _infoRow("Send Date", quotation["date"] ?? "N/A"),
                  _infoRow("Send Time", quotation["time"] ?? "N/A"),
                  _infoRow("Status", quotation["status"] ?? "N/A"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Requirements
            _whiteCard(
              title: "Security Requirements",
              child: Column(
                children: [
                  _infoRow("Security Girls Needed", "$securityGirls"),
                  _infoRow("Guns Needed", "$guns"),
                  _infoRow("Uniform Amount", "₹$uniformAmount"),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // ✅ Invoice breakup
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
              child: Text(
                quotation["notes"] ?? "N/A",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.grey.shade800,
                  height: 1.4,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ✅ bottom buttons like your style
            Row(
              children: [
                Expanded(
                  child: _outlineBtn(
                    text: "View Invoice",
                    onTap: () {
                      // open invoice page or pdf
                    },
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _fillBtn(
                    text: "Confirm Quotation",
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
            blurRadius: 8,
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
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
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
