// import 'package:flutter/material.dart';



// const Color primaryRed = Color(0xFF8B0000);
// const Color lightRed = Color(0xFFFFEBEE);
// const Color borderGrey = Color(0xFFE0E0E0);
// const Color textGrey = Color(0xFF757575);



// class JobApplicationForm extends StatelessWidget {
//   const JobApplicationForm({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         leading: const BackButton(),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text(
//               "Sr. Web designer",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//             ),
//             SizedBox(height: 2),
//             Text(
//               "Discord",
//               style: TextStyle(fontSize: 12, color: textGrey),
//             ),
//           ],
//         ),
//         actions: const [Icon(Icons.more_vert)],
//       ),
//       body: Column(
//         children: [
//           _stepIndicator(),
//           const Divider(height: 1),
//           Expanded(child: _personalForm()),
//         ],
//       ),
//     );
//   }
// }

// Widget _stepIndicator() {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//     child: Row(
//       children: [
//         _stepCircle("1", "Personal", true),
//         _stepLine(),
//         _stepCircle("2", "Additional", false),
//         _stepLine(),
//         _stepCircle("3", "Review", false),
//       ],
//     ),
//   );
// }

// Widget _stepCircle(String number, String label, bool active) {
//   return Column(
//     children: [
//       CircleAvatar(
//         radius: 14,
//         backgroundColor: active ? primaryRed : borderGrey,
//         child: Text(
//           number,
//           style: const TextStyle(color: Colors.white, fontSize: 12),
//         ),
//       ),
//       const SizedBox(height: 6),
//       Text(
//         label,
//         style: TextStyle(
//           fontSize: 12,
//           color: active ? primaryRed : textGrey,
//           fontWeight: FontWeight.w500,
//         ),
//       ),
//     ],
//   );
// }

// Widget _stepLine() {
//   return Expanded(
//     child: Container(
//       height: 1,
//       color: borderGrey,
//       margin: const EdgeInsets.symmetric(horizontal: 8),
//     ),
//   );
// }

// Widget _personalForm() {
//   return SingleChildScrollView(
//     padding: const EdgeInsets.all(16),
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text(
//           "Personal information",
//           style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//         const SizedBox(height: 6),
//         const Text(
//           "Let us get to know you a bit better by sharing your basic info.",
//           style: TextStyle(color: textGrey),
//         ),
//         const SizedBox(height: 12),
//         const Text("* Required fields",
//             style: TextStyle(color: Colors.red, fontSize: 12)),
//         const SizedBox(height: 20),

//         _label("Full name*"),
//         _inputField("Rick Grimes", suffix: Icons.check),

//         _label("Phone number*"),
//         _inputField("+62 89 580 618 422 2"),

//         _label("Email address*"),
//         _inputField("hey@rickgrimes.com", suffix: Icons.check),

//         _label("Personal website"),
//         _inputField("rickgrimes.com", suffix: Icons.check),

//         const SizedBox(height: 30),
//         SizedBox(
//           width: double.infinity,
//           height: 48,
//           child: ElevatedButton(
//             style: ElevatedButton.styleFrom(
//               backgroundColor: primaryRed,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(6),
//               ),
//             ),
//             onPressed: () {},
//             child: const Text(
//               "Continue",
//               style: TextStyle(color: Colors.white, fontSize: 16),
//             ),
//           ),
//         )
//       ],
//     ),
//   );
// }

// Widget _label(String text) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 6),
//     child: Text(
//       text,
//       style: const TextStyle(fontWeight: FontWeight.w500),
//     ),
//   );
// }

// Widget _inputField(String hint, {IconData? suffix}) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 16),
//     child: TextField(
//       decoration: InputDecoration(
//         hintText: hint,
//         suffixIcon:
//             suffix != null ? Icon(suffix, color: primaryRed) : null,
//         border: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(6),
//         ),
//         enabledBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(6),
//           borderSide: const BorderSide(color: borderGrey),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderRadius: BorderRadius.circular(6),
//           borderSide: const BorderSide(color: primaryRed),
//         ),
//       ),
//     ),
//   );
// }



// import 'package:flutter/material.dart';

// const Color primaryRed = Color(0xFF8B0000);
// const Color borderGrey = Color(0xFFE0E0E0);
// const Color textGrey = Color(0xFF757575);

// class JobApplicationForm extends StatefulWidget {
//   const JobApplicationForm({super.key});

//   @override
//   State<JobApplicationForm> createState() => _JobApplicationFormState();
// }

// class _JobApplicationFormState extends State<JobApplicationForm> {
//   int currentStep = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         leading: const BackButton(),
//         title: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: const [
//             Text("Sr. Web designer",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//             Text("Discord",
//                 style: TextStyle(fontSize: 12, color: textGrey)),
//           ],
//         ),
//         actions: const [Icon(Icons.more_vert)],
//       ),
//       body: Column(
//         children: [
//           _stepIndicator(),
//           const Divider(height: 1),
//           Expanded(child: _getStepForm()),
//         ],
//       ),
//     );
//   }

//   Widget _getStepForm() {
//     if (currentStep == 0) return _personalForm();
//     if (currentStep == 1) return _additionalForm();
//     return _reviewForm();
//   }

//   Widget _stepIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           _stepCircle("1", "Personal", currentStep == 0),
//           _line(),
//           _stepCircle("2", "Additional", currentStep == 1),
//           _line(),
//           _stepCircle("3", "Review", currentStep == 2),
//         ],
//       ),
//     );
//   }

//   Widget _stepCircle(String n, String t, bool active) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 14,
//           backgroundColor: active ? primaryRed : borderGrey,
//           child: Text(n,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
//         ),
//         const SizedBox(height: 6),
//         Text(t,
//             style: TextStyle(
//                 fontSize: 12,
//                 color: active ? primaryRed : textGrey)),
//       ],
//     );
//   }

//   Widget _line() {
//     return Expanded(
//       child: Container(height: 1, color: borderGrey),
//     );
//   }

//   // ---------------- PERSONAL FORM ----------------
//   Widget _personalForm() {
//     return _formLayout(
//       title: "Personal information",
//       child: ElevatedButton(
//         style: _buttonStyle(),
//         onPressed: () {
//           setState(() => currentStep = 1);
//         },
//         child: const Text("Continue"),
//       ),
//     );
//   }

//   // ---------------- ADDITIONAL FORM ----------------
//   Widget _additionalForm() {
//     return _formLayout(
//       title: "Additional information",
//       child: ElevatedButton(
//         style: _buttonStyle(),
//         onPressed: () {
//           setState(() => currentStep = 2);
//         },
//         child: const Text("Continue"),
//       ),
//     );
//   }

//   // ---------------- REVIEW FORM ----------------
//   Widget _reviewForm() {
//     return _formLayout(
//       title: "Review your application",
//       child: ElevatedButton(
//         style: _buttonStyle(),
//         onPressed: () {},
//         child: const Text("Submit"),
//       ),
//     );
//   }

//   Widget _formLayout({required String title, required Widget child}) {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//           const Spacer(),
//           SizedBox(width: double.infinity, height: 48, child: child),
//         ],
//       ),
//     );
//   }

//   ButtonStyle _buttonStyle() {
//     return ElevatedButton.styleFrom(
//       backgroundColor: primaryRed,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//     );
//   }
// }
// import 'package:flutter/material.dart';

// const Color primaryRed = Color(0xFF8B0000);
// const Color borderGrey = Color(0xFFE0E0E0);
// const Color textGrey = Color(0xFF757575);

// class JobApplicationForm extends StatefulWidget {
//   const JobApplicationForm({super.key});

//   @override
//   State<JobApplicationForm> createState() => _JobApplicationFormState();
// }

// class _JobApplicationFormState extends State<JobApplicationForm> {
//   int currentStep = 0;

//   final nameCtrl = TextEditingController(text: "Rick Grimes");
//   final phoneCtrl = TextEditingController(text: "+62 89 580 618 422 2");
//   final emailCtrl = TextEditingController(text: "hey@rickgrimes.com");
//   final websiteCtrl = TextEditingController(text: "rickgrimes.com");
//   final coverCtrl = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           _stepIndicator(),
//           const Divider(height: 1),
//           Expanded(child: _getStepForm()),
//         ],
//       ),
//     );
//   }

// //   AppBar _appBar() {
// //     return AppBar(
// //       elevation: 0,
// //       backgroundColor: Colors.white,
// //       foregroundColor: Colors.black,
// //       leading: BackButton(
// //         onPressed: () {
// //           if (currentStep > 0) {
// //             setState(() => currentStep--);
// //           } else {
// //             Navigator.pop(context);
// //           }
// //         },
// //       ),
// //       title: const Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text("Lead Form",
// //               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
// //           Text("FWG Security Services", style: TextStyle(fontSize: 12, color: textGrey)),
// //         ],
// //       ),
// //       actions: const [Icon(Icons.more_vert)],
// //     );
// //   }

// AppBar _appBar() {
//   return AppBar(
//     elevation: 0,
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//     leading: BackButton(
//       onPressed: () {
//         if (currentStep > 0) {
//           setState(() => currentStep--);
//         } else {
//           Navigator.pop(context);
//         }
//       },
//     ),
//     title: const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Lead Form",
//           style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
//         ),
//         Text(
//           "FWG Security Services",
//           style: TextStyle(fontSize: 12, color: textGrey),
//         ),
//       ],
//     ),
//     actions: [
//       Padding(
//         padding: const EdgeInsets.only(right: 12),
//         child: Image.asset(
//           "assets/logo.png", // 🔴 your logo path
//           height: 28,
//           fit: BoxFit.contain,
//         ),
//       ),
//     ],
//   );
// }


//   Widget _getStepForm() {
//     if (currentStep == 0) return _personalForm();
//     if (currentStep == 1) return _additionalForm();
//     return _reviewForm();
//   }

//   Widget _stepIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           _step("1", "Personal", currentStep == 0),
//           _line(),
//           _step("2", "Additional", currentStep == 1),
//           _line(),
//           _step("3", "Review", currentStep == 2),
//         ],
//       ),
//     );
//   }

//   Widget _step(String n, String t, bool active) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 14,
//           backgroundColor: active ? primaryRed : borderGrey,
//           child: Text(n,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
//         ),
//         const SizedBox(height: 6),
//         Text(t,
//             style: TextStyle(
//                 fontSize: 12,
//                 color: active ? primaryRed : textGrey)),
//       ],
//     );
//   }

//   Widget _line() {
//     return Expanded(
//       child: Container(height: 1, color: borderGrey),
//     );
//   }

//   // ---------------- PERSONAL ----------------
//   Widget _personalForm() {
//     return _formBody(
//       title: "Personal information",
//       children: [
//         _label("Full name*"),
//         _field(nameCtrl, Icons.check),
//         _label("Phone number*"),
//         _field(phoneCtrl),
//         _label("Email address*"),
//         _field(emailCtrl, Icons.check),
//         _label("Personal website"),
//         _field(websiteCtrl, Icons.check),
//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 1),
//     );
//   }

//   // ---------------- ADDITIONAL ----------------
//   Widget _additionalForm() {
//     return _formBody(
//       title: "Additional information",
//       children: [
//         _label("Cover letter*"),
//         TextField(
//           controller: coverCtrl,
//           maxLines: 6,
//           decoration: _dec("Write here..."),
//         ),
//         const SizedBox(height: 16),
//         _label("Resume"),
//         Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             border: Border.all(color: borderGrey),
//             borderRadius: BorderRadius.circular(6),
//           ),
//           child: const Row(
//             children: [
//               Icon(Icons.insert_drive_file),
//               SizedBox(width: 8),
//               Expanded(child: Text("Sr. Web Designer Role - Rick.pdf")),
//               Text("2MB"),
//             ],
//           ),
//         ),
//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 2),
//     );
//   }

//   // ---------------- REVIEW ----------------
//   Widget _reviewForm() {
//     return _formBody(
//       title: "Review your application",
//       children: [
//         _reviewTile("Full name", nameCtrl.text),
//         _reviewTile("Phone number", phoneCtrl.text),
//         _reviewTile("Email address", emailCtrl.text),
//         _reviewTile("Website", websiteCtrl.text),
//       ],
//       buttonText: "Submit",
//       onTap: () {},
//     );
//   }

//   Widget _formBody({
//     required String title,
//     required List<Widget> children,
//     required String buttonText,
//     required VoidCallback onTap,
//   }) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 20),
//           ...children,
//           const SizedBox(height: 30),
//           SizedBox(
//             width: double.infinity,
//             height: 48,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryRed,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6)),
//               ),
//               onPressed: onTap,
//               child: Text(buttonText,
//                   style: const TextStyle(color: Colors.white, fontSize: 16)),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _label(String text) =>
//       Padding(padding: const EdgeInsets.only(bottom: 6), child: Text(text));

//   Widget _field(TextEditingController c, [IconData? i]) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: c,
//         decoration: _dec(null, i),
//       ),
//     );
//   }

//   InputDecoration _dec(String? hint, [IconData? icon]) {
//     return InputDecoration(
//       hintText: hint,
//       suffixIcon: icon != null ? Icon(icon, color: primaryRed) : null,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: primaryRed),
//         borderRadius: BorderRadius.circular(6),
//       ),
//     );
//   }

//   Widget _reviewTile(String t, String v) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [Text(t), Text(v)],
//       ),
//     );
//   }
// }


// import 'package:flutter/material.dart';

// const Color primaryRed = Color(0xFF8B0000);
// const Color borderGrey = Color(0xFFE0E0E0);
// const Color textGrey = Color(0xFF757575);

// class JobApplicationForm extends StatefulWidget {
//   const JobApplicationForm({super.key});

//   @override
//   State<JobApplicationForm> createState() => _JobApplicationFormState();
// }

// class _JobApplicationFormState extends State<JobApplicationForm> {
//   int currentStep = 0;

//   // Controllers (NO PREFILLED DATA)
//   final nameCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final phoneCtrl = TextEditingController();
//   final companyCtrl = TextEditingController();
//   final pistolCtrl = TextEditingController();
//   final uniformCtrl = TextEditingController();
//   final notesCtrl = TextEditingController();

//   bool withCompliance = true;
//   int guardsCount = 1;
//   String shiftType = "Day Shift";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           _stepIndicator(),
//           const Divider(height: 1),
//           Expanded(child: _getStepForm()),
//         ],
//       ),
//     );
//   }

//   // ---------------- APP BAR ----------------
//   AppBar _appBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//       leading: BackButton(
//         onPressed: () {
//           if (currentStep > 0) {
//             setState(() => currentStep--);
//           } else {
//             Navigator.pop(context);
//           }
//         },
//       ),
//       title: const Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Lead Form",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//           Text("FWG Security Services",
//               style: TextStyle(fontSize: 12, color: textGrey)),
//         ],
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 12),
//           child: Image.asset(
//             "assets/logo.png",
//             height: 28,
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------------- STEP LOGIC ----------------
//   Widget _getStepForm() {
//     if (currentStep == 0) return _personalForm();
//     if (currentStep == 1) return _additionalForm();
//     return _reviewForm();
//   }

//   Widget _stepIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           _step("1", "Personal", currentStep == 0),
//           _line(),
//           _step("2", "Additional", currentStep == 1),
//           _line(),
//           _step("3", "Review", currentStep == 2),
//         ],
//       ),
//     );
//   }

//   Widget _step(String n, String t, bool active) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 14,
//           backgroundColor: active ? primaryRed : borderGrey,
//           child: Text(n,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
//         ),
//         const SizedBox(height: 6),
//         Text(t,
//             style: TextStyle(
//                 fontSize: 12,
//                 color: active ? primaryRed : textGrey)),
//       ],
//     );
//   }

//   Widget _line() =>
//       Expanded(child: Container(height: 1, color: borderGrey));

//   // ---------------- PERSONAL FORM ----------------
//   Widget _personalForm() {
//     return _formBody(
//       title: "Lead information",
//       children: [
//         _label("Full name*"),
//         _field(nameCtrl, "Enter full name"),

//         _label("Email address*"),
//         _field(emailCtrl, "Enter email"),

//         _label("Phone number*"),
//         _field(phoneCtrl, "Enter phone number"),

//         _label("Company name*"),
//         _field(companyCtrl, "Enter company name"),

//         _label("Compliance type*"),
//         // Row(
//         //   children: [
//         //     Expanded(
//         //       child: RadioListTile<bool>(
//         //         value: true,
//         //         groupValue: withCompliance,
//         //         activeColor: primaryRed,
//         //         title: const Text("With compliance"),
//         //         onChanged: (v) => setState(() => withCompliance = v!),
//         //       ),
//         //     ),
//         //     Expanded(
//         //       child: RadioListTile<bool>(
//         //         value: false,
//         //         groupValue: withCompliance,
//         //         activeColor: primaryRed,
//         //         title: const Text("Without compliance"),
//         //         onChanged: (v) => setState(() => withCompliance = v!),
//         //       ),
//         //     ),
//         //   ],
//         // ),

//         Row(
//   children: [
//     Expanded(
//       child: InkWell(
//         onTap: () => setState(() => withCompliance = true),
//         child: Row(
//           children: [
//             Radio<bool>(
//               value: true,
//               groupValue: withCompliance,
//               activeColor: primaryRed,
//               onChanged: (v) => setState(() => withCompliance = v!),
//             ),
//             const Expanded(
//               child: Text(
//                 "With compliance",
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//     Expanded(
//       child: InkWell(
//         onTap: () => setState(() => withCompliance = false),
//         child: Row(
//           children: [
//             Radio<bool>(
//               value: false,
//               groupValue: withCompliance,
//               activeColor: primaryRed,
//               onChanged: (v) => setState(() => withCompliance = v!),
//             ),
//             const Expanded(
//               child: Text(
//                 "Without compliance",
//                 maxLines: 1,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   ],
// ),

//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 1),
//     );
//   }

//   // ---------------- ADDITIONAL FORM ----------------
//   Widget _additionalForm() {
//     return _formBody(
//       title: "Additional information",
//       children: [
//         _label("Number of guards required*"),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.remove),
//               onPressed: () {
//                 if (guardsCount > 1) {
//                   setState(() => guardsCount--);
//                 }
//               },
//             ),
//             Text("$guardsCount",
//                 style:
//                     const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () => setState(() => guardsCount++),
//             ),
//           ],
//         ),

//         _label("Shift type*"),
//         DropdownButtonFormField<String>(
//           value: shiftType,
//           items: const [
//             DropdownMenuItem(value: "Day Shift", child: Text("Day Shift")),
//             DropdownMenuItem(value: "Night Shift", child: Text("Night Shift")),
//             DropdownMenuItem(value: "Routine", child: Text("Routine")),
//           ],
//           onChanged: (v) => setState(() => shiftType = v!),
//           decoration: _dec("Select shift"),
//         ),

//         const SizedBox(height: 16),
//         _label("How many pistols required?"),
//         _field(pistolCtrl, "Enter number"),

//         _label("How many uniforms required?"),
//         _field(uniformCtrl, "Enter number"),

//         _label("Additional notes"),
//         TextField(
//           controller: notesCtrl,
//           maxLines: 4,
//           decoration: _dec("Write additional requirements"),
//         ),
//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 2),
//     );
//   }

//   // ---------------- REVIEW FORM ----------------
//   Widget _reviewForm() {
//     return _formBody(
//       title: "Review details",
//       children: [
//         _review("Name", nameCtrl.text),
//         _review("Email", emailCtrl.text),
//         _review("Phone", phoneCtrl.text),
//         _review("Company", companyCtrl.text),
//         _review("Compliance",
//             withCompliance ? "With compliance" : "Without compliance"),
//         _review("Guards required", guardsCount.toString()),
//         _review("Shift", shiftType),
//         _review("Pistols", pistolCtrl.text),
//         _review("Uniforms", uniformCtrl.text),
//       ],
//       buttonText: "Submit",
//       onTap: () {},
//     );
//   }

//   // ---------------- COMMON WIDGETS ----------------
//   Widget _formBody({
//     required String title,
//     required List<Widget> children,
//     required String buttonText,
//     required VoidCallback onTap,
//   }) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 20),
//           ...children,
//           const SizedBox(height: 30),
//           SizedBox(
//             width: double.infinity,
//             height: 48,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryRed,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(6)),
//               ),
//               onPressed: onTap,
//               child: Text(buttonText,
//                   style: const TextStyle(color: Colors.white, fontSize: 16)),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _label(String t) =>
//       Padding(padding: const EdgeInsets.only(bottom: 6), child: Text(t));

//   Widget _field(TextEditingController c, String hint) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: c,
//         decoration: _dec(hint),
//       ),
//     );
//   }

//   InputDecoration _dec(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: primaryRed),
//         borderRadius: BorderRadius.circular(6),
//       ),
//     );
//   }

//   Widget _review(String t, String v) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [Text(t), Text(v)],
//       ),
//     );
//   }
// }



// import 'package:flutter/material.dart';

// const Color primaryRed = Color(0xFF8B0000);
// const Color borderGrey = Color(0xFFE0E0E0);
// const Color textGrey = Color(0xFF757575);

// class JobApplicationForm extends StatefulWidget {
//   const JobApplicationForm({super.key});

//   @override
//   State<JobApplicationForm> createState() => _JobApplicationFormState();
// }

// class _JobApplicationFormState extends State<JobApplicationForm> {
//   int currentStep = 0;

//   // Controllers (NO PREFILLED DATA)
//   final nameCtrl = TextEditingController();
//   final emailCtrl = TextEditingController();
//   final phoneCtrl = TextEditingController();
//   final companyCtrl = TextEditingController();
//   final pistolCtrl = TextEditingController();
//   final uniformCtrl = TextEditingController();
//   final notesCtrl = TextEditingController();

//   bool withCompliance = true;
//   int guardsCount = 1;
//   String shiftType = "Day Shift";

//   // ✅ Compliance multi-select options
//   final List<String> complianceOptions = const ["SMETA", "RBA"];
//   final Set<String> selectedCompliance = {};

//   @override
//   void dispose() {
//     nameCtrl.dispose();
//     emailCtrl.dispose();
//     phoneCtrl.dispose();
//     companyCtrl.dispose();
//     pistolCtrl.dispose();
//     uniformCtrl.dispose();
//     notesCtrl.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _appBar(),
//       body: Column(
//         children: [
//           _stepIndicator(),
//           const Divider(height: 1),
//           Expanded(child: _getStepForm()),
//         ],
//       ),
//     );
//   }

//   // ---------------- APP BAR ----------------
//   AppBar _appBar() {
//     return AppBar(
//       elevation: 0,
//       backgroundColor: Colors.white,
//       foregroundColor: Colors.black,
//       leading: BackButton(
//         onPressed: () {
//           if (currentStep > 0) {
//             setState(() => currentStep--);
//           } else {
//             Navigator.pop(context);
//           }
//         },
//       ),
//       title: const Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text("Lead Form",
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//           Text("FWG Security Services",
//               style: TextStyle(fontSize: 12, color: textGrey)),
//         ],
//       ),
//       actions: [
//         Padding(
//           padding: const EdgeInsets.only(right: 12),
//           child: Image.asset(
//             "assets/logo.png",
//             height: 28,
//           ),
//         ),
//       ],
//     );
//   }

//   // ---------------- STEP LOGIC ----------------
//   Widget _getStepForm() {
//     if (currentStep == 0) return _personalForm();
//     if (currentStep == 1) return _additionalForm();
//     return _reviewForm();
//   }

//   Widget _stepIndicator() {
//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           _step("1", "Personal", currentStep == 0),
//           _line(),
//           _step("2", "Additional", currentStep == 1),
//           _line(),
//           _step("3", "Review", currentStep == 2),
//         ],
//       ),
//     );
//   }

//   Widget _step(String n, String t, bool active) {
//     return Column(
//       children: [
//         CircleAvatar(
//           radius: 14,
//           backgroundColor: active ? primaryRed : borderGrey,
//           child: Text(n,
//               style: const TextStyle(color: Colors.white, fontSize: 12)),
//         ),
//         const SizedBox(height: 6),
//         Text(t,
//             style: TextStyle(fontSize: 12, color: active ? primaryRed : textGrey)),
//       ],
//     );
//   }

//   Widget _line() => Expanded(child: Container(height: 1, color: borderGrey));

//   // ---------------- PERSONAL FORM ----------------
//   Widget _personalForm() {
//     return _formBody(
//       title: "Lead information",
//       children: [
//         _label("Full name*"),
//         _field(nameCtrl, "Enter full name"),

//         _label("Email address*"),
//         _field(emailCtrl, "Enter email"),

//         _label("Phone number*"),
//         _field(phoneCtrl, "Enter phone number"),

//         _label("Company name*"),
//         _field(companyCtrl, "Enter company name"),

//         _label("Compliance type*"),

//         Row(
//           children: [
//             Expanded(
//               child: InkWell(
//                 onTap: () => setState(() {
//                   withCompliance = true;
//                 }),
//                 child: Row(
//                   children: [
//                     Radio<bool>(
//                       value: true,
//                       groupValue: withCompliance,
//                       activeColor: primaryRed,
//                       onChanged: (v) => setState(() {
//                         withCompliance = v!;
//                       }),
//                     ),
//                     const Expanded(
//                       child: Text(
//                         "With compliance",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Expanded(
//               child: InkWell(
//                 onTap: () => setState(() {
//                   withCompliance = false;
//                   selectedCompliance.clear(); // ✅ clear when without compliance
//                 }),
//                 child: Row(
//                   children: [
//                     Radio<bool>(
//                       value: false,
//                       groupValue: withCompliance,
//                       activeColor: primaryRed,
//                       onChanged: (v) => setState(() {
//                         withCompliance = v!;
//                         if (!withCompliance) selectedCompliance.clear();
//                       }),
//                     ),
//                     const Expanded(
//                       child: Text(
//                         "Without compliance",
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),

//         // ✅ Multi-select options only when "With compliance" selected
//         if (withCompliance) ...[
//           const SizedBox(height: 10),
//           _label("Compliance options*"),
//           _complianceMultiSelect(),
//           const SizedBox(height: 16),
//         ],
//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 1),
//     );
//   }

//   // ✅ MULTI SELECT WIDGET
//   Widget _complianceMultiSelect() {
//     return Container(
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         border: Border.all(color: borderGrey),
//         borderRadius: BorderRadius.circular(6),
//       ),
//       child: Column(
//         children: complianceOptions.map((item) {
//           final isSelected = selectedCompliance.contains(item);
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 if (isSelected) {
//                   selectedCompliance.remove(item);
//                 } else {
//                   selectedCompliance.add(item);
//                 }
//               });
//             },
//             child: Row(
//               children: [
//                 Checkbox(
//                   value: isSelected,
//                   activeColor: primaryRed,
//                   onChanged: (v) {
//                     setState(() {
//                       if (v == true) {
//                         selectedCompliance.add(item);
//                       } else {
//                         selectedCompliance.remove(item);
//                       }
//                     });
//                   },
//                 ),
//                 Expanded(child: Text(item)),
//               ],
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }

//   // ---------------- ADDITIONAL FORM ----------------
//   Widget _additionalForm() {
//     return _formBody(
//       title: "Additional information",
//       children: [
//         _label("Number of guards required*"),
//         Row(
//           children: [
//             IconButton(
//               icon: const Icon(Icons.remove),
//               onPressed: () {
//                 if (guardsCount > 1) {
//                   setState(() => guardsCount--);
//                 }
//               },
//             ),
//             Text("$guardsCount",
//                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
//             IconButton(
//               icon: const Icon(Icons.add),
//               onPressed: () => setState(() => guardsCount++),
//             ),
//           ],
//         ),

//         _label("Shift type*"),
//         DropdownButtonFormField<String>(
//           value: shiftType,
//           items: const [
//             DropdownMenuItem(value: "8 Hours", child: Text("8 Hours")),
//             DropdownMenuItem(value: "12 Hours", child: Text("12 Hours")),
//             // DropdownMenuItem(value: "Routine", child: Text("Routine")),
//           ],
//           onChanged: (v) => setState(() => shiftType = v!),
//           decoration: _dec("Select shift"),
//         ),

//         const SizedBox(height: 16),
//         _label("How many pistols required?"),
//         _field(pistolCtrl, "Enter number"),

//         _label("How many uniforms required?"),
//         _field(uniformCtrl, "Enter number"),

//         _label("Additional notes"),
//         TextField(
//           controller: notesCtrl,
//           maxLines: 4,
//           decoration: _dec("Write additional requirements"),
//         ),
//       ],
//       buttonText: "Continue",
//       onTap: () => setState(() => currentStep = 2),
//     );
//   }

//   // ---------------- REVIEW FORM ----------------
//   Widget _reviewForm() {
//     final complianceSelectedText = selectedCompliance.isEmpty
//         ? "-"
//         : selectedCompliance.join(", ");

//     return _formBody(
//       title: "Review details",
//       children: [
//         _review("Name", nameCtrl.text),
//         _review("Email", emailCtrl.text),
//         _review("Phone", phoneCtrl.text),
//         _review("Company", companyCtrl.text),
//         _review("Compliance", withCompliance ? "With compliance" : "Without compliance"),

//         // ✅ show selected compliance options only if withCompliance
//         if (withCompliance) _review("Compliance Options", complianceSelectedText),

//         _review("Guards required", guardsCount.toString()),
//         _review("Shift", shiftType),
//         _review("Pistols", pistolCtrl.text),
//         _review("Uniforms", uniformCtrl.text),
//       ],
//       buttonText: "Submit",
//       onTap: () {},
//     );
//   }

//   // ---------------- COMMON WIDGETS ----------------
//   Widget _formBody({
//     required String title,
//     required List<Widget> children,
//     required String buttonText,
//     required VoidCallback onTap,
//   }) {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title,
//               style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
//           const SizedBox(height: 20),
//           ...children,
//           const SizedBox(height: 30),
//           SizedBox(
//             width: double.infinity,
//             height: 48,
//             child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: primaryRed,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
//               ),
//               onPressed: onTap,
//               child: Text(buttonText,
//                   style: const TextStyle(color: Colors.white, fontSize: 16)),
//             ),
//           )
//         ],
//       ),
//     );
//   }

//   Widget _label(String t) =>
//       Padding(padding: const EdgeInsets.only(bottom: 6), child: Text(t));

//   Widget _field(TextEditingController c, String hint) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: TextField(
//         controller: c,
//         decoration: _dec(hint),
//       ),
//     );
//   }

//   InputDecoration _dec(String hint) {
//     return InputDecoration(
//       hintText: hint,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
//       focusedBorder: OutlineInputBorder(
//         borderSide: const BorderSide(color: primaryRed),
//         borderRadius: BorderRadius.circular(6),
//       ),
//     );
//   }

//   Widget _review(String t, String v) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [Text(t), Flexible(child: Text(v, textAlign: TextAlign.right))],
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controllers/questionnaire_controller.dart';
import '../../widgets/dynamic_question_widget.dart';
import '../../widgets/shimmer_loading_widget.dart';

const Color primaryRed = Color(0xFF8B0000);
const Color borderGrey = Color(0xFFE0E0E0);
const Color textGrey = Color(0xFF757575);

class JobApplicationForm extends StatefulWidget {
  const JobApplicationForm({super.key});

  @override
  State<JobApplicationForm> createState() => _JobApplicationFormState();
}

class _JobApplicationFormState extends State<JobApplicationForm> {
  int currentStep = 0;
  final QuestionnaireController _questionnaireController = QuestionnaireController();

  // Controllers (NO PREFILLED DATA)
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final pistolCtrl = TextEditingController();
  final uniformCtrl = TextEditingController();
  final notesCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final cityCtrl = TextEditingController();
  final stateCtrl = TextEditingController();

  bool withCompliance = true;
  int guardsCount = 1;
  String shiftType = "8 Hours";
  int? budgetMin;
  int? budgetMax;

  // ✅ Compliance multi-select options
  final List<String> complianceOptions = const ["SMETA", "RBA"];
  final Set<String> selectedCompliance = {};

  // ✅ OT Hours multi-select
  final List<String> otHourOptions = const ["1 hour", "2 hours", "3 hours", "4 hours"];
  final Set<String> selectedOtHours = {};

  // ✅ Allowances multi-select
  final List<String> allowanceOptions = const [
    "Transport allowance",
    "Performance bonus",
    "Attendance allowance",
    "Supervisor allowance",
    "Assistant supervisor allowance",
  ];
  final Set<String> selectedAllowances = {};

  @override
  void initState() {
    super.initState();
    _loadQuestionnaireTemplates();
  }

  Future<void> _loadQuestionnaireTemplates() async {
    try {
      await _questionnaireController.loadTemplates();
    } catch (e) {
      print('Error loading templates: $e');
      // Show error message to user
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to load service types: $e'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    emailCtrl.dispose();
    phoneCtrl.dispose();
    companyCtrl.dispose();
    pistolCtrl.dispose();
    uniformCtrl.dispose();
    notesCtrl.dispose();
    addressCtrl.dispose();
    cityCtrl.dispose();
    stateCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(),
      body: Column(
        children: [
          _stepIndicator(),
          const Divider(height: 1),
          Expanded(child: _getStepForm()),
        ],
      ),
    );
  }

  // ---------------- APP BAR ----------------
  AppBar _appBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      leading: BackButton(
        onPressed: () {
          if (currentStep > 0) {
            setState(() => currentStep--);
          } else {
            Navigator.pop(context);
          }
        },
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Lead Form",
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600)),
          Text("FWG Security Services",
              style: GoogleFonts.poppins(fontSize: 12, color: textGrey)),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: Image.asset(
            "assets/logo.png",
            height: 28,
          ),
        ),
      ],
    );
  }

  // ---------------- STEP LOGIC ----------------
  Widget _getStepForm() {
    if (currentStep == 0) return _personalForm();
    if (currentStep == 1) return _additionalForm();
    return _reviewForm();
  }

  Widget _stepIndicator() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          _step("1", "Personal", currentStep == 0),
          _line(),
          _step("2", "Additional", currentStep == 1),
          _line(),
          _step("3", "Review", currentStep == 2),
        ],
      ),
    );
  }

  Widget _step(String n, String t, bool active) {
    return Column(
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: active ? primaryRed : borderGrey,
          child: Text(n,
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(height: 6),
        Text(t,
            style: GoogleFonts.poppins(
                fontSize: 12, color: active ? primaryRed : textGrey)),
      ],
    );
  }

  Widget _line() => Expanded(child: Container(height: 1, color: borderGrey));

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: GoogleFonts.poppins(),
        ),
        backgroundColor: Colors.red,
        duration: const Duration(seconds: 3),
      ),
    );
  }

  Widget _complianceOption(String title, bool active) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(color: active ? primaryRed : borderGrey),
        borderRadius: BorderRadius.circular(6),
        color: active ? primaryRed.withOpacity(0.1) : Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            active ? Icons.check_circle : Icons.radio_button_unchecked,
            color: active ? primaryRed : textGrey,
            size: 18,
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              title,
              style: GoogleFonts.poppins(
                color: active ? primaryRed : textGrey,
                fontWeight: active ? FontWeight.w500 : FontWeight.normal,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  // ---------------- PERSONAL FORM ----------------
  Widget _personalForm() {
    return ChangeNotifierProvider<QuestionnaireController>(
      create: (_) => _questionnaireController,
      child: Consumer<QuestionnaireController>(
        builder: (context, controller, child) {
          return _formBody(
            title: "Lead information",
            children: [
              _label("Full name*"),
              _fieldWithIcon(nameCtrl, "Enter full name", Icons.person),
              _label("Email address*"),
              _fieldWithIcon(emailCtrl, "Enter email", Icons.email),
              _label("Phone number*"),
              _fieldWithIcon(phoneCtrl, "Enter phone number", Icons.phone),
              _label("Company name*"),
              _fieldWithIcon(companyCtrl, "Enter company name", Icons.business),
              _label("Address*"),
              _fieldWithIcon(addressCtrl, "Enter complete address", Icons.location_on),
              _label("City*"),
              _fieldWithIcon(cityCtrl, "Enter city", Icons.location_city),
              _label("State*"),
              _fieldWithIcon(stateCtrl, "Enter state", Icons.map),

              _label("Compliance type*"),
               const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => setState(() => withCompliance = true),
                      child: _complianceOption("With compliance", withCompliance),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () => setState(() => withCompliance = false),
                      child: _complianceOption("Without compliance", !withCompliance),
                    ),
                  ),
                ],
              ),

              if (withCompliance) ...[
                const SizedBox(height: 12),
                _label("Compliance Options*"),
                _multiSelectBox(
                  options: complianceOptions,
                  selected: selectedCompliance,
                ),
              ],

              const SizedBox(height: 20),
              _label("Service type*"),
              const SizedBox(height: 12),
              if (controller.isLoadingTemplates)
                const SizedBox(
                  height: 48,
                  child: Center(child: CircularProgressIndicator()),
                )
              else if (controller.error != null)
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    border: Border.all(color: Colors.red[200]!),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Colors.red, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          controller.error!,
                          style: const TextStyle(color: Colors.red, fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                )
              else
                DropdownButtonFormField<String>(
                  value: controller.selectedTemplate?.id,
                  decoration: _dec("Select service type"),
                  items: controller.templates.map((template) {
                    return DropdownMenuItem<String>(
                      value: template.id,
                      child: Text(template.name),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.selectTemplate(value);
                    // Clear previous questions and answers when template changes
                    controller.clearQuestionsAndAnswers();
                    print('Selected template: $value'); // Debug log
                  },
                ),
            ],
            buttonText: "Continue",
            onTap: () {
              // Validate email format
              final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
              
              if (nameCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your full name');
                return;
              }
              if (emailCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your email address');
                return;
              }
              if (!emailRegex.hasMatch(emailCtrl.text)) {
                _showErrorSnackBar('Please enter a valid email address');
                return;
              }
              if (phoneCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your phone number');
                return;
              }
              if (companyCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your company name');
                return;
              }
              if (addressCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your address');
                return;
              }
              if (cityCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your city');
                return;
              }
              if (stateCtrl.text.isEmpty) {
                _showErrorSnackBar('Please enter your state');
                return;
              }
              if (controller.selectedTemplate == null) {
                _showErrorSnackBar('Please select a service type');
                return;
              }
              
              setState(() => currentStep = 1);
            },
          );
        },
      ),
    );
  }

  // ---------------- ADDITIONAL FORM ----------------
  Widget _additionalForm() {
    return ChangeNotifierProvider<QuestionnaireController>(
      create: (_) => _questionnaireController,
      child: Consumer<QuestionnaireController>(
        builder: (context, controller, child) {
          // Load questions for selected template when this form is built
          // Only load if template has questions (question_count > 0)
          if (controller.selectedTemplate != null && 
              controller.selectedTemplate!.questionCount > 0 &&
              controller.questions.isEmpty && 
              !controller.isLoadingQuestions) {
            print('Loading questions for template: ${controller.selectedTemplate!.id}'); // Debug log
            Future.microtask(() => controller.loadQuestionsForTemplate(controller.selectedTemplate!.id));
          }
          
          return _formBody(
            title: "Service Requirements",
            children: [
              // Show dynamic questions or appropriate message
              if (controller.selectedTemplate?.questionCount == 0)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.info_outline, color: Colors.grey, size: 20),
                      SizedBox(height: 8),
                      Text(
                        'No additional service requirements for this package.',
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                )
              else if (controller.isLoadingQuestions)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.5,
                          valueColor: AlwaysStoppedAnimation<Color>(primaryRed),
                        ),
                      ),
                      SizedBox(height: 8),
                      Text('Loading service requirements...'),
                    ],
                  ),
                )
              else if (controller.questions.isEmpty && controller.selectedTemplate != null && controller.selectedTemplate!.questionCount > 0)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.orange[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.orange[200]!),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.warning, color: Colors.orange, size: 20),
                      SizedBox(height: 8),
                      Text(
                        'No service requirements available for this service type.',
                        style: TextStyle(fontSize: 14, color: Colors.orange),
                      ),
                    ],
                  ),
                )
              else if (controller.questions.isNotEmpty) ...[
                const SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: primaryRed.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: primaryRed.withOpacity(0.2)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.assignment, color: primaryRed, size: 20),
                      SizedBox(height: 8),
                      Text(
                        "Service Requirements",
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryRed),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Please provide details about your security service requirements including the number of guards needed, working hours, and specific security services required.",
                        style: TextStyle(fontSize: 14, color: Colors.grey[700], height: 1.4),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                // Sort questions by display order and wrap in scrollable container
                SingleChildScrollView(
                  child: Column(
                    children: controller.questions
                      .where((q) => (q.displayOrder ?? 0) > 0) // Only show questions with valid display order
                      .toList()
                      .map((question) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: DynamicQuestionWidget(
                            question: question,
                            answer: controller.answers[question.id],
                            onAnswerChanged: (answer) {
                              controller.updateAnswer(question.id, answer);
                            },
                            primaryColor: primaryRed,
                            widgetContext: context,
                          ),
                        );
                      }).toList(),
                  ),
                ),
              ] else if (controller.selectedTemplate == null)
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: Colors.red[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.red[200]!),
                  ),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.error_outline, color: Colors.red, size: 20),
                      SizedBox(height: 8),
                      Text(
                        'Please select a service type in the previous step',
                        style: TextStyle(fontSize: 14, color: Colors.red),
                      ),
                    ],
                  ),
                ),
            ],
            buttonText: "Continue",
            onTap: () {
              // Validate mandatory questions before proceeding
              if (controller.questions.isNotEmpty && !controller.validateMandatoryQuestions()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please answer all mandatory questions')),
                );
                return;
              }
              
              if (controller.selectedTemplate != null) {
                setState(() => currentStep = 2);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Please select a service template')),
                );
              }
            },
          );
        },
      ),
    );
  }

  // ---------------- REVIEW FORM ----------------
  Widget _reviewForm() {
    return ChangeNotifierProvider<QuestionnaireController>(
      create: (_) => _questionnaireController,
      child: Consumer<QuestionnaireController>(
        builder: (context, controller, child) {
          final complianceSelectedText =
              selectedCompliance.isEmpty ? "-" : selectedCompliance.join(", ");

          return _formBody(
            title: "Review details",
            children: [
              _review("Name", nameCtrl.text),
              _review("Email", emailCtrl.text),
              _review("Phone", phoneCtrl.text),
              _review("Company", companyCtrl.text),
              _review("Address", addressCtrl.text),
              _review("City", cityCtrl.text),
              _review("State", stateCtrl.text),
              _review("Service Type", controller.selectedTemplate?.name ?? "Security Service"),
              _review("Compliance",
                  withCompliance ? "With compliance" : "Without compliance"),
              if (withCompliance) _review("Compliance Options", complianceSelectedText),

              // Show questionnaire answers
              if (controller.questions.isNotEmpty) ...[
                const Text(
                  "Service Requirements",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 8),
                Container(
                  height: 200, // Fixed height for scrollable questions
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: controller.questions.map((question) {
                        final answer = controller.answers[question.id];
                        String answerText = '-';
                        
                        if (answer != null) {
                          if (answer is List) {
                            answerText = answer.join(', ');
                          } else {
                            answerText = answer.toString();
                          }
                        }
                        
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                question.text,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                answerText,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ],
            buttonText: controller.isSubmitting ? "Submitting..." : "Submit",
            onTap: controller.isSubmitting ? () {} : () {
              _submitForm(controller);
            },
          );
        },
      ),
    );
  }

  Future<void> _submitForm(QuestionnaireController controller) async {
    try {
      // Show loading indicator
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Row(
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                ),
                SizedBox(width: 16),
                Text('Submitting form...'),
              ],
            ),
            duration: Duration(seconds: 30),
            backgroundColor: primaryRed,
          ),
        );
      }

      final response = await controller.submitLead(
        companyName: companyCtrl.text,
        contactPersonName: nameCtrl.text,
        mobileNumber: phoneCtrl.text,
        email: emailCtrl.text,
        address: addressCtrl.text,
        city: cityCtrl.text,
        state: stateCtrl.text,
        country: "India", // Default country
        postalCode: "000000", // Default postal code
        leadSource: "website",
        assignedSalesExecId: 33, // Default sales exec ID
        serviceTypeId: controller.selectedTemplate?.serviceType.id ?? 1,
        tentativeGuardsCount: 1, // Default value
        workingHoursType: "8", // Default value
        siteType: "office", // Default site type
        serviceLocation: "${addressCtrl.text}, ${cityCtrl.text}, ${stateCtrl.text}", // Complete service location
        complianceRequired: withCompliance ? "yes" : "no",
        salesNotes: notesCtrl.text,
        budgetRangeMin: budgetMin,
        budgetRangeMax: budgetMax,
      );

      // Clear the loading snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }

      if (mounted) {
        if (response.success) {
          _showModernSuccessBottomSheet(context, response.message);
          
          // Navigate back or reset form
          Future.delayed(const Duration(seconds: 3), () {
            if (mounted) {
              Navigator.pop(context);
            }
          });
        } else {
          _showModernErrorBottomSheet(context, response.message, () => _submitForm(controller));
        }
      }
    } catch (e) {
      // Clear the loading snackbar
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
      }

      String errorMessage = 'Error submitting lead: $e';
      
      // Provide more user-friendly error messages
      if (e.toString().contains('No internet connection')) {
        errorMessage = 'No internet connection. Please check your network and try again.';
      } else if (e.toString().contains('timeout')) {
        errorMessage = 'Connection timeout. Please check your internet connection and try again.';
      } else if (e.toString().contains('Session expired')) {
        errorMessage = 'Session expired. Please login again and try submitting.';
      } else if (e.toString().contains('Server error')) {
        errorMessage = 'Server is temporarily unavailable. Please try again in a few minutes.';
      }
      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('✗ $errorMessage'),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 8),
            action: SnackBarAction(
              label: 'Retry',
              textColor: Colors.white,
              onPressed: () => _submitForm(controller),
            ),
          ),
        );
      }
    }
  }

  // ---------------- MULTI SELECT BOX (REUSABLE) ----------------
  Widget _multiSelectBox({
    required List<String> options,
    required Set<String> selected,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: borderGrey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        children: options.map((item) {
          final isSelected = selected.contains(item);
          return InkWell(
            onTap: () {
              setState(() {
                if (isSelected) {
                  selected.remove(item);
                } else {
                  selected.add(item);
                }
              });
            },
            child: Row(
              children: [
                Checkbox(
                  value: isSelected,
                  activeColor: primaryRed,
                  onChanged: (v) {
                    setState(() {
                      if (v == true) {
                        selected.add(item);
                      } else {
                        selected.remove(item);
                      }
                    });
                  },
                ),
                Expanded(
                  child: Text(item),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  // ---------------- COMMON WIDGETS ----------------
  Widget _formBody({
    required String title,
    required List<Widget> children,
    required String buttonText,
    required VoidCallback onTap,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              )),
          const SizedBox(height: 20),
          ...children,
          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryRed,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6)),
              ),
              onPressed: onTap,
              child: Text(buttonText,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  )),
            ),
          )
        ],
      ),
    );
  }

  Widget _label(String t) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 6),
        child: Text(
          t,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
      );

  Widget _field(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: c,
        decoration: _dec(hint),
      ),
    );
  }

  Widget _fieldWithIcon(TextEditingController c, String hint, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: c,
        decoration: _decWithIcon(hint, icon),
      ),
    );
  }

  InputDecoration _dec(String hint) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey[600],
        fontSize: 14,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryRed),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  InputDecoration _decWithIcon(String hint, IconData icon) {
    return InputDecoration(
      hintText: hint,
      hintStyle: GoogleFonts.poppins(
        color: Colors.grey[600],
        fontSize: 14,
      ),
      prefixIcon: Icon(
        icon,
        color: primaryRed,
        size: 20,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryRed),
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }

  Widget _review(String t, String v) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(t), Flexible(child: Text(v, textAlign: TextAlign.right))],
      ),
    );
  }

  void _showModernSuccessBottomSheet(BuildContext context, String message) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.green[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check_circle_rounded,
                      color: Colors.green[600],
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Lead Created Successfully!',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.green[500]!, Colors.green[600]!],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: () => Navigator.pop(context),
                        child: Center(
                          child: Text(
                            'Done',
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showModernErrorBottomSheet(BuildContext context, String message, VoidCallback onRetry) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 60,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Column(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.red[50],
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.error_rounded,
                      color: Colors.red[600],
                      size: 48,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Submission Failed',
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey[300]!),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => Navigator.pop(context),
                              child: Center(
                                child: Text(
                                  'Cancel',
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [Colors.red[500]!, Colors.red[600]!],
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(12),
                              onTap: () {
                                Navigator.pop(context);
                                onRetry();
                              },
                              child: Center(
                                child: Text(
                                  'Retry',
                                  style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
