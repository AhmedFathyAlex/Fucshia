class RelatedPepole {
  int id;
  int cOMId;
  int cUSCode;
  String cUSName;
  String cUSLastName;
  String cUSusername;
  String cUSGender;
  String cUSGenderDisplay;
  String cUSBirthDate;
  String cUSMobile;
  String cUSEmail;
  String cUSAddress;
  String cUSAddressDescription;
  String cUSNotes;
  String cUSActive;
  String cUSActiveDisplay;
  String cUSPic;
  double relatedCUSKeyField;
  double countryCTTKeyField;
  double governorateCTTKeyField;
  double cityCTTKeyField;
  double areaCTTKeyField;
  double groupCTTKeyField;
  String cUSLangtitude;
  String cUSAltitude;
  double totalPurchase;
  double countOfPurchase;
  double avgPurchase;

  RelatedPepole(
      {this.id,
        this.cOMId,
        this.cUSCode,
        this.cUSName,
        this.cUSLastName,
        this.cUSusername,
        this.cUSGender,
        this.cUSGenderDisplay,
        this.cUSBirthDate,
        this.cUSMobile,
        this.cUSEmail,
        this.cUSAddress,
        this.cUSAddressDescription,
        this.cUSNotes,
        this.cUSActive,
        this.cUSActiveDisplay,
        this.cUSPic,
        this.relatedCUSKeyField,
        this.countryCTTKeyField,
        this.governorateCTTKeyField,
        this.cityCTTKeyField,
        this.areaCTTKeyField,
        this.groupCTTKeyField,
        this.cUSLangtitude,
        this.cUSAltitude,
        this.totalPurchase,
        this.countOfPurchase,
        this.avgPurchase});

  RelatedPepole.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cOMId = json['COMId'];
//    cUSCode = json['CUSCode'];
    cUSName = json['CUSName'];
    cUSLastName = json['CUSLastName'];
    cUSusername = json['CUSusername'];
    cUSGender = json['CUSGender'];
//    cUSGenderDisplay = json['CUSGenderDisplay'];
//    cUSBirthDate = json['CUSBirthDate'];
    cUSMobile = json['CUSMobile'];
    cUSEmail = json['CUSEmail'];
    cUSAddress = json['CUSAddress'];
//    cUSAddressDescription = json['CUSAddressDescription'];
//    cUSNotes = json['CUSNotes'];
//    cUSActive = json['CUSActive'];
//    cUSActiveDisplay = json['CUSActiveDisplay'];
    cUSPic = json['CUSPic'];
//    relatedCUSKeyField = json['Related_CUSKeyField'];
//    countryCTTKeyField = json['Country_CTTKeyField'];
//    governorateCTTKeyField = json['Governorate_CTTKeyField'];
//    cityCTTKeyField = json['City_CTTKeyField'];
//    areaCTTKeyField = json['Area_CTTKeyField'];
//    groupCTTKeyField = json['Group_CTTKeyField'];
//    cUSLangtitude = json['CUSLangtitude'];
//    cUSAltitude = json['CUSAltitude'];
//    totalPurchase = json['total_purchase'];
//    countOfPurchase = json['count_of_purchase'];
//    avgPurchase = json['avg_purchase'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['COMId'] = this.cOMId;
    data['CUSCode'] = this.cUSCode;
    data['CUSName'] = this.cUSName;
    data['CUSLastName'] = this.cUSLastName;
    data['CUSusername'] = this.cUSusername;
    data['CUSGender'] = this.cUSGender;
    data['CUSGenderDisplay'] = this.cUSGenderDisplay;
    data['CUSBirthDate'] = this.cUSBirthDate;
    data['CUSMobile'] = this.cUSMobile;
    data['CUSEmail'] = this.cUSEmail;
    data['CUSAddress'] = this.cUSAddress;
    data['CUSAddressDescription'] = this.cUSAddressDescription;
    data['CUSNotes'] = this.cUSNotes;
    data['CUSActive'] = this.cUSActive;
    data['CUSActiveDisplay'] = this.cUSActiveDisplay;
    data['CUSPic'] = this.cUSPic;
    data['Related_CUSKeyField'] = this.relatedCUSKeyField;
    data['Country_CTTKeyField'] = this.countryCTTKeyField;
    data['Governorate_CTTKeyField'] = this.governorateCTTKeyField;
    data['City_CTTKeyField'] = this.cityCTTKeyField;
    data['Area_CTTKeyField'] = this.areaCTTKeyField;
    data['Group_CTTKeyField'] = this.groupCTTKeyField;
    data['CUSLangtitude'] = this.cUSLangtitude;
    data['CUSAltitude'] = this.cUSAltitude;
    data['total_purchase'] = this.totalPurchase;
    data['count_of_purchase'] = this.countOfPurchase;
    data['avg_purchase'] = this.avgPurchase;
    return data;
  }
}