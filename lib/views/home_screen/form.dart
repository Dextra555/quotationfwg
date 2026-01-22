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


import 'package:flutter/material.dart';

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

  // Controllers (NO PREFILLED DATA)
  final nameCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final companyCtrl = TextEditingController();
  final pistolCtrl = TextEditingController();
  final uniformCtrl = TextEditingController();
  final notesCtrl = TextEditingController();

  bool withCompliance = true;
  int guardsCount = 1;
  String shiftType = "Day Shift";

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
      title: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Lead Form",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          Text("FWG Security Services",
              style: TextStyle(fontSize: 12, color: textGrey)),
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
              style: const TextStyle(color: Colors.white, fontSize: 12)),
        ),
        const SizedBox(height: 6),
        Text(t,
            style: TextStyle(
                fontSize: 12,
                color: active ? primaryRed : textGrey)),
      ],
    );
  }

  Widget _line() =>
      Expanded(child: Container(height: 1, color: borderGrey));

  // ---------------- PERSONAL FORM ----------------
  Widget _personalForm() {
    return _formBody(
      title: "Lead information",
      children: [
        _label("Full name*"),
        _field(nameCtrl, "Enter full name"),

        _label("Email address*"),
        _field(emailCtrl, "Enter email"),

        _label("Phone number*"),
        _field(phoneCtrl, "Enter phone number"),

        _label("Company name*"),
        _field(companyCtrl, "Enter company name"),

        _label("Compliance type*"),
        // Row(
        //   children: [
        //     Expanded(
        //       child: RadioListTile<bool>(
        //         value: true,
        //         groupValue: withCompliance,
        //         activeColor: primaryRed,
        //         title: const Text("With compliance"),
        //         onChanged: (v) => setState(() => withCompliance = v!),
        //       ),
        //     ),
        //     Expanded(
        //       child: RadioListTile<bool>(
        //         value: false,
        //         groupValue: withCompliance,
        //         activeColor: primaryRed,
        //         title: const Text("Without compliance"),
        //         onChanged: (v) => setState(() => withCompliance = v!),
        //       ),
        //     ),
        //   ],
        // ),

        Row(
  children: [
    Expanded(
      child: InkWell(
        onTap: () => setState(() => withCompliance = true),
        child: Row(
          children: [
            Radio<bool>(
              value: true,
              groupValue: withCompliance,
              activeColor: primaryRed,
              onChanged: (v) => setState(() => withCompliance = v!),
            ),
            const Expanded(
              child: Text(
                "With compliance",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
    Expanded(
      child: InkWell(
        onTap: () => setState(() => withCompliance = false),
        child: Row(
          children: [
            Radio<bool>(
              value: false,
              groupValue: withCompliance,
              activeColor: primaryRed,
              onChanged: (v) => setState(() => withCompliance = v!),
            ),
            const Expanded(
              child: Text(
                "Without compliance",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    ),
  ],
),

      ],
      buttonText: "Continue",
      onTap: () => setState(() => currentStep = 1),
    );
  }

  // ---------------- ADDITIONAL FORM ----------------
  Widget _additionalForm() {
    return _formBody(
      title: "Additional information",
      children: [
        _label("Number of guards required*"),
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                if (guardsCount > 1) {
                  setState(() => guardsCount--);
                }
              },
            ),
            Text("$guardsCount",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () => setState(() => guardsCount++),
            ),
          ],
        ),

        _label("Shift type*"),
        DropdownButtonFormField<String>(
          value: shiftType,
          items: const [
            DropdownMenuItem(value: "Day Shift", child: Text("Day Shift")),
            DropdownMenuItem(value: "Night Shift", child: Text("Night Shift")),
            DropdownMenuItem(value: "Routine", child: Text("Routine")),
          ],
          onChanged: (v) => setState(() => shiftType = v!),
          decoration: _dec("Select shift"),
        ),

        const SizedBox(height: 16),
        _label("How many pistols required?"),
        _field(pistolCtrl, "Enter number"),

        _label("How many uniforms required?"),
        _field(uniformCtrl, "Enter number"),

        _label("Additional notes"),
        TextField(
          controller: notesCtrl,
          maxLines: 4,
          decoration: _dec("Write additional requirements"),
        ),
      ],
      buttonText: "Continue",
      onTap: () => setState(() => currentStep = 2),
    );
  }

  // ---------------- REVIEW FORM ----------------
  Widget _reviewForm() {
    return _formBody(
      title: "Review details",
      children: [
        _review("Name", nameCtrl.text),
        _review("Email", emailCtrl.text),
        _review("Phone", phoneCtrl.text),
        _review("Company", companyCtrl.text),
        _review("Compliance",
            withCompliance ? "With compliance" : "Without compliance"),
        _review("Guards required", guardsCount.toString()),
        _review("Shift", shiftType),
        _review("Pistols", pistolCtrl.text),
        _review("Uniforms", uniformCtrl.text),
      ],
      buttonText: "Submit",
      onTap: () {},
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
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
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
                  style: const TextStyle(color: Colors.white, fontSize: 16)),
            ),
          )
        ],
      ),
    );
  }

  Widget _label(String t) =>
      Padding(padding: const EdgeInsets.only(bottom: 6), child: Text(t));

  Widget _field(TextEditingController c, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: c,
        decoration: _dec(hint),
      ),
    );
  }

  InputDecoration _dec(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(6)),
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: primaryRed),
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }

  Widget _review(String t, String v) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(t), Text(v)],
      ),
    );
  }
}
