
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen extends StatelessWidget {
  final String token;
  final String basketId;
  final double amount;
  final String merchant;
  final checkoutUrl =
      "https://webhook.site/5e943bd7-4224-419f-b35f-c42278844fbb";
  final successURL = "https://jsonplaceholder.typicode.com/todos/1";

  const WebViewScreen(
      {Key? key,
      required this.token,
      required this.basketId,
      required this.amount,
      required this.merchant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String params = "TOKEN=${token}" +
        "&MERCHANT_ID=${merchant}" +
        "&MERCHANT_NAME=Test" +
        "&PROCCODE=00" +
        "&TXNAMT=${amount}" +
        "&CUSTOMER_MOBILE_NO=923462763311" +
        "&CUSTOMER_EMAIL_ADDRESS=umar@gopayfast.com" +
        "&SIGNATURE=testsign" +
        "&VERSION=MERCHANT-CART-0.1" +
        "&TXNDESC=Test DESC" +
        "&SUCCESS_URL=${successURL}" +
        "&FAILURE_URL=${successURL}" +
        "&BASKET_ID=${basketId}" +
        "&ORDER_DATE=${getOrderDate()}" +
        "&CHECKOUT_URL=${checkoutUrl}" +
        "&CURRENCY_CODE=PKR" +
        "&TRAN_TYPE=ECOMM_PURCHASE" +
        "&STORE_ID=" +
        "&BILL_NUMBER=" +
        "&BILL_NUMBER=" +
        "&CUSTOMER_ID=" +
        "&CUSTOMER_ID=" +
        "&ORDER_DATE=${getOrderDate()}" +
        "&ADDITIONAL_VALUE=${getOrderDate()}" +
        "&RECURRING_TXN=";

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(
        Uri.parse(
            'https://ipguat.apps.net.pk/Ecommerce/api/Transaction/PostTransaction',
            // 'https://ipg1.apps.net.pk/Ecommerce/api/Transaction/PostTransaction'
        ),
        method: LoadRequestMethod.post,
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: Uint8List.fromList(utf8.encode(params)),
      );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }

  String getOrderDate() {
    // Define the desired date format
    final dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss", "en_US");
    // Get the current date and time
    final date = DateTime.now();
    // Format and return the date string
    return dateFormat.format(date);
  }
}
