class PersonInformation {
  final int? id;
  final String? name;
  final String? phoneNumber;
  final String? login;
  final String? password;
  final String? email;
  final bool notify;
  final bool controlMaintenance;
  final DateTime created;
  final DateTime? update;
  PersonInformation({
    this.id,
    this.name,
    this.phoneNumber,
    this.login,
    this.password,
    this.email,
    required this.notify,
    required this.controlMaintenance,
    required this.created,
    this.update,
  });
}
