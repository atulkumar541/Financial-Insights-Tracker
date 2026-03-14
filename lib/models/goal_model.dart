class GoalModel {
  final String id;
  final String userId;
  final String title;
  final String category;
  final double targetAmount;
  final double savedAmount;
  final DateTime targetDate;
  final DateTime createdAt;
  final String priority; // low, medium, high
  final bool isCompleted;
  final String? description;

  GoalModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.category,
    required this.targetAmount,
    required this.savedAmount,
    required this.targetDate,
    required this.createdAt,
    this.priority = 'medium',
    this.isCompleted = false,
    this.description,
  });

  double get progressPercentage => (savedAmount / targetAmount) * 100;

  int get daysRemaining {
    return targetDate.difference(DateTime.now()).inDays;
  }

  GoalModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? category,
    double? targetAmount,
    double? savedAmount,
    DateTime? targetDate,
    DateTime? createdAt,
    String? priority,
    bool? isCompleted,
    String? description,
  }) {
    return GoalModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      category: category ?? this.category,
      targetAmount: targetAmount ?? this.targetAmount,
      savedAmount: savedAmount ?? this.savedAmount,
      targetDate: targetDate ?? this.targetDate,
      createdAt: createdAt ?? this.createdAt,
      priority: priority ?? this.priority,
      isCompleted: isCompleted ?? this.isCompleted,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'category': category,
      'targetAmount': targetAmount,
      'savedAmount': savedAmount,
      'targetDate': targetDate.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
      'priority': priority,
      'isCompleted': isCompleted,
      'description': description,
    };
  }

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      category: json['category'],
      targetAmount: (json['targetAmount'] as num).toDouble(),
      savedAmount: (json['savedAmount'] as num).toDouble(),
      targetDate: DateTime.parse(json['targetDate']),
      createdAt: DateTime.parse(json['createdAt']),
      priority: json['priority'] ?? 'medium',
      isCompleted: json['isCompleted'] ?? false,
      description: json['description'],
    );
  }
}
