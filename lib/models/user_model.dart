class UserModel {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;
  final String? profileImage;
  final String? personality;
  final double monthlyIncome;
  final DateTime createdAt;
  final DateTime? lastUpdated;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    this.phoneNumber,
    this.profileImage,
    this.personality,
    required this.monthlyIncome,
    required this.createdAt,
    this.lastUpdated,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
    String? profileImage,
    String? personality,
    double? monthlyIncome,
    DateTime? createdAt,
    DateTime? lastUpdated,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImage: profileImage ?? this.profileImage,
      personality: personality ?? this.personality,
      monthlyIncome: monthlyIncome ?? this.monthlyIncome,
      createdAt: createdAt ?? this.createdAt,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'personality': personality,
      'monthlyIncome': monthlyIncome,
      'createdAt': createdAt.toIso8601String(),
      'lastUpdated': lastUpdated?.toIso8601String(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      profileImage: json['profileImage'],
      personality: json['personality'],
      monthlyIncome: (json['monthlyIncome'] as num).toDouble(),
      createdAt: DateTime.parse(json['createdAt']),
      lastUpdated: json['lastUpdated'] != null 
          ? DateTime.parse(json['lastUpdated']) 
          : null,
    );
  }
}
