import 'package:flutter/foundation.dart';
import '../models/index.dart';

class IncomeProvider extends ChangeNotifier {
  List<IncomeModel> _incomes = [];
  bool _isLoading = false;
  String? _error;

  List<IncomeModel> get incomes => _incomes;
  bool get isLoading => _isLoading;
  String? get error => _error;

  double get totalIncome =>
      _incomes.fold(0, (sum, item) => sum + item.amount);

  Map<String, double> get incomeBySource {
    final Map<String, double> sourceMap = {};
    for (var income in _incomes) {
      sourceMap[income.source] =
          (sourceMap[income.source] ?? 0) + income.amount;
    }
    return sourceMap;
  }

  Future<void> loadIncomes(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch incomes from database
      // _incomes = await incomeService.getIncomes(userId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addIncome(IncomeModel income) async {
    try {
      // TODO: Save to database
      // await incomeService.addIncome(income);
      _incomes.add(income);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> deleteIncome(String incomeId) async {
    try {
      // TODO: Delete from database
      // await incomeService.deleteIncome(incomeId);
      _incomes.removeWhere((income) => income.id == incomeId);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateIncome(IncomeModel income) async {
    try {
      // TODO: Update in database
      // await incomeService.updateIncome(income);
      final index = _incomes.indexWhere((i) => i.id == income.id);
      if (index != -1) {
        _incomes[index] = income;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
    notifyListeners();
  }
}
