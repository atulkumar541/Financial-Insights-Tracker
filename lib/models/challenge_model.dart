class ChallengeModel {
  final String id;
  final String userId;
  final String title;
  final String type;
  final String description;
  final DateTime startDate;
  final DateTime endDate;
  final int durationDays;
  final bool isCompleted;
  final bool isActive;
  final double reward;
  final int progressDays;

  ChallengeModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.type,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.durationDays,
    this.isCompleted = false,
    this.isActive = true,
    this.reward = 0,
    this.progressDays = 0,
  });

  double get progressPercentage => (progressDays / durationDays) * 100;

  int get daysRemaining {
    return endDate.difference(DateTime.now()).inDays;
  }

  ChallengeModel copyWith({
    String? id,
    String? userId,
    String? title,
    String? type,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
    int? durationDays,
    bool? isCompleted,
    bool? isActive,
    double? reward,
    int? progressDays,
  }) {
    return ChallengeModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      type: type ?? this.type,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      durationDays: durationDays ?? this.durationDays,
      isCompleted: isCompleted ?? this.isCompleted,
      isActive: isActive ?? this.isActive,
      reward: reward ?? this.reward,
      progressDays: progressDays ?? this.progressDays,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'type': type,
      'description': description,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'durationDays': durationDays,
      'isCompleted': isCompleted,
      'isActive': isActive,
      'reward': reward,
      'progressDays': progressDays,
    };
  }

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      type: json['type'],
      description: json['description'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      durationDays: json['durationDays'],
      isCompleted: json['isCompleted'] ?? false,
      isActive: json['isActive'] ?? true,
      reward: (json['reward'] as num).toDouble(),
      progressDays: json['progressDays'] ?? 0,
    );
  }
}
