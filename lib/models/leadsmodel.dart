class LeadModel {
  final String id;
  final String companyName;
  final String email;
  final String phone;
  final String address;
  final int securityNeededCount;
  final int uniformCount;
  final String logoUrl; // or asset path

  /// status: "New" | "In Progress" | "Converted" | "Closed"
  final String status;

  /// trackerStep: 1..5
  /// 1 Lead created
  /// 2 Contacted
  /// 3 Site visit
  /// 4 Quotation sent
  /// 5 Converted to client
  final int trackerStep;

  LeadModel({
    required this.id,
    required this.companyName,
    required this.email,
    required this.phone,
    required this.address,
    required this.securityNeededCount,
    required this.uniformCount,
    required this.logoUrl,
    required this.status,
    required this.trackerStep,
  });
}
