import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Authentication/Provider/loginProvider.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fund_transfer_provider.dart';
import 'package:spring_roll_flutter/Wallet/Model/fund_transfer_response_model.dart';
import 'package:spring_roll_flutter/Wallet/Provider/web_socket_provider.dart';

class TransferForm extends ConsumerStatefulWidget {
  final String? phoneNumber;
  const TransferForm({super.key, this.phoneNumber});

  @override
  ConsumerState<TransferForm> createState() => _TransferFormState();
}

class _TransferFormState extends ConsumerState<TransferForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _receiverIdController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.phoneNumber == null) {
      _receiverIdController.text = "Phone Number";
    } else {
      _receiverIdController.text = widget.phoneNumber.toString();
    }
  }

  @override
  void dispose() {
    _receiverIdController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("the number is ___${widget.phoneNumber}");
    ref.listen(fundTransferProvider, (prev, next) {
      next.maybeWhen(
        orElse: () {},
        success: (data) {
          if (data is FundTransferResponseModel) {
            _showTransactionDialog(data);
          }
          if (data?.status == "success") {
            // ToastUtils()
            //     .showSuccessToast(context, "Fund transferred successfully");
          }
        },
        error: (e) {
          ToastUtils().showErrorToast(context, "Failed to transfer funds");
        },
      );
    });
    // ref.listen(webSocketStreamProvider, (prev, next) {
    //   next.maybeWhen(
    //     orElse: () {},
    //     data: (data) {
    //       ToastUtils().showSuccessToast(context, data);
    //     },
    //     error: (e, stack) {
    //       print("WebSocket error: $e");
    //       ToastUtils().showErrorToast(context, "Failed to transfer funds");
    //     },
    //   );
    // });
    return Scaffold(
      backgroundColor: Colors.black, // Set background to black
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(176, 78, 109, 1),
        title: Text(
          'Transfer Funds',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _receiverIdController,
                    decoration: InputDecoration(
                      labelText: 'Receiver Number',
                      labelStyle:
                          TextStyle(color: Colors.white), // White label text
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the receiver ID';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white), // White text
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: _amountController,
                    decoration: InputDecoration(
                      labelText: 'Amount',
                      labelStyle:
                          TextStyle(color: Colors.white), // White label text
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter the amount to transfer';
                      }
                      if (double.tryParse(value) == null) {
                        return 'Please enter a valid number';
                      }
                      return null;
                    },
                    style: TextStyle(color: Colors.white), // White text
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      final TextEditingController mpinController =
                          TextEditingController();

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Enter MPIN'),
                            content: TextField(
                              controller: mpinController,
                              keyboardType: TextInputType.number,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'MPIN',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () {
                                  final String mpin = mpinController.text;
                                  if (mpin.isNotEmpty) {
                                    submitForm(mpin);
                                  }
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: const Text('Pay Now'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    // onPressed: submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(
                          176, 78, 109, 1), // Set button color to teal
                      padding:
                          EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    ),
                    child: Text(
                      'Transfer',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void submitForm(String mpin) {
    if (_formKey.currentState!.validate()) {
      final receiverId = _receiverIdController.text;
      final amount = _amountController.text;
      final senderId = ref.read(phoneNumberProvider.notifier).state;

      ref
          .read(fundTransferProvider.notifier)
          .fundTransfer(receiverId, amount, mpin);
    }
  }

  void _showTransactionDialog(FundTransferResponseModel response) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          contentPadding: EdgeInsets.symmetric(vertical: 20, horizontal: 24),
          backgroundColor: const Color.fromARGB(255, 65, 65, 65),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                response.status == "success"
                    ? Icons.check_circle
                    : Icons.cancel,
                color: response.status == "success" ? Colors.green : Colors.red,
                size: 60,
              ),
              SizedBox(height: 16),
              Text(
                'Transaction ${response.status}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color:
                      response.status == "success" ? Colors.green : Colors.red,
                ),
              ),
              SizedBox(height: 12),
              Divider(thickness: 1.2),
              SizedBox(height: 12),
              _buildTransactionDetailRow('Amount', '\$${response.amount}'),
              _buildTransactionDetailRow(
                  'Receiver Name', response.receiverName),
              _buildTransactionDetailRow(
                  'Receiver Number', response.receiverNumber),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal, // Set button color to teal
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('OK', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTransactionDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Colors.white)), // White text
          Text(value, style: TextStyle(color: Colors.blueAccent, fontSize: 16)),
        ],
      ),
    );
  }
}
