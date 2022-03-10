class PickupDetails {
  final String customerID;
  final String employeeID;
  final String requestID;
  final String customerName;
  final String customerNumber;
  final String pickupName;
  final String pickupStatus;
  final String pickupTime;

  PickupDetails({this.customerID,
    this.employeeID,
    this.requestID,
    this.customerName,
    this.customerNumber,
    this.pickupName,
    this.pickupStatus,
    this.pickupTime});

  Map<String, dynamic> toMap() {
    return {
      'customerID': customerID,
      'employeeID': employeeID,
      'requestID': requestID,
      'customerName': customerName,
      'customerNumber': customerNumber,
      'pickupName': pickupName,
      'pickupStatus': pickupStatus,
      'pickupTime': pickupTime,
    };
  }
}
