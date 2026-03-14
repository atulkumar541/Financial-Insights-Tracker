import 'package:flutter/foundation.dart';
import '../models/index.dart';

class SpendingProvider extends ChangeNotifier {
  List<SpendingModel> _spendings = [];
  bool _isLoading = false;
  String? _error;

  List<SpendingModel> get spendings => _spendings;
  bool get isLoading => _isLoading;
  String? get error => _error;

  double get totalSpending =>
      _spendings.fold(0, (sum, item) => sum + item.amount);

  double get totalImpulsiveSpending =>
      _spendings.where((item) => item.isImpulsive).fold(
          0, (sum, item) => sum + item.amount);

  Map<String, double> get spendingByCategory {
    final Map<String, double> categoryMap = {};
    for (var spending in _spendings) {
      categoryMap[spending.category] =
          (categoryMap[spending.category] ?? 0) + spending.amount;
    }
    return categoryMap;
  }

  Future<void> loadSpendings(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch spendings from database
      // _spendings = await spendingService.getSpendings(userId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addSpending(SpendingModel spending) async {
    try {
      // TODO: Save to database
      // await spendingService.addSpending(spending);
      _spendings.add(spending);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteSpending(String spendingId) async {
    try {
      // TODO: Delete from database
      // await spendingService.deleteSpending(spendingId);
      _spendings.removeWhere((item) => item.id == spendingId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
