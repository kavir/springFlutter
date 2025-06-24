
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Utils/constants/colors.dart';
import 'package:spring_roll_flutter/Utils/toast_utils.dart';
import 'package:spring_roll_flutter/features/Authentication/Provider/phoneNumberProvdier.dart';
import 'package:spring_roll_flutter/features/Wallet/Provider/fund_transfer_provider.dart';
import 'package:spring_roll_flutter/features/Wallet/Model/fund_transfer_response_model.dart';

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
  final TextEditingController _noteController = TextEditingController();
  bool isUseReward = false;


  @override
  void initState() {
    super.initState();
    // if (widget.phoneNumber == null) {
    //   _receiverIdController.text = "Phone Number";
    // } else {
    //   _receiverIdController.text = widget.phoneNumber.toString();
    // }
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
            generalError: (e) {
              ToastUtils().showErrorToast(context, e??"Something went wrong");
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
      backgroundColor: AppColors.secondary, // Set background to black
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          'Transfer Funds',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
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
                        labelStyle: TextStyle(
                            color: AppColors.primary), // White label text
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
                        ),
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the number to transfer';
                        }
                        if (double.tryParse(value) == null) {
                          return 'Please enter a valid number';
                        }
                        return null;
                      },
                      style: TextStyle(color: AppColors.primary), // White text
                    ),
                    // TextFormField(
                    //   controller: _receiverIdController,
                    //   decoration: InputDecoration(
                    //     labelText: 'Receiver Number',
                    //     labelStyle: TextStyle(
                    //         color: AppColors.primary), // White label text
                    //     border: OutlineInputBorder(),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderSide: BorderSide(color: AppColors.primary),
                    //     ),
                    //   ),
                    //   keyboardType: TextInputType.number,
                    //   validator: (value) {
                    //     if (value == null || value.isEmpty) {
                    //       return 'Please enter the receiver ID';
                    //     }
                    //     return null;
                    //   },
                    //   style: TextStyle(color: AppColors.primary), // White text
                    // ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: _amountController,
                      decoration: InputDecoration(
                        labelText: 'Amount',
                        labelStyle: TextStyle(
                            color: AppColors.primary), // White label text
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: AppColors.primary),
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
                      style: TextStyle(color: AppColors.primary), // White text
                    ),
                     SizedBox(height: 16),
                     TextFormField(
                        controller: _noteController,
                        decoration: InputDecoration(
                          labelText: 'Note (optional)',
                          labelStyle: TextStyle(color: AppColors.primary),
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                        ),
                        keyboardType: TextInputType.multiline,
                        maxLines: 4, // or null for auto-expand
                        style: TextStyle(color: AppColors.primary),
                        validator: (value) {
                          if (value != null && value.length > 200) {
                            return 'Note must be under 200 characters';
                          }
                          return null;
                        },
                      ),
        
                     SizedBox(height: 16),
                      Checkbox(
                        value: isUseReward,
                        onChanged: (bool? newValue) {
                          setState(() {
                            isUseReward = newValue ?? false;
                          });
                        },
                      ),
              Text("Use rewards?"),
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
                                      submitForm(mpin,isUseReward);
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
                        backgroundColor:
                            AppColors.primary, // Set button color to teal
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
      ),
    );
  }

  void submitForm(String mpin,bool isUseReward) {
    if (_formKey.currentState!.validate()) {
      final receiverId = _receiverIdController.text;
      final amount = _amountController.text;
      final isReward=isUseReward;
      final senderId = ref.read(phoneNumberProvider.notifier).state;
      final note=_noteController.text;

      ref
          .read(fundTransferProvider.notifier)
          .fundTransfer(receiverId, amount, mpin,isReward,note);
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
          backgroundColor: Colors.white,
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
              _buildTransactionDetailRow('Amount:', '\NRP ${response.amount}'),
              _buildTransactionDetailRow(
                  'Service Charge:', '\NRP ${response.serviceChargeAmount}'),
              _buildTransactionDetailRow(
                  'Discount Amount:', '\NRP ${response.discountAmount}'),
              _buildTransactionDetailRow(
                  'Receiver Name:', response.receiverName),
              _buildTransactionDetailRow(
                  'Receiver Number:', response.receiverNumber),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(
                      176, 78, 109, 1), // Set button color to teal
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: Text('OK',
                    style: TextStyle(fontSize: 16, color: AppColors.primary)),
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
        crossAxisAlignment:
            CrossAxisAlignment.start, // Align to top if wrapping
        children: [
          Expanded(
            flex: 3,
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
                color: AppColors.primary,
              ),
            ),
          ),
          SizedBox(width: 10), // Space between title and value
          Expanded(
            flex: 5,
            child: Text(
              value,
              style: TextStyle(color: AppColors.primary, fontSize: 16),
              softWrap: true,
              maxLines: null, // Allows unlimited lines
              overflow: TextOverflow.visible,
            ),
          ),
        ],
      ),
    );
  }
}
