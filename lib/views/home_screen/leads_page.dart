import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'leadsdetailspage.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({super.key});

  @override
  State<LeadsPage> createState() => _LeadsPageState();
}

class _LeadsPageState extends State<LeadsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _selectedStatus = 'All';
  String _selectedCategory = 'All';

  // Sample lead data
  final List<Map<String, dynamic>> _leads = [
    {
      'name': 'ABC Corporation',
      'logo': 'assets/logo.png',
      'status': 'converted',
      'category': 'Enterprise',
      'contact': '+91 98765 43210',
      'email': 'contact@abc.com',
    },
    {
      'name': 'XYZ Solutions',
      'logo': 'assets/logo.png',
      'status': 'not_converted',
      'category': 'SME',
      'contact': '+91 87654 32109',
      'email': 'info@xyz.com',
    },
    {
      'name': 'Tech Innovations',
      'logo': 'assets/logo.png',
      'status': 'converted',
      'category': 'Startup',
      'contact': '+91 76543 21098',
      'email': 'hello@techinnov.com',
    },
    {
      'name': 'Global Services',
      'logo': 'assets/logo.png',
      'status': 'not_converted',
      'category': 'Enterprise',
      'contact': '+91 65432 10987',
      'email': 'support@global.com',
    },
    {
      'name': 'Local Business',
      'logo': 'assets/logo.png',
      'status': 'converted',
      'category': 'SME',
      'contact': '+91 54321 09876',
      'email': 'info@local.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6FBF9),
      appBar: AppBar(
        backgroundColor: const Color(0xFF8B1E1E),
        elevation: 0,
        title: Text(
          'Leads Management',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              'Total: ${_leads.length}',
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF8B1E1E),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FWG SECURITY SERVICES',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Contact: +91 98765 43210 | email@fwg.com',
                  style: GoogleFonts.poppins(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: 140,
                  height: 36,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF8B1E1E),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                    child: Text(
                      'Contact',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Products Title
                  Text(
                    'Leads',
                    style: GoogleFonts.poppins(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF8B1E1E),
                    ),
                  ),
                  const SizedBox(height: 20),

                  
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search leads...',
                        hintStyle: GoogleFonts.poppins(
                          color: Colors.grey.shade400,
                          fontSize: 14,
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.grey.shade400),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Filter Options
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedStatus,
                              isExpanded: true,
                              items: ['All', 'Converted', 'Not Converted']
                                  .map((status) => DropdownMenuItem(
                                        value: status,
                                        child: Text(
                                          status,
                                          style: GoogleFonts.poppins(fontSize: 14),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedStatus = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey.shade300),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: _selectedCategory,
                              isExpanded: true,
                              items: ['All', 'Enterprise', 'SME', 'Startup']
                                  .map((category) => DropdownMenuItem(
                                        value: category,
                                        child: Text(
                                          category,
                                          style: GoogleFonts.poppins(fontSize: 14),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  _selectedCategory = value!;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                 
                  Expanded(
                    child: ListView.builder(
                      itemCount: _leads.length,
                      itemBuilder: (context, index) {
                        final lead = _leads[index];
                        return _buildLeadCard(lead);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildLeadCard(Map<String, dynamic> lead) {
  //   bool isConverted = lead['status'] == 'converted';
    
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 12),
  //     padding: const EdgeInsets.all(16),
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.circular(12),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black.withOpacity(0.05),
  //           blurRadius: 10,
  //           offset: const Offset(0, 2),
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         // Company Logo
  //         Container(
  //           width: 90,
  //           height: 50,
  //           decoration: BoxDecoration(
  //             color: const Color(0xFF8B1E1E).withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: ClipRRect(
  //             borderRadius: BorderRadius.circular(8),
  //             child: Image.asset(
  //               lead['logo'],
  //               fit: BoxFit.cover,
  //               errorBuilder: (context, error, stackTrace) {
  //                 return Icon(
  //                   Icons.business,
  //                   color: const Color(0xFF8B1E1E),
  //                   size: 24,
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //         const SizedBox(width: 12),

  //         // Lead Information
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 lead['name'],
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.w600,
  //                   color: Colors.black87,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 lead['category'],
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 12,
  //                   color: Colors.grey.shade600,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(
  //                 lead['contact'],
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 12,
  //                   color: Colors.grey.shade600,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),

          
  //         Container(
  //           padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
  //           decoration: BoxDecoration(
  //             color: isConverted
  //                 ? Colors.green.withOpacity(0.1)
  //                 : Colors.red.withOpacity(0.1),
  //             borderRadius: BorderRadius.circular(12),
  //           ),
  //           child: Row(
  //             mainAxisSize: MainAxisSize.min,
  //             children: [
  //               Icon(
  //                 isConverted ? Icons.check_circle : Icons.cancel,
  //                 color: isConverted ? Colors.green : Colors.red,
  //                 size: 16,
  //               ),
  //               const SizedBox(width: 4),
  //               Text(
  //                 isConverted ? 'Converted' : 'Not Converted',
  //                 style: GoogleFonts.poppins(
  //                   fontSize: 10,
  //                   fontWeight: FontWeight.w500,
  //                   color: isConverted ? Colors.green : Colors.red,
  //                 ),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildLeadCard(Map<String, dynamic> lead) {
  bool isConverted = lead['status'] == 'converted';

  return InkWell(
    borderRadius: BorderRadius.circular(12),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => LeadDetailsPage(lead: lead),
        ),
      );
    },
    child: Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          // Company Logo
          Container(
            width: 90,
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFF8B1E1E).withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                lead['logo'],
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.business,
                    color: Color(0xFF8B1E1E),
                    size: 24,
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Lead Information
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lead['name'],
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lead['category'],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  lead['contact'],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
          ),

          // Status Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: isConverted
                  ? Colors.green.withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isConverted ? Icons.check_circle : Icons.cancel,
                  color: isConverted ? Colors.green : Colors.red,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  isConverted ? 'Converted' : 'Not Converted',
                  style: GoogleFonts.poppins(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    color: isConverted ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

}
