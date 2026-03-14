class IncomeModel {
  final String id;
  final String userId;
  final double amount;
  final String source;
  final String description;
  final DateTime date;

  IncomeModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.source,
    required this.description,
    required this.date,
  });

  IncomeModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? source,
    String? description,
    DateTime? date,
  }) {
    return IncomeModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      source: source ?? this.source,
      description: description ?? this.description,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'source': source,
      'description': description,
      'date': date.toIso8601String(),
    };
  }

  factory IncomeModel.fromJson(Map<String, dynamic> json) {
    return IncomeModel(
      id: json['id'],
      userId: json['userId'],
      amount: json['amount'],
      source: json['source'],
      description: json['description'],
      date: DateTime.parse(json['date']),
    );
  }
}
