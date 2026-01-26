import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SecurityFormPage extends StatefulWidget {
  const SecurityFormPage({super.key});

  @override
  State<SecurityFormPage> createState() => _SecurityFormPageState();
}

class _SecurityFormPageState extends State<SecurityFormPage> {
  int guards = 3;
  String? duration = "Hourly";
  String? selectedSecurityType;

  Color get maroon => const Color(0xFF8C1C1C);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8f6f4),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(24),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _title("Basic Details", color: maroon),

                const SizedBox(height: 12),
                _input("Full Name", prefix: Icons.person, color: maroon),
                const SizedBox(height: 10),
                _input("Mobile Number", prefix: Icons.phone, color: maroon),
                const SizedBox(height: 10),
                _input("Email Address", prefix: Icons.email, color: maroon),

                const SizedBox(height: 20),
                const Divider(),
                const SizedBox(height: 10),

                _title("Service Details"),

                const SizedBox(height: 12),
                _label("Type of Security Required:"),
                const SizedBox(height: 8),

                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    _chip("Residential Security"),
                    _chip("Corporate/Office Security"),
                    _chip("Night Patrol"),
                    _chip("Industrial Security"),
                    _chip("Event Security"),
                  ],
                ),

                const SizedBox(height: 20),
                _label("Number of Guards Required"),
                const SizedBox(height: 8),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _squareBtn(Icons.remove, () {
                        if (guards > 1) setState(() => guards--);
                      }),
                      const SizedBox(width: 20),
                      Text("$guards",
                          style: GoogleFonts.poppins(
                              fontSize: 22, fontWeight: FontWeight.w700)),
                      const SizedBox(width: 20),
                      _squareBtn(Icons.add, () {
                        setState(() => guards++);
                      }),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 1, onChanged: (_) {}, activeColor: maroon),
                    _radioLabel("Day Shift"),
                    Radio(value: 2, groupValue: 1, onChanged: (_) {}, activeColor: maroon),
                    _radioLabel("Night Shift"),
                    Radio(value: 3, groupValue: 1, onChanged: (_) {}, activeColor: maroon),
                    _radioLabel("24/7"),
                  ],
                ),

                const SizedBox(height: 10),
                _label("Duration"),
                const SizedBox(height: 6),

                GestureDetector(
                  onTap: () => _openDurationPicker(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(duration ?? "Select",
                            style: GoogleFonts.poppins(fontSize: 15)),
                        Icon(Icons.arrow_drop_down, color: maroon),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),
                _title("Location Details"),
                const SizedBox(height: 10),

                _input("Site Address"),
                const SizedBox(height: 10),
                _input("City"),
                const SizedBox(height: 10),
                _input("Pincode"),

                const SizedBox(height: 20),
                _title("Additional Requirements", color: maroon),
                const SizedBox(height: 8),

                _input("Message / Notes (Optional)",
                    maxLines: 3, hint: "Enter any specific instructions..."),

                const SizedBox(height: 25),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: maroon,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Submit Requirement",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _openDurationPicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            _bottomOption("Hourly"),
            _bottomOption("Daily"),
            _bottomOption("Weekly"),
          ]),
        );
      },
    );
  }

  Widget _bottomOption(String value) => RadioListTile(
        title: Text(value, style: GoogleFonts.poppins()),
        activeColor: maroon,
        value: value,
        groupValue: duration,
        onChanged: (val) {
          setState(() => duration = val.toString());
          Navigator.pop(context);
        },
      );

  Widget _squareBtn(IconData icon, VoidCallback onTap) => InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: Icon(icon, size: 24, color: maroon),
        ),
      );

  Widget _title(String text, {Color color = Colors.black}) => Text(
        text,
        style: GoogleFonts.poppins(
            fontSize: 18, fontWeight: FontWeight.w700, color: color),
      );

  Widget _label(String text) => Text(text,
      style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w500));

  Widget _radioLabel(String text) =>
      Text(text, style: GoogleFonts.poppins(fontSize: 14));

  Widget _input(String label,
      {IconData? prefix, int maxLines = 1, String? hint, Color? color}) {
    return TextField(
      maxLines: maxLines,
      style: GoogleFonts.poppins(),
      decoration: InputDecoration(
        prefixIcon: prefix != null ? Icon(prefix, color: color) : null,
        labelText: label,
        labelStyle: GoogleFonts.poppins(color: Colors.grey[700]),
        hintText: hint,
        hintStyle: GoogleFonts.poppins(color: Colors.grey),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  // ---------- Gradient Chips ----------
Widget _chip(String title) {
  final isSelected = selectedSecurityType == title;
  
  return GestureDetector(
    onTap: () {
      setState(() {
        selectedSecurityType = isSelected ? null : title;
      });
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? maroon : Colors.transparent,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(color: maroon, width: 1.5),
        boxShadow: isSelected ? [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(1, 2),
          ),
        ] : null,
      ),
      child: Text(
        title,
        style: GoogleFonts.poppins(
          color: isSelected ? Colors.white : maroon,
          fontSize: 13,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}
}
