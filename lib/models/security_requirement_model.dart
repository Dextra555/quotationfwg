class SecurityRequirement {
  String fullName;
  String mobileNumber;
  String emailAddress;
  List<String> securityTypes;
  int numberOfGuards;
  String shiftType;
  String duration;
  String siteAddress;
  String city;
  String pincode;
  String message;

  SecurityRequirement({
    this.fullName = '',
    this.mobileNumber = '',
    this.emailAddress = '',
    this.securityTypes = const [],
    this.numberOfGuards = 1,
    this.shiftType = 'Day Shift',
    this.duration = 'Hourly',
    this.siteAddress = '',
    this.city = '',
    this.pincode = '',
    this.message = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'mobileNumber': mobileNumber,
      'emailAddress': emailAddress,
      'securityTypes': securityTypes,
      'numberOfGuards': numberOfGuards,
      'shiftType': shiftType,
      'duration': duration,
      'siteAddress': siteAddress,
      'city': city,
      'pincode': pincode,
      'message': message,
    };
  }

  void reset() {
    fullName = '';
    mobileNumber = '';
    emailAddress = '';
    securityTypes = [];
    numberOfGuards = 1;
    shiftType = 'Day Shift';
    duration = 'Hourly';
    siteAddress = '';
    city = '';
    pincode = '';
    message = '';
  }
}
