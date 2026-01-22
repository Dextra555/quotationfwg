import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quotationpagedetails.dart';

class QuotationsPage extends StatefulWidget {
  const QuotationsPage({super.key});

  @override
  State<QuotationsPage> createState() => _QuotationsPageState();
}

class _QuotationsPageState extends State<QuotationsPage> {
  static const Color darkRed = Color(0xFF8B0000); // ✅ dark red
  static const Color bg = Color(0xFFF6FBF9);

  final List<Map<String, dynamic>> quotations = [
    {
      "id": "Q-1001",
      "status": "Completed",
      "companyName": "ABC Corporation",
      "logo": "assets/logo.png",
      "email": "contact@abc.com",
      "phone": "+91 98765 43210",
      "date": "Oct 31, 2026",
      "time": "2:30 PM",
      "amount": 150000,
      "securityGirls": 6,
      "guns": 2,
      "uniformAmount": 12000,
      "notes": "Need guards for night shift + event support."
    },
    {
      "id": "Q-1002",
      "status": "Pending",
      "companyName": "XYZ Solutions",
      "logo": "assets/logo.png",
      "email": "info@xyz.com",
      "phone": "+91 87654 32109",
      "date": "Nov 01, 2026",
      "time": "11:15 AM",
      "amount": 98000,
      "securityGirls": 3,
      "guns": 1,
      "uniformAmount": 8000,
      "notes": "Office security day time."
    },
    {
      "id": "Q-1003",
      "status": "Completed",
      "companyName": "Tech Innovations",
      "logo": "assets/logo.png",
      "email": "hello@techinnov.com",
      "phone": "+91 76543 21098",
      "date": "Nov 02, 2026",
      "time": "4:10 PM",
      "amount": 210000,
      "securityGirls": 10,
      "guns": 4,
      "uniformAmount": 20000,
      "notes": "Factory + gate security."
    },
  ];

  String selectedTab = "Completed";

  @override
  Widget build(BuildContext context) {
    final filtered = quotations
        .where((q) =>
            (q["status"] as String).toLowerCase() ==
            selectedTab.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: bg,
      appBar: AppBar(
        backgroundColor: darkRed,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Quotations",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(18),
            bottomRight: Radius.circular(18),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _tabBtn(
                    title: "Completed",
                    isActive: selectedTab == "Completed",
                    onTap: () => setState(() => selectedTab = "Completed"),
                  ),
                  _tabBtn(
                    title: "Pending",
                    isActive: selectedTab == "Pending",
                    onTap: () => setState(() => selectedTab = "Pending"),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 14),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final q = filtered[index];
                return _quotationCard(q, context);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _tabBtn({
    required String title,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isActive ? darkRed : Colors.transparent,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 12.5,
                fontWeight: FontWeight.w600,
                color: isActive ? Colors.white : Colors.grey.shade800,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _quotationCard(Map<String, dynamic> q, BuildContext context) {
    final isCompleted = (q["status"] as String).toLowerCase() == "converted";

    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => QuotationDetailsPage(quotation: q),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: darkRed.withOpacity(0.08),
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0),
                child: Image.asset(
                  q["logo"],
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Icon(Icons.business, color: darkRed),
                ),
              ),
            ),
            const SizedBox(width: 12),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    q["companyName"],
                    style: GoogleFonts.poppins(
                      fontSize: 13.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    q["email"],
                    style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    q["phone"],
                    style: GoogleFonts.poppins(fontSize: 11, color: Colors.grey.shade700),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Sent: ${q["date"]} • ${q["time"]}",
                    style: GoogleFonts.poppins(fontSize: 10.5, color: Colors.grey.shade700),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: isCompleted
                    ? Colors.green.withOpacity(0.12)
                    : Colors.orange.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                q["status"],
                style: GoogleFonts.poppins(
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                  color: isCompleted ? Colors.green : Colors.orange,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
