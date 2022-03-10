class Users {
  final String fullName;
  final String email;
  final String contactNumber;
  final String permanentAddress;
  final String nic;
  final String password;
  final String serviceArea;
  final String district;

  Users(
      {this.fullName, this.email, this.contactNumber, this.permanentAddress, this.nic, this.password, this.serviceArea, this.district});

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'contactNumber': contactNumber,
      'permanentAddress': permanentAddress,
      'nic': nic,
      'password': password,
      'serviceArea': serviceArea,
      'district': district,
    };
  }
}


