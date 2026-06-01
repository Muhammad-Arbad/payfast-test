import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String> getToken(String merchantId, String securedKey, String basketId,
      double amount) async {
    try {
      // Replace with your actual API endpoint
      final response = await _dio.post(
        'https://ipg1.apps.net.pk/Ecommerce/api/Transaction/GetAccessToken',
        data: {
          'MERCHANT_ID': merchantId,
          'SECURED_KEY': securedKey,
          'BASKET_ID': basketId,
          'TXNAMT': amount,
          'CURRENCY_CODE': "PKR",
        },
        options: Options(
          contentType: Headers
              .formUrlEncodedContentType, // Sets application/x-www-form-urlencoded
        ),
      );

      if (response.statusCode == 200) {
        return response.data['ACCESS_TOKEN'];
      }
      throw Exception('Failed to get token');
    } catch (e) {
      throw Exception('Error getting token: $e');
    }
  }
}
