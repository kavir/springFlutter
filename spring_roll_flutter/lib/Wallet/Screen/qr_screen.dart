import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spring_roll_flutter/Wallet/Provider/fetch_qr_provider.dart';
import 'package:spring_roll_flutter/Wallet/Screen/qrScannerPage.dart';

class QRCodePage extends ConsumerStatefulWidget {
  final String userPhoneNumber;
  const QRCodePage({super.key, required this.userPhoneNumber});

  @override
  ConsumerState<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends ConsumerState<QRCodePage> {
  @override
  void initState() {
    super.initState();
    ref.read(qrProvider.notifier).generateQR(widget.userPhoneNumber);
  }

  @override
  Widget build(BuildContext context) {
    final qrCodeState = ref.watch(qrProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your QR Code"),
        centerTitle: true,
        backgroundColor: Color(0xFFB04E6D),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),

            // QR Code Display
            Expanded(
              child: Center(
                child: qrCodeState.maybeWhen(
                  orElse: () {},
                  loading: (Loading) => const CircularProgressIndicator(),
                  success: (data) {
                    return data != null
                        ? Image.memory(data)
                        : const Text('No data received',
                            style: TextStyle(fontSize: 16, color: Colors.red));
                  },
                  error: (error) => Text('Error: $error',
                      style: const TextStyle(fontSize: 16, color: Colors.red)),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Scan QR Code Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                icon: const Icon(Icons.qr_code_scanner, color: Colors.white),
                label: const Text("Scan QR Code"),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  textStyle: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QRScannerPage()),
                  );
                },
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
