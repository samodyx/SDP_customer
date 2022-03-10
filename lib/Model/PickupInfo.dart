class PickupInfo {
  final String customerID;
  final String customerName;
  final String liveCity;
  final String liveAddress;
  final String liveLatitude;
  final String liveLongitude;
  final String recAddress;
  final String dropOffCity;
  final String type;
  final String recName;
  final String recContactNumber;
  final String reqStatus;

  PickupInfo({
    this.customerID,
    this.customerName,
    this.liveCity,
    this.liveAddress,
    this.liveLatitude,
    this.liveLongitude,
    this.recAddress,
    this.dropOffCity,
    this.type,
    this.recName,
    this.recContactNumber,
    this.reqStatus
  });

  Map<String, dynamic> toMap() {
    return {
      'customerID':customerID,
      'cusName':customerName,
      'cusServiceArea': liveCity,
      'cusAddress': liveAddress,
      'liveLatitude': liveLatitude,
      'liveLongitude': liveLongitude,
      'recAddress': recAddress,
      'recServiceArea': dropOffCity,
      'parcelType': type,
      'recName': recName,
      'recContact': recContactNumber,
      'reqStatus':reqStatus,
    };
  }
}
