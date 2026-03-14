import 'package:flutter/foundation.dart';
import '../models/index.dart';

class ChallengeProvider extends ChangeNotifier {
  List<ChallengeModel> _challenges = [];
  bool _isLoading = false;
  String? _error;

  List<ChallengeModel> get challenges => _challenges;
  bool get isLoading => _isLoading;
  String? get error => _error;

  List<ChallengeModel> get activeChallenges =>
      _challenges.where((c) => c.isActive && !c.isCompleted).toList();

  List<ChallengeModel> get completedChallenges =>
      _challenges.where((c) => c.isCompleted).toList();

  double get totalRewards =>
      _challenges.where((c) => c.isCompleted).fold(0, (sum, c) => sum + c.reward);

  Future<void> loadChallenges(String userId) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      // TODO: Fetch challenges from database
      // _challenges = await challengeService.getChallenges(userId);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addChallenge(ChallengeModel challenge) async {
    try {
      // TODO: Save to database
      // await challengeService.addChallenge(challenge);
      _challenges.add(challenge);
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> updateChallenge(ChallengeModel challenge) async {
    try {
      // TODO: Update in database
      // await challengeService.updateChallenge(challenge);
      final index = _challenges.indexWhere((item) => item.id == challenge.id);
      if (index != -1) {
        _challenges[index] = challenge;
        notifyListeners();
      }
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  Future<void> incrementProgress(String challengeId) async {
    try {
      final challenge = _challenges.firstWhere((c) => c.id == challengeId);
      final updated = challenge.copyWith(
        progressDays: challenge.progressDays + 1,
      );
      await updateChallenge(updated);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }
}
