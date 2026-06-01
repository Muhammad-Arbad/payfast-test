import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../viewmodels/amount_viewmodel.dart';

class AmountView extends StatelessWidget {
  const AmountView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AmountViewModel>.reactive(
      viewModelBuilder: () => AmountViewModel(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text('Payment'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: model.amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: model.isLoading ? null : model.getToken,
                child: model.isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Proceed to Payment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
