class Recall {
  final int? id;
  final DateTime startYear;
  final DateTime stopYear;
  final DateTime created;
  final DateTime? update;

  Recall({
    this.id,
    required this.startYear,
    required this.stopYear,
    required this.created,
    required this.update,
  });
}
