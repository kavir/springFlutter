import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:spring_roll_flutter/Utils/loadingIndicator.dart';
import 'package:spring_roll_flutter/features/Wallet/Provider/fetch_qr_provider.dart';
import 'package:spring_roll_flutter/features/Wallet/Screen/fun_transfer_screen.dart'; // To generate QR code

class QRScannerPage extends ConsumerStatefulWidget {
  final String userPhoneNumber;
  const QRScannerPage({super.key, required this.userPhoneNumber});

  @override
  ConsumerState<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends ConsumerState<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedData = '';
  bool isProcessing = false;

  @override
  void initState() {
    super.initState();
    ref.read(qrProvider.notifier).generateQR(widget.userPhoneNumber);
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _showBottomSheetForQRCode() {
    final qrCodeState = ref.watch(qrProvider);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Color(0xFFB04E6D),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.3,
          minChildSize: 0.2,
          maxChildSize: 0.9,
          expand: false,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: qrCodeState.maybeWhen(
                orElse: () {},
                loading: (loading) {
                  CustomLoadingIndicator().show(context);
                  return Center(child: CircularProgressIndicator());
                },
                success: (data) {
                  return data != null
                      ? Image.memory(data) // Display the QR code as an image
                      : const Text(
                          'No data received',
                          style: TextStyle(fontSize: 16, color: Colors.red),
                        );
                },
                error: (error) => Text(
                  'Error: $error',
                  style: const TextStyle(fontSize: 16, color: Colors.red),
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // QR Scanner View
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: Colors.blue,
              borderRadius: 16,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: 250,
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            right: 20,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(Icons.flash_on, color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.toggleFlash();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.close, color: Colors.red, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 80,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.flip_camera_ios,
                      color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.flipCamera();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFB04E6D),
        onPressed:
            _showBottomSheetForQRCode, // Open the Bottom Sheet to show QR code
        child: const Icon(
          Icons.qr_code,
          color: Colors.white,
        ),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (!isProcessing) {
        setState(() {
          scannedData = scanData.code ?? "";
          isProcessing = true;
        });

        print("Scanned Data: $scannedData");

        if (scannedData.isNotEmpty) {
          controller.pauseCamera();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => TransferForm(phoneNumber: scannedData),
            ),
          );
        }
      }
    });
  }
}
