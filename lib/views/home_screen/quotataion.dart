// // import 'package:flutter/material.dart';

// // const Color primaryRed = Color(0xFF8B0000);
// // const Color bgGrey = Color(0xFFF5F6FA);
// // const Color textGrey = Color(0xFF6B6B6B);

// // class SecurityInvoicePage extends StatefulWidget {
// //   const SecurityInvoicePage({super.key});

// //   @override
// //   State<SecurityInvoicePage> createState() => _SecurityInvoicePageState();
// // }

// // class _SecurityInvoicePageState extends State<SecurityInvoicePage> {
// //   String ledType = "LED Type A";
// //   int guards = 1;
// //   int hours = 1;
// //   double ratePerHour = 500;

// //   double get total => guards * hours * ratePerHour;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: bgGrey,
// //       appBar: AppBar(
// //         backgroundColor: primaryRed,
// //         elevation: 0,
// //         title: const Text("Create Invoice"),
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.only(right: 12),
// //             child: CircleAvatar(radius: 14, backgroundColor: Colors.white),
// //           )
// //         ],
// //       ),
// //       body: SingleChildScrollView(
// //         padding: const EdgeInsets.all(16),
// //         child: Column(
// //           children: [
// //             _invoiceDetails(),
// //             const SizedBox(height: 16),
// //             _businessCard(),
// //             const SizedBox(height: 16),
// //             _itemDetails(),
// //             const SizedBox(height: 20),
// //             _summary(),
// //             const SizedBox(height: 16),
// //             _bottomButtons(),
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   // ---------------- INVOICE DETAILS ----------------
// //   Widget _invoiceDetails() {
// //     return _card(
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: const [
// //           _InfoTile(title: "Invoice No", value: "#00001"),
// //           _InfoTile(title: "Invoice Date", value: "10/05/2024"),
// //           _InfoTile(title: "Due Date", value: "15/05/2024"),
// //         ],
// //       ),
// //     );
// //   }

// //   // ---------------- BUSINESS INFO ----------------
// //   Widget _businessCard() {
// //     return _card(
// //       child: Column(
// //         children: const [
// //           ListTile(
// //             leading: Icon(Icons.business, color: primaryRed),
// //             title: Text("From"),
// //             subtitle: Text("Add Business Information"),
// //             trailing: Icon(Icons.chevron_right),
// //           ),
// //           Divider(),
// //           ListTile(
// //             leading: Icon(Icons.person, color: primaryRed),
// //             title: Text("To"),
// //             subtitle: Text("Add Client Information"),
// //             trailing: Icon(Icons.chevron_right),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ---------------- ITEM DETAILS ----------------
// //   Widget _itemDetails() {
// //     return _card(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           const Text("Item Detail",
// //               style: TextStyle(fontWeight: FontWeight.w600)),
// //           const SizedBox(height: 12),

// //           /// LED DROPDOWN (STATIC)
// //           DropdownButtonFormField<String>(
// //             value: ledType,
// //             decoration: _inputDecoration("LED Type"),
// //             items: const [
// //               DropdownMenuItem(value: "LED Type A", child: Text("LED Type A")),
// //               DropdownMenuItem(value: "LED Type B", child: Text("LED Type B")),
// //               DropdownMenuItem(value: "LED Type C", child: Text("LED Type C")),
// //             ],
// //             onChanged: (v) => setState(() => ledType = v!),
// //           ),

// //           const SizedBox(height: 12),

// //           /// NUMBER OF SECURITY
// //           _counterRow(
// //             title: "Number of Security",
// //             value: guards,
// //             onAdd: () => setState(() => guards++),
// //             onRemove: () {
// //               if (guards > 1) setState(() => guards--);
// //             },
// //           ),

// //           /// NUMBER OF HOURS
// //           _counterRow(
// //             title: "Number of Hours",
// //             value: hours,
// //             onAdd: () => setState(() => hours++),
// //             onRemove: () {
// //               if (hours > 1) setState(() => hours--);
// //             },
// //           ),

// //           const Divider(height: 24),

// //           /// AUTO ITEM
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 "$ledType\n$guards Guards × $hours Hours",
// //                 style: const TextStyle(fontWeight: FontWeight.w500),
// //               ),
// //               Text(
// //                 "₹ ${total.toStringAsFixed(2)}",
// //                 style:
// //                     const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
// //               ),
// //             ],
// //           ),

// //           const SizedBox(height: 12),
// //           Center(
// //             child: TextButton.icon(
// //               onPressed: () {},
// //               icon: const Icon(Icons.add, color: primaryRed),
// //               label: const Text("Add Item",
// //                   style: TextStyle(color: primaryRed)),
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }

// //   // ---------------- SUMMARY ----------------
// //   Widget _summary() {
// //     return _card(
// //       child: Column(
// //         children: [
// //           _summaryRow("Sub Total", total),
// //           _summaryRow("Tax (0%)", 0),
// //           _summaryRow("Discount", 0),
// //           const Divider(),
// //           _summaryRow("Total", total, bold: true),
// //         ],
// //       ),
// //     );
// //   }

// //   // ---------------- BUTTONS ----------------
// //   Widget _bottomButtons() {
// //     return Row(
// //       children: [
// //         Expanded(
// //           child: OutlinedButton(
// //             onPressed: () {},
// //             child: const Text("Preview"),
// //           ),
// //         ),
// //         const SizedBox(width: 12),
// //         Expanded(
// //           child: ElevatedButton(
// //             style: ElevatedButton.styleFrom(
// //               backgroundColor: primaryRed,
// //             ),
// //             onPressed: () {},
// //             child: const Text("Generate"),
// //           ),
// //         ),
// //       ],
// //     );
// //   }

// //   // ---------------- COMMON ----------------
// //   Widget _card({required Widget child}) {
// //     return Container(
// //       padding: const EdgeInsets.all(16),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(14),
// //       ),
// //       child: child,
// //     );
// //   }

// //   InputDecoration _inputDecoration(String hint) {
// //     return InputDecoration(
// //       hintText: hint,
// //       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
// //       focusedBorder: OutlineInputBorder(
// //         borderRadius: BorderRadius.circular(8),
// //         borderSide: const BorderSide(color: primaryRed),
// //       ),
// //     );
// //   }

// //   Widget _counterRow({
// //     required String title,
// //     required int value,
// //     required VoidCallback onAdd,
// //     required VoidCallback onRemove,
// //   }) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 8),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(title),
// //           Row(
// //             children: [
// //               IconButton(
// //                   onPressed: onRemove,
// //                   icon: const Icon(Icons.remove, color: primaryRed)),
// //               Text(value.toString(),
// //                   style: const TextStyle(fontWeight: FontWeight.w600)),
// //               IconButton(
// //                   onPressed: onAdd,
// //                   icon: const Icon(Icons.add, color: primaryRed)),
// //             ],
// //           )
// //         ],
// //       ),
// //     );
// //   }

// //   Widget _summaryRow(String title, double value, {bool bold = false}) {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(vertical: 4),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(title),
// //           Text(
// //             "₹ ${value.toStringAsFixed(2)}",
// //             style: TextStyle(
// //                 fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// // }

// // // ---------------- SMALL TILE ----------------
// // class _InfoTile extends StatelessWidget {
// //   final String title;
// //   final String value;

// //   const _InfoTile({required this.title, required this.value});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text(title, style: const TextStyle(fontSize: 12, color: textGrey)),
// //         const SizedBox(height: 4),
// //         Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
// //       ],
// //     );
// //   }
// // }




// import 'package:flutter/material.dart';

// const Color primaryRed = Color(0xFF8B0000);
// const Color bgGrey = Color(0xFFF5F6FA);
// const Color textGrey = Color(0xFF6B6B6B);

// class SecurityInvoicePage extends StatefulWidget {
//   const SecurityInvoicePage({super.key});

//   @override
//   State<SecurityInvoicePage> createState() => _SecurityInvoicePageState();
// }

// class _SecurityInvoicePageState extends State<SecurityInvoicePage> {
//   // Editable values
//   String invoiceNo = "#00001";
//   DateTime invoiceDate = DateTime.now();
//   DateTime dueDate = DateTime.now().add(const Duration(days: 5));

//   String clientName = "Add Client Information";

//   String ledType = "LED Type A";
//   int guards = 1;
//   int hours = 1;
//   double ratePerHour = 500;

//   double get total => guards * hours * ratePerHour;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: bgGrey,
//       appBar: AppBar(
//         backgroundColor: primaryRed,
//         elevation: 0,
//         leading: const BackButton(color: Colors.white), // WHITE ARROW
//         title: const Text("Create Invoice",
//             style: TextStyle(color: Colors.white)),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.only(right: 12),
//             child: Image.asset(
//               "assets/logo.png", // YOUR LOGO
//               height: 28,
//             ),
//           )
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           children: [
//             _invoiceDetails(),
//             const SizedBox(height: 16),
//             _businessCard(),
//             const SizedBox(height: 16),
//             _itemDetails(),
//             const SizedBox(height: 20),
//             _summary(),
//             const SizedBox(height: 16),
//             _bottomButtons(),
//           ],
//         ),
//       ),
//     );
//   }

//   // ---------------- INVOICE DETAILS ----------------
//   Widget _invoiceDetails() {
//     return _card(
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           _editableTile("Invoice No", invoiceNo, () async {
//             final v = await _inputDialog("Invoice No", invoiceNo);
//             if (v != null) setState(() => invoiceNo = v);
//           }),
//           _dateTile("Invoice Date", invoiceDate),
//           _dateTile("Due Date", dueDate),
//         ],
//       ),
//     );
//   }

//   // ---------------- BUSINESS INFO ----------------
//   Widget _businessCard() {
//     return _card(
//       child: Column(
//         children: [
//           ListTile(
//             leading: Image.asset("assets/logo.png", height: 28),
//             title: const Text("FWG Security Services"),
//             subtitle: const Text("Security Service Provider"),
//           ),
//           const Divider(),
//           ListTile(
//             leading: const Icon(Icons.person, color: primaryRed),
//             title: const Text("To"),
//             subtitle: Text(clientName),
//             trailing: const Icon(Icons.chevron_right),
//             onTap: () async {
//               final v = await _inputDialog("Client Name", clientName);
//               if (v != null) setState(() => clientName = v);
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- ITEM DETAILS ----------------
//   Widget _itemDetails() {
//     return _card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Item Detail",
//               style: TextStyle(fontWeight: FontWeight.w600)),
//           const SizedBox(height: 12),

//           DropdownButtonFormField<String>(
//             value: ledType,
//             decoration: _inputDecoration("LED Type"),
//             items: const [
//               DropdownMenuItem(value: "LED Type A", child: Text("LED Type A")),
//               DropdownMenuItem(value: "LED Type B", child: Text("LED Type B")),
//               DropdownMenuItem(value: "LED Type C", child: Text("LED Type C")),
//             ],
//             onChanged: (v) => setState(() => ledType = v!),
//           ),

//           const SizedBox(height: 12),

//           _counterRow(
//             title: "Number of Security",
//             value: guards,
//             onAdd: () => setState(() => guards++),
//             onRemove: () {
//               if (guards > 1) setState(() => guards--);
//             },
//           ),

//           _counterRow(
//             title: "Number of Hours",
//             value: hours,
//             onAdd: () => setState(() => hours++),
//             onRemove: () {
//               if (hours > 1) setState(() => hours--);
//             },
//           ),

//           const Divider(height: 24),

//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text("$ledType\n$guards Guards × $hours Hours"),
//               Text("₹ ${total.toStringAsFixed(2)}",
//                   style: const TextStyle(
//                       fontWeight: FontWeight.w600, fontSize: 16)),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // ---------------- SUMMARY ----------------
//   Widget _summary() {
//     return _card(
//       child: Column(
//         children: [
//           _summaryRow("Sub Total", total),
//           _summaryRow("Tax (0%)", 0),
//           _summaryRow("Discount", 0),
//           const Divider(),
//           _summaryRow("Total", total, bold: true),
//         ],
//       ),
//     );
//   }

//   // ---------------- BUTTONS ----------------
//   Widget _bottomButtons() {
//     return Row(
//       children: [
//         Expanded(
//           child: OutlinedButton(
//             onPressed: () {},
//             child: const Text("Preview"),
//           ),
//         ),
//         const SizedBox(width: 12),
//         Expanded(
//           child: ElevatedButton(
//             style:
//                 ElevatedButton.styleFrom(backgroundColor: primaryRed),
//             onPressed: () {},
//             child: const Text("Generate"),
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------------- HELPERS ----------------
//   Widget _card({required Widget child}) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: child,
//     );
//   }

//   Widget _editableTile(String title, String value, VoidCallback onTap) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 12, color: textGrey)),
//           const SizedBox(height: 4),
//           Text(value,
//               style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }

//   Widget _dateTile(String title, DateTime date) {
//     return GestureDetector(
//       onTap: () async {
//         final d = await showDatePicker(
//           context: context,
//           initialDate: date,
//           firstDate: DateTime(2020),
//           lastDate: DateTime(2035),
//         );
//         if (d != null) {
//           setState(() {
//             if (title == "Invoice Date") {
//               invoiceDate = d;
//             } else {
//               dueDate = d;
//             }
//           });
//         }
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontSize: 12, color: textGrey)),
//           const SizedBox(height: 4),
//           Text("${date.day}/${date.month}/${date.year}",
//               style: const TextStyle(fontWeight: FontWeight.w600)),
//         ],
//       ),
//     );
//   }

//   Future<String?> _inputDialog(String title, String value) {
//     final controller = TextEditingController(text: value);
//     return showDialog<String>(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: Text(title),
//         content: TextField(controller: controller),
//         actions: [
//           TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel")),
//           ElevatedButton(
//               onPressed: () =>
//                   Navigator.pop(context, controller.text),
//               child: const Text("Save")),
//         ],
//       ),
//     );
//   }

//   InputDecoration _inputDecoration(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//         borderSide: const BorderSide(color: primaryRed),
//       ),
//     );
//   }

//   Widget _counterRow({
//     required String title,
//     required int value,
//     required VoidCallback onAdd,
//     required VoidCallback onRemove,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Row(
//           children: [
//             IconButton(
//                 onPressed: onRemove,
//                 icon:
//                     const Icon(Icons.remove, color: primaryRed)),
//             Text(value.toString(),
//                 style: const TextStyle(fontWeight: FontWeight.w600)),
//             IconButton(
//                 onPressed: onAdd,
//                 icon: const Icon(Icons.add, color: primaryRed)),
//           ],
//         )
//       ],
//     );
//   }

//   Widget _summaryRow(String title, double value, {bool bold = false}) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(title),
//         Text("₹ ${value.toStringAsFixed(2)}",
//             style:
//                 TextStyle(fontWeight: bold ? FontWeight.w600 : null)),
//       ],
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'quotationpagedetails.dart';

const Color primaryRed = Color(0xFF8B0000);
const Color bgGrey = Color(0xFFF5F6FA);
const Color textGrey = Color(0xFF6B6B6B);

class SecurityInvoicePage extends StatefulWidget {
  const SecurityInvoicePage({super.key});

  @override
  State<SecurityInvoicePage> createState() => _SecurityInvoicePageState();
}

class _SecurityInvoicePageState extends State<SecurityInvoicePage> {
  String invoiceNo = "#00001";
  DateTime invoiceDate = DateTime.now();
  DateTime dueDate = DateTime.now().add(const Duration(days: 5));

  // CLIENT DETAILS
  String clientName = "Add Client Information";
  String companyName = "";
  String email = "";
  String phone = "";
  String address = "";

  String ledType = "LED Type A";
  int guards = 1;
  int hours = 1;
  double ratePerHour = 500;

  double get total => guards * hours * ratePerHour;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgGrey,
      appBar: AppBar(
        backgroundColor: primaryRed,
        leading: const BackButton(color: Colors.white),
        title: const Text("Create Invoice",
            style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Image.asset("assets/logo.png", height: 28),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _invoiceDetails(),
            const SizedBox(height: 16),
            _businessCard(),
            const SizedBox(height: 16),
            _itemDetails(),
            const SizedBox(height: 20),
            _summary(),
            const SizedBox(height: 16),
            _bottomButtons(),
          ],
        ),
      ),
    );
  }

  // ---------------- INVOICE DETAILS ----------------
  Widget _invoiceDetails() {
    return _card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tile("Invoice No", invoiceNo),
          _dateTile("Invoice Date", invoiceDate),
          _dateTile("Due Date", dueDate),
        ],
      ),
    );
  }

  // ---------------- BUSINESS INFO ----------------
  Widget _businessCard() {
    return _card(
      child: Column(
        children: [
          ListTile(
            leading: Image.asset("assets/logo.png", height: 28),
            title: const Text("FWG Security Services"),
            subtitle: const Text("Security Service Provider"),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.person, color: primaryRed),
            title: const Text("To"),
            subtitle: Text(
              clientName,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: _openClientBottomSheet,
          ),
        ],
      ),
    );
  }

  // ---------------- ITEM DETAILS ----------------
  Widget _itemDetails() {
    return _card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Item Detail",
              style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 12),

          DropdownButtonFormField<String>(
            value: ledType,
            decoration: _inputDecoration("LED Type"),
            items: const [
              DropdownMenuItem(value: "LED Type A", child: Text("LED Type A")),
              DropdownMenuItem(value: "LED Type B", child: Text("LED Type B")),
              DropdownMenuItem(value: "LED Type C", child: Text("LED Type C")),
            ],
            onChanged: (v) => setState(() => ledType = v!),
          ),

          const SizedBox(height: 12),

          _counterRow("Number of Security", guards,
              () => setState(() => guards++),
              () => guards > 1 ? setState(() => guards--) : null),

          _counterRow("Number of Hours", hours,
              () => setState(() => hours++),
              () => hours > 1 ? setState(() => hours--) : null),

          const Divider(height: 24),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("$ledType\n$guards Guards × $hours Hours"),
              Text("₹ ${total.toStringAsFixed(2)}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }

  // ---------------- SUMMARY ----------------
  Widget _summary() {
    return _card(
      child: Column(
        children: [
          _summaryRow("Sub Total", total),
          _summaryRow("Tax (0%)", 0),
          _summaryRow("Discount", 0),
          const Divider(),
          _summaryRow("Total", total, bold: true),
        ],
      ),
    );
  }

  // ---------------- BUTTONS ----------------
  Widget _bottomButtons() {
    return Row(
      children: [
        Expanded(child: OutlinedButton(onPressed: () {}, child: const Text("Preview"))),
        const SizedBox(width: 12),
        // Expanded(
        //   child: ElevatedButton(
        //     style: ElevatedButton.styleFrom(backgroundColor: primaryRed),
        //     onPressed: () {

        //     },
        //     child: Text("Generate",style:TextStyle(color:Colors.white)),
        //   ),
        // ),

        Expanded(
  child: ElevatedButton(
    style: ElevatedButton.styleFrom(backgroundColor: primaryRed),
    onPressed: () {
      // Prepare quotation data
      final quotation = {
        "id": invoiceNo,
        "date": "${invoiceDate.day}/${invoiceDate.month}/${invoiceDate.year}",
        "time": "${invoiceDate.hour}:${invoiceDate.minute}",
        "companyName": companyName.isEmpty ? "Client" : companyName,
        "email": email,
        "phone": phone,
      };

      final totalAmount = total.toInt();
      final securityAmount = (guards * ratePerHour * hours).toInt();
      final gunAmount = 0; // You can add gun charges if any

      // Navigate to preview
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => QuotationInvoicePage(
            quotation: quotation,
            total: totalAmount,
            securityAmount: securityAmount,
            gunAmount: gunAmount,
          ),
        ),
      );
    },
    child: const Text("Generate", style: TextStyle(color: Colors.white)),
  ),
),

      ],
    );
  }

  // ---------------- CLIENT BOTTOM SHEET ----------------
  void _openClientBottomSheet() {
    final nameCtrl = TextEditingController(text: clientName == "Add Client Information" ? "" : clientName);
    final companyCtrl = TextEditingController(text: companyName);
    final emailCtrl = TextEditingController(text: email);
    final phoneCtrl = TextEditingController(text: phone);
    final addressCtrl = TextEditingController(text: address);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          top: 16,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Client Details",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            const SizedBox(height: 16),

            _field("Client Name", nameCtrl),
            _field("Company Name", companyCtrl),
            _field("Email", emailCtrl),
            _field("Phone", phoneCtrl),
            _field("Address", addressCtrl, maxLines: 2),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: primaryRed),
                onPressed: () {
                  setState(() {
                    clientName = nameCtrl.text;
                    companyName = companyCtrl.text;
                    email = emailCtrl.text;
                    phone = phoneCtrl.text;
                    address = addressCtrl.text;
                  });
                  Navigator.pop(context);
                },
                child: const Text("Save Client"),
              ),
            )
          ],
        ),
      ),
    );
  }

  // ---------------- HELPERS ----------------
  Widget _card({required Widget child}) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: child,
      );

  Widget _tile(String t, String v) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(t, style: const TextStyle(fontSize: 12, color: textGrey)),
          const SizedBox(height: 4),
          Text(v, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      );

  Widget _dateTile(String title, DateTime date) => GestureDetector(
        onTap: () async {
          final d = await showDatePicker(
            context: context,
            initialDate: date,
            firstDate: DateTime(2020),
            lastDate: DateTime(2035),
          );
          if (d != null) {
            setState(() {
              title == "Invoice Date" ? invoiceDate = d : dueDate = d;
            });
          }
        },
        child: _tile(title, "${date.day}/${date.month}/${date.year}"),
      );

  Widget _counterRow(String title, int val, VoidCallback add, VoidCallback? sub) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Row(children: [
            IconButton(onPressed: sub, icon: const Icon(Icons.remove, color: primaryRed)),
            Text(val.toString(), style: const TextStyle(fontWeight: FontWeight.w600)),
            IconButton(onPressed: add, icon: const Icon(Icons.add, color: primaryRed)),
          ])
        ],
      );

  Widget _summaryRow(String t, double v, {bool bold = false}) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t),
          Text("₹ ${v.toStringAsFixed(2)}",
              style: TextStyle(fontWeight: bold ? FontWeight.w600 : null)),
        ],
      );

  Widget _field(String hint, TextEditingController c, {int maxLines = 1}) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: TextField(
          controller: c,
          maxLines: maxLines,
          decoration: _inputDecoration(hint),
        ),
      );

  InputDecoration _inputDecoration(String h) => InputDecoration(
        hintText: h,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: primaryRed),
        ),
      );
}
