class University {
  String? api_url;
  String? name;
  String? code;
  String? tin;
  String? logo;
  String? contact;
  String? address;
  String? mailingAddress;
  String? bankDetails;
  Soato? soato;
  Ownership? ownership;
  Ownership? universityForm;
  Ownership? universityType;
  Ownership? versionType;

  University({
    this.api_url,
    this.name,
    this.code,
    this.tin,
    this.logo,
    this.contact,
    this.address,
    this.mailingAddress,
    this.bankDetails,
    this.soato,
    this.ownership,
    this.universityForm,
    this.universityType,
    this.versionType,
  });

  University.fromJson(Map<String, dynamic> json) {
    api_url = json['api_url'];
    name = json['name'];
    code = json['code'];
    tin = json['tin'];
    logo = json['logo'];
    contact = json['contact'];
    address = json['address'];
    mailingAddress = json['mailing_address'];
    bankDetails = json['bank_details'];
    soato = json['soato'] != null ? new Soato.fromJson(json['soato']) : null;
    ownership = json['ownership'] != null
        ? new Ownership.fromJson(json['ownership'])
        : null;
    universityForm = json['universityForm'] != null
        ? new Ownership.fromJson(json['universityForm'])
        : null;
    universityType = json['universityType'] != null
        ? new Ownership.fromJson(json['universityType'])
        : null;
    versionType = json['versionType'] != null
        ? new Ownership.fromJson(json['versionType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['api_url'] = this.api_url;
    data['name'] = this.name;
    data['code'] = this.code;
    data['tin'] = this.tin;
    data['logo'] = this.logo;
    data['contact'] = this.contact;
    data['address'] = this.address;
    data['mailing_address'] = this.mailingAddress;
    data['bank_details'] = this.bankDetails;
    if (this.soato != null) {
      data['soato'] = this.soato!.toJson();
    }
    if (this.ownership != null) {
      data['ownership'] = this.ownership!.toJson();
    }
    if (this.universityForm != null) {
      data['universityForm'] = this.universityForm!.toJson();
    }
    if (this.universityType != null) {
      data['universityType'] = this.universityType!.toJson();
    }
    if (this.versionType != null) {
      data['versionType'] = this.versionType!.toJson();
    }
    return data;
  }
}

class Soato {
  String? code;
  String? name;
  String? sParent;

  Soato({this.code, this.name, this.sParent});

  Soato.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    sParent = json['_parent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['_parent'] = this.sParent;
    return data;
  }
}

class Ownership {
  String? code;
  String? name;

  Ownership({this.code, this.name});

  Ownership.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    return data;
  }
}
