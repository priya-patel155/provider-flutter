class GetAllUser {
  int? status;
  String? message;
  List<Users>? users;

  GetAllUser({this.status, this.message, this.users});

  GetAllUser.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['users'] != null) {
      users = <Users>[];
      json['users'].forEach((v) {
        users!.add(new Users.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.users != null) {
      data['users'] = this.users!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Users {
  String? bRANCHID;
  Null? fIRMID;
  String? bRANCHNAME;
  Null? bRANCHCODE;
  Null? bRANCHADDRESS;
  Null? bRANCHSTATE;
  Null? bRANCHCITY;
  String? bRANCHCONTACT;
  Null? bRANCHALTCONTACT;
  Null? bRANCHPHONE;
  String? bRANCHEMAIL;
  Null? bRANCHTARGET;
  Null? bRANCHCREATED;
  String? bRANCHTT;
  String? bRANCHUSERNAME;
  String? bRANCHPASSWORD;
  String? bRANCHSTATUS;
  Null? cOMPANYHRMTYPE;
  Null? pARENTID;
  Null? pARENTTYPE;
  Null? sPONSERID;
  Null? uPPERID;
  Null? bRANCHPANNO;
  String? bRANCHBANKNAME;
  String? bANKACCNO;
  String? iFSCCODE;
  String? aDHARNO;
  String? sPONSERNAME;
  Null? fATHERNAME;
  Null? sTARTDATE;
  String? bRANCHVIEWPASSWORD;

  Users(
      {this.bRANCHID,
      this.fIRMID,
      this.bRANCHNAME,
      this.bRANCHCODE,
      this.bRANCHADDRESS,
      this.bRANCHSTATE,
      this.bRANCHCITY,
      this.bRANCHCONTACT,
      this.bRANCHALTCONTACT,
      this.bRANCHPHONE,
      this.bRANCHEMAIL,
      this.bRANCHTARGET,
      this.bRANCHCREATED,
      this.bRANCHTT,
      this.bRANCHUSERNAME,
      this.bRANCHPASSWORD,
      this.bRANCHSTATUS,
      this.cOMPANYHRMTYPE,
      this.pARENTID,
      this.pARENTTYPE,
      this.sPONSERID,
      this.uPPERID,
      this.bRANCHPANNO,
      this.bRANCHBANKNAME,
      this.bANKACCNO,
      this.iFSCCODE,
      this.aDHARNO,
      this.sPONSERNAME,
      this.fATHERNAME,
      this.sTARTDATE,
      this.bRANCHVIEWPASSWORD});

  Users.fromJson(Map<String, dynamic> json) {
    bRANCHID = json['BRANCH_ID'];
    fIRMID = json['FIRM_ID'];
    bRANCHNAME = json['BRANCH_NAME'];
    bRANCHCODE = json['BRANCH_CODE'];
    bRANCHADDRESS = json['BRANCH_ADDRESS'];
    bRANCHSTATE = json['BRANCH_STATE'];
    bRANCHCITY = json['BRANCH_CITY'];
    bRANCHCONTACT = json['BRANCH_CONTACT'];
    bRANCHALTCONTACT = json['BRANCH_ALT_CONTACT'];
    bRANCHPHONE = json['BRANCH_PHONE'];
    bRANCHEMAIL = json['BRANCH_EMAIL'];
    bRANCHTARGET = json['BRANCH_TARGET'];
    bRANCHCREATED = json['BRANCH_CREATED'];
    bRANCHTT = json['BRANCH_TT'];
    bRANCHUSERNAME = json['BRANCH_USERNAME'];
    bRANCHPASSWORD = json['BRANCH_PASSWORD'];
    bRANCHSTATUS = json['BRANCH_STATUS'];
    cOMPANYHRMTYPE = json['COMPANY_HRM_TYPE'];
    pARENTID = json['PARENT_ID'];
    pARENTTYPE = json['PARENT_TYPE'];
    sPONSERID = json['SPONSER_ID'];
    uPPERID = json['UPPER_ID'];
    bRANCHPANNO = json['BRANCH_PAN_NO'];
    bRANCHBANKNAME = json['BRANCH_BANK_NAME'];
    bANKACCNO = json['BANK_ACC_NO'];
    iFSCCODE = json['IFSC_CODE'];
    aDHARNO = json['ADHAR_NO'];
    sPONSERNAME = json['SPONSER_NAME'];
    fATHERNAME = json['FATHER_NAME'];
    sTARTDATE = json['START_DATE'];
    bRANCHVIEWPASSWORD = json['BRANCH_VIEW_PASSWORD'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BRANCH_ID'] = this.bRANCHID;
    data['FIRM_ID'] = this.fIRMID;
    data['BRANCH_NAME'] = this.bRANCHNAME;
    data['BRANCH_CODE'] = this.bRANCHCODE;
    data['BRANCH_ADDRESS'] = this.bRANCHADDRESS;
    data['BRANCH_STATE'] = this.bRANCHSTATE;
    data['BRANCH_CITY'] = this.bRANCHCITY;
    data['BRANCH_CONTACT'] = this.bRANCHCONTACT;
    data['BRANCH_ALT_CONTACT'] = this.bRANCHALTCONTACT;
    data['BRANCH_PHONE'] = this.bRANCHPHONE;
    data['BRANCH_EMAIL'] = this.bRANCHEMAIL;
    data['BRANCH_TARGET'] = this.bRANCHTARGET;
    data['BRANCH_CREATED'] = this.bRANCHCREATED;
    data['BRANCH_TT'] = this.bRANCHTT;
    data['BRANCH_USERNAME'] = this.bRANCHUSERNAME;
    data['BRANCH_PASSWORD'] = this.bRANCHPASSWORD;
    data['BRANCH_STATUS'] = this.bRANCHSTATUS;
    data['COMPANY_HRM_TYPE'] = this.cOMPANYHRMTYPE;
    data['PARENT_ID'] = this.pARENTID;
    data['PARENT_TYPE'] = this.pARENTTYPE;
    data['SPONSER_ID'] = this.sPONSERID;
    data['UPPER_ID'] = this.uPPERID;
    data['BRANCH_PAN_NO'] = this.bRANCHPANNO;
    data['BRANCH_BANK_NAME'] = this.bRANCHBANKNAME;
    data['BANK_ACC_NO'] = this.bANKACCNO;
    data['IFSC_CODE'] = this.iFSCCODE;
    data['ADHAR_NO'] = this.aDHARNO;
    data['SPONSER_NAME'] = this.sPONSERNAME;
    data['FATHER_NAME'] = this.fATHERNAME;
    data['START_DATE'] = this.sTARTDATE;
    data['BRANCH_VIEW_PASSWORD'] = this.bRANCHVIEWPASSWORD;
    return data;
  }
}
