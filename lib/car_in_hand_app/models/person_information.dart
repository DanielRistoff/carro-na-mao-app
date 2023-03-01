class PersonInformation {
  int? id;
  String? name;
  String? phoneNumber;
  String? login;
  String? password;
  String? email;
  bool notify;
  bool controlMaintenance;
  DateTime createdDate;
  DateTime? updateDate;
  PersonInformation({
    this.id,
    this.name,
    this.phoneNumber,
    this.login,
    this.password,
    this.email,
    required this.notify,
    required this.controlMaintenance,
    required this.createdDate,
    this.updateDate,
  });
}
