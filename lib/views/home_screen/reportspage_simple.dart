import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotationReportsPage extends StatefulWidget {
  const QuotationReportsPage({super.key});

  @override
  State<QuotationReportsPage> createState() => _QuotationReportsPageState();
}

class _QuotationReportsPageState extends State<QuotationReportsPage> {
  static const Color darkRed = Color(0xFF8B0000);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: darkRed,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Reports",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(
        child: Text(
          "Reports Page - Coming Soon!",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
