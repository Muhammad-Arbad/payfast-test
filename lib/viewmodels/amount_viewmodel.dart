import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import '../app/app.locator.dart';
import '../app/app.router.dart';
import '../services/api_service.dart';

class AmountViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _apiService = locator<ApiService>();
  final amountController = TextEditingController();
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> getToken() async {
    if (amountController.text.isEmpty) {
      return;
    }

    _isLoading = true;
    notifyListeners();

    String merchant_id = "102";
    String client_secret = "asdasdasd";
    try {
      final amount = double.parse(amountController.text);
      final basketId = Random().nextInt(10000).toString();
      final token = await _apiService.getToken(
        merchant_id, client_secret, basketId, amount);
        await _navigationService.navigateTo(
        Routes.webViewScreen,
        arguments: WebViewScreenArguments(
            token: token,
            amount: amount,
            basketId: basketId,
            merchant: "24752"),
      );
    } catch (e) {
      debugPrint('Error: $e');
      // Handle error appropriately
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }
}
