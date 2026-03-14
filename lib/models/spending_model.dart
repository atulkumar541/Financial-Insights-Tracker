class SpendingModel {
  final String id;
  final String userId;
  final double amount;
  final String category;
  final String description;
  final DateTime date;
  final String? paymentMethod;
  final bool isImpulsive;

  SpendingModel({
    required this.id,
    required this.userId,
    required this.amount,
    required this.category,
    required this.description,
    required this.date,
    this.paymentMethod,
    this.isImpulsive = false,
  });

  SpendingModel copyWith({
    String? id,
    String? userId,
    double? amount,
    String? category,
    String? description,
    DateTime? date,
    String? paymentMethod,
    bool? isImpulsive,
  }) {
    return SpendingModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      amount: amount ?? this.amount,
      category: category ?? this.category,
      description: description ?? this.description,
      date: date ?? this.date,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      isImpulsive: isImpulsive ?? this.isImpulsive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'amount': amount,
      'category': category,
      'description': description,
      'date': date.toIso8601String(),
      'paymentMethod': paymentMethod,
      'isImpulsive': isImpulsive,
    };
  }

  factory SpendingModel.fromJson(Map<String, dynamic> json) {
    return SpendingModel(
      id: json['id'],
      userId: json['userId'],
      amount: (json['amount'] as num).toDouble(),
      category: json['category'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      paymentMethod: json['paymentMethod'],
      isImpulsive: json['isImpulsive'] ?? false,
    );
  }
}
