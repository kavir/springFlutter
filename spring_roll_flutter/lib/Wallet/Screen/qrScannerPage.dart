import 'package:flutter/material.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:spring_roll_flutter/Wallet/Screen/fun_transfer_screen.dart';

class QRScannerPage extends StatefulWidget {
  @override
  _QRScannerPageState createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedData = '';
  bool isProcessing = false; // Prevents multiple scans

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Scan QR Code"),
        centerTitle: true,
        backgroundColor: Colors.black,
        elevation: 0,
      ),
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

          // Scanning Animation (Optional)
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 250),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
                ),
                const SizedBox(height: 16),
                Text(
                  scannedData.isEmpty ? "Scanning..." : "Scanned: $scannedData",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Camera Controls
          Positioned(
            bottom: 50,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.flash_on, color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.toggleFlash();
                  },
                ),
                IconButton(
                  icon: Icon(Icons.flip_camera_ios, color: Colors.white, size: 30),
                  onPressed: () async {
                    await controller?.flipCamera();
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
        ],
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
