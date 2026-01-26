import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuotationReportsPage extends StatefulWidget {
  const QuotationReportsPage({super.key});

  @override
  State<QuotationReportsPage> createState() => _QuotationReportsPageState();
}

class _QuotationReportsPageState extends State<QuotationReportsPage> {
  // THEME (dark red like your app)
  static const Color darkRed = Color(0xFF8B0000);
  static const Color bg = Color(0xFFF6FBF9);

  int tabIndex = 0; // 0 = This Month, 1 = All Reports
  int selectedDay = DateTime.now().day;

  final TextEditingController _search = TextEditingController();

  // ---- SAMPLE DATA (replace with your API list) ----
  // Each item represents one quotation/invoice report entry
  final List<Map<String, dynamic>> allReports = [
    {
      "clientName": "ABC Logistics",
      "quoteNo": "QT-00021",
      "status": "sent", // sent/paid/pending/cancelled
      "date": DateTime(2026, 1, 9),
      "start": "12:30 AM",
      "end": "08:30 AM",
      "preparedBy": "Mohamed Ibrahim",
      "amount": 25551.07,
    },
    {
      "clientName": "Green Mart",
      "quoteNo": "QT-00022",
      "status": "pending",
      "date": DateTime(2026, 1, 9),
      "start": "10:00 AM",
      "end": "06:00 PM",
      "preparedBy": "FWG Admin",
      "amount": 19800.00,
    },
    {
      "clientName": "City Mall",
      "quoteNo": "QT-00020",
      "status": "paid",
      "date": DateTime(2026, 1, 6),
      "start": "09:00 AM",
      "end": "05:00 PM",
      "preparedBy": "FWG Admin",
      "amount": 32000.00,
    },
  ];

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  String _monthName(int m) {
    const months = [
      "January",
      "February",
      "March",
      "April",
      "May",
      "June",
      "July",
      "August",
      "September",
      "October",
      "November",
      "December"
    ];
    return months[m - 1];
  }

  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  List<Map<String, dynamic>> _filteredReports() {
    final q = _search.text.trim().toLowerCase();
    final now = DateTime.now();

    // tab filter
    List<Map<String, dynamic>> base = allReports.where((e) {
      final d = e["date"] as DateTime;
      if (tabIndex == 0) {
        // This month
        return d.year == now.year && d.month == now.month;
      }
      return true; // All reports
    }).toList();

    // calendar filter (selected day)
    base = base.where((e) {
      final d = e["date"] as DateTime;
      return d.day == selectedDay; // same selected day of current displayed month
    }).toList();

    // search filter (client/quote)
    if (q.isNotEmpty) {
      base = base.where((e) {
        final client = (e["clientName"] ?? "").toString().toLowerCase();
        final no = (e["quoteNo"] ?? "").toString().toLowerCase();
        return client.contains(q) || no.contains(q);
      }).toList();
    }

    // sort newest first
    base.sort((a, b) {
      final da = a["date"] as DateTime;
      final db = b["date"] as DateTime;
      return db.compareTo(da);
    });

    return base;
  }

  Color _statusColor(String status) {
    switch (status.toLowerCase()) {
      case "paid":
        return const Color(0xFF17A34A);
      case "sent":
        return const Color(0xFF2563EB);
      case "pending":
        return const Color(0xFFF59E0B);
      case "cancelled":
        return const Color(0xFFDC2626);
      default:
        return Colors.grey;
    }
  }

  String _statusText(String status) {
    switch (status.toLowerCase()) {
      case "paid":
        return "paid";
      case "sent":
        return "sent";
      case "pending":
        return "pending";
      case "cancelled":
        return "cancelled";
      default:
        return status;
    }
  }

  // ---- CALENDAR STRIP (like screenshot) ----
  List<DateTime> _weekDays(DateTime anchor) {
    // Monday as start
    final weekday = anchor.weekday; // Mon=1..Sun=7
    final start = anchor.subtract(Duration(days: weekday - 1));
    return List.generate(7, (i) => start.add(Duration(days: i)));
  }

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final anchorDate = DateTime(now.year, now.month, selectedDay);
    final days = _weekDays(anchorDate);

    final reports = _filteredReports();

    return Scaffold(
      backgroundColor: bg,
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
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 14),

            // Tabs (This Month / All Reports)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: _TopTabs(
                darkRed: darkRed,
                tabIndex: tabIndex,
                onChange: (i) => setState(() => tabIndex = i),
                leftText: "This month reports",
                rightText: "All reports",
              ),
            ),

            const SizedBox(height: 14),

            // Search + Filter row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black.withOpacity(0.06)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.search, size: 18, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Expanded(
                            child: TextField(
                              controller: _search,
                              onChanged: (_) => setState(() {}),
                              decoration: InputDecoration(
                                hintText: "Search client / quotation no",
                                hintStyle: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.grey.shade600,
                                ),
                                border: InputBorder.none,
                              ),
                              style: GoogleFonts.poppins(fontSize: 12.5),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  InkWell(
                    onTap: () {
                      // TODO: open filter bottom sheet if you want
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Filter coming soon")),
                      );
                    },
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.black.withOpacity(0.06)),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.tune, size: 18, color: Colors.grey.shade800),
                          const SizedBox(width: 6),
                          Text(
                            "Filter",
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 14),

            // "Quotation" cards row (like Subject chips)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Reports Type",
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See all",
                      style: GoogleFonts.poppins(
                        fontSize: 11.5,
                        fontWeight: FontWeight.w600,
                        color: darkRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Expanded(
                    child: _typeCard(
                      title: "Quotation\nReports",
                      icon: Icons.description_outlined,
                      bgColor: darkRed,
                      iconColor: Colors.white,
                      textColor: Colors.white,
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _typeCard(
                      title: "All Quotations\nReports",
                      icon: Icons.receipt_long_outlined,
                      bgColor: const Color(0xFFDFF3E7),
                      iconColor: const Color(0xFF0F7A45),
                      textColor: const Color(0xFF0F7A45),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _typeCard(
                      title: "All\nClients",
                      icon: Icons.groups_2_outlined,
                      bgColor: const Color(0xFFE6F1FF),
                      iconColor: const Color(0xFF1D4ED8),
                      textColor: const Color(0xFF1D4ED8),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 14),

            // Date header with month arrows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Text(
                    "Date",
                    style: GoogleFonts.poppins(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      // If you need month switch, implement month state.
                      // For now, change selected day -7
                      final d = anchorDate.subtract(const Duration(days: 7));
                      setState(() => selectedDay = d.day);
                    },
                  ),
                  Text(
                    _monthName(now.month),
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade800,
                    ),
                  ),
                  IconButton(
                    visualDensity: VisualDensity.compact,
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      final d = anchorDate.add(const Duration(days: 7));
                      setState(() => selectedDay = d.day);
                    },
                  ),
                ],
              ),
            ),

            // Week strip
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.black.withOpacity(0.05)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: days.map((d) {
                    final isSelected = d.day == selectedDay;
                    final dayName = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"][d.weekday - 1];
                    return InkWell(
                      onTap: () => setState(() => selectedDay = d.day),
                      borderRadius: BorderRadius.circular(14),
                      child: Container(
                        width: 46,
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          color: isSelected ? darkRed : Colors.transparent,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Column(
                          children: [
                            Text(
                              dayName,
                              style: GoogleFonts.poppins(
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              d.day.toString().padLeft(2, "0"),
                              style: GoogleFonts.poppins(
                                fontSize: 12,
                                fontWeight: FontWeight.w800,
                                color: isSelected ? Colors.white : Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Reports list
            Expanded(
              child: reports.isEmpty
                  ? Center(
                      child: Text(
                        "No reports found",
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                      itemCount: reports.length,
                      itemBuilder: (context, i) {
                        final e = reports[i];
                        final DateTime d = e["date"] as DateTime;

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (i == 0 ||
                                !_isSameDay(d, (reports[i - 1]["date"] as DateTime))) ...[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8, top: 8),
                                child: Text(
                                  "${d.day.toString().padLeft(2, "0")} ${_monthName(d.month)} ${d.year}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 12.2,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                            _ReportCard(
                              darkRed: darkRed,
                              clientName: e["clientName"].toString(),
                              quoteNo: e["quoteNo"].toString(),
                              status: _statusText(e["status"].toString()),
                              statusColor: _statusColor(e["status"].toString()),
                              startTime: e["start"].toString(),
                              endTime: e["end"].toString(),
                              preparedBy: e["preparedBy"].toString(),
                              amount: (e["amount"] as num).toDouble(),
                              onOpen: () {
                                // TODO: open your quotation preview page
                              },
                              onDownload: () {
                                // TODO: call your pdf download method
                              },
                              onShare: () {
                                // TODO: call your pdf share method
                              },
                            ),
                            const SizedBox(height: 12),
                          ],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _typeCard({
    required String title,
    required IconData icon,
    required Color bgColor,
    required Color iconColor,
    required Color textColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        height: 74,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: iconColor, size: 20),
            const Spacer(),
            Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 10.8,
                height: 1.1,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------- TOP TABS (like screenshot) -----------------
class _TopTabs extends StatelessWidget {
  final Color darkRed;
  final int tabIndex;
  final Function(int) onChange;
  final String leftText;
  final String rightText;

  const _TopTabs({
    required this.darkRed,
    required this.tabIndex,
    required this.onChange,
    required this.leftText,
    required this.rightText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          InkWell(
            onTap: () => onChange(0),
            borderRadius: BorderRadius.circular(12),
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: tabIndex == 0 ? darkRed : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    leftText,
                    style: GoogleFonts.poppins(
                      fontSize: 11.2,
                      fontWeight: FontWeight.w700,
                      color: tabIndex == 0 ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          InkWell(
            onTap: () => onChange(1),
            borderRadius: BorderRadius.circular(12),
            child: Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: tabIndex == 1 ? darkRed : Colors.transparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    rightText,
                    style: GoogleFonts.poppins(
                      fontSize: 11.2,
                      fontWeight: FontWeight.w700,
                      color: tabIndex == 1 ? Colors.white : Colors.grey.shade700,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ----------------- REPORT CARD (like your screenshot list item) -----------------
class _ReportCard extends StatelessWidget {
  final Color darkRed;
  final String clientName;
  final String quoteNo;
  final String status;
  final Color statusColor;
  final String startTime;
  final String endTime;
  final String preparedBy;
  final double amount;

  final VoidCallback onOpen;
  final VoidCallback onDownload;
  final VoidCallback onShare;

  const _ReportCard({
    required this.darkRed,
    required this.clientName,
    required this.quoteNo,
    required this.status,
    required this.statusColor,
    required this.startTime,
    required this.endTime,
    required this.preparedBy,
    required this.amount,
    required this.onOpen,
    required this.onDownload,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        children: [
          // top row (client + status)
          Row(
            children: [
              Expanded(
                child: Text(
                  clientName,
                  style: GoogleFonts.poppins(
                    fontSize: 12.6,
                    fontWeight: FontWeight.w800,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  status,
                  style: GoogleFonts.poppins(
                    fontSize: 10.8,
                    fontWeight: FontWeight.w700,
                    color: statusColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 4),

          Row(
            children: [
              Text(
                quoteNo,
                style: GoogleFonts.poppins(
                  fontSize: 11.2,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              const Spacer(),
              Text(
                "RM ${amount.toStringAsFixed(2)}",
                style: GoogleFonts.poppins(
                  fontSize: 11.8,
                  fontWeight: FontWeight.w800,
                  color: darkRed,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          _infoRow(
            iconBg: const Color(0xFFEDE9FE),
            icon: Icons.access_time,
            label: "Start time",
            value: startTime,
          ),
          const SizedBox(height: 10),
          _infoRow(
            iconBg: const Color(0xFFFFE4E6),
            icon: Icons.timer_off,
            label: "End time",
            value: endTime,
          ),
          const SizedBox(height: 10),
          _infoRow(
            iconBg: const Color(0xFFE0F2FE),
            icon: Icons.person_outline,
            label: "Prepared by",
            value: preparedBy,
          ),

          const SizedBox(height: 12),

          // actions
          Row(
            children: [
              Expanded(
                child: _actionBtn(
                  text: "Open",
                  icon: Icons.open_in_new,
                  outline: true,
                  onTap: onOpen,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _actionBtn(
                  text: "PDF",
                  icon: Icons.download,
                  outline: true,
                  onTap: onDownload,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _actionBtn(
                  text: "Share",
                  icon: Icons.share,
                  outline: false,
                  onTap: onShare,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoRow({
    required Color iconBg,
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black.withOpacity(0.06)),
      ),
      child: Row(
        children: [
          Container(
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 18, color: Colors.black87),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              label,
              style: GoogleFonts.poppins(
                fontSize: 11.4,
                fontWeight: FontWeight.w700,
                color: Colors.black87,
              ),
            ),
          ),
          Text(
            value,
            style: GoogleFonts.poppins(
              fontSize: 11.4,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _actionBtn({
    required String text,
    required IconData icon,
    required bool outline,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: outline ? Colors.white : darkRed,
          border: Border.all(
            color: outline ? darkRed.withOpacity(0.35) : Colors.transparent,
          ),
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 16, color: outline ? darkRed : Colors.white),
              const SizedBox(width: 6),
              Text(
                text,
                style: GoogleFonts.poppins(
                  fontSize: 11.2,
                  fontWeight: FontWeight.w700,
                  color: outline ? darkRed : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
