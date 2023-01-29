class MutualFundModel {
  int? schemeCode;
  String? schemeName;

  MutualFundModel({this.schemeCode, this.schemeName});

  MutualFundModel.fromJson(Map<String, dynamic> json) {
    schemeCode = json['schemeCode'];
    schemeName = json['schemeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['schemeCode'] = this.schemeCode;
    data['schemeName'] = this.schemeName;
    return data;
  }
}