import 'package:flutter/foundation.dart';
import '../models/index.dart';

class GoalProvider extends ChangeNotifier {
  List<GoalModel> _goals = [];
  bool _isLoading = false;
  String? _error;

  List<GoalModel> get goals => _goals;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<GoalModel> get activeGoals =>
      _goals.where((goal) => !goal.isCompleted).toList();

  List<GoalModel> get completedGoals =>
      _goals.where((goal) => goal.isCompleted).toList();

  Future<void> loadGoals(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch goals from database
      // _goals = await goalService.getGoals(userId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addGoal(GoalModel goal) async {
    try {
      // TODO: Save to database
      // await goalService.addGoal(goal);
      _goals.add(goal);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateGoal(GoalModel goal) async {
    try {
      // TODO: Update in database
      // await goalService.updateGoal(goal);
      final index = _goals.indexWhere((item) => item.id == goal.id);
      if (index != -1) {
        _goals[index] = goal;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteGoal(String goalId) async {
    try {
      // TODO: Delete from database
      // await goalService.deleteGoal(goalId);
      _goals.removeWhere((item) => item.id == goalId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
