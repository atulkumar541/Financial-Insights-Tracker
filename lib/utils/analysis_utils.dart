class SpendingAnalysisUtils {
  /// Analyzes spending patterns and identifies behavior type
  static String analyzeSpendingBehavior(List<Map<String, dynamic>> spendings) {
    if (spendings.isEmpty) return 'Balanced';

    final impulsivePercent = (spendings
                .where((s) => s['isImpulsive'] == true)
                .length /
            spendings.length) *
        100;

    if (impulsivePercent > 60) {
      return 'Impulsive';
    } else if (impulsivePercent > 30) {
      return 'Mixed';
    } else {
      return 'Cautious';
    }
  }

  /// Calculates the probability of impulsive spending
  static double calculateImpulsiveProbability(double amount, double avgAmountPerTransaction) {
    if (amount > avgAmountPerTransaction * 1.5) {
      return 0.8; // 80% chance of impulsive
    } else if (amount > avgAmountPerTransaction) {
      return 0.5; // 50% chance
    }
    return 0.2; // 20% chance
  }

  /// Categorizes spending into personality type
  static String categorizeMoneyPersonality(Map<String, double> spendingByCategory) {
    // This would be based on detailed analysis
    // For now, return a default
    return 'Strategic';
  }
}

class GoalProgressUtils {
  /// Calculates monthly savings needed to reach goal
  static double calculateMonthlySavingsNeeded(
    double goalAmount,
    double currentSaved,
    int remainingDays,
  ) {
    final remainingAmount = goalAmount - currentSaved;
    final remainingMonths = remainingDays / 30;

    if (remainingMonths <= 0) return 0;
    return remainingAmount / remainingMonths;
  }

  /// Calculates goal completion status
  static String getGoalStatus(double current, double target, int daysRemaining) {
    final percent = (current / target) * 100;

    if (percent >= 100) {
      return 'Completed';
    } else if (daysRemaining <= 0) {
      return 'Overdue';
    } else if (percent >= 75) {
      return 'On Track';
    } else if (percent >= 50) {
      return 'In Progress';
    } else {
      return 'Just Started';
    }
  }
}
