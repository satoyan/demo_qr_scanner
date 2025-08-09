import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart'; // Import for SchedulerBinding
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({super.key});

  @override
  State<QrScannerScreen> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  late MobileScannerController _scannerController;
  bool _isScanning = true; // Controls the UI text

  Future<void> _onBarcodeDetected(BarcodeCapture capture) async {
    debugPrint('Detected barcode: ${capture.barcodes.first.rawValue}');
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty && _isScanning) {
      setState(() {
        _isScanning = false; // Update UI to show detected state
      });
      final qrCodeValue = barcodes.first.rawValue;
      if (qrCodeValue != null) {
        // Stop scanning to prevent multiple detections and navigations
        await _scannerController.stop();

        // Defer navigation to the next frame
        SchedulerBinding.instance.addPostFrameCallback((_) async {
          if (!context.mounted) {
            return;
          }

          await context.push('/details', extra: qrCodeValue);
          // After returning from details screen, restart scanner and reset UI
          setState(() {
            _isScanning = true;
          });
          await _scannerController.start();
        });
      }
    }
  }

  Future<void> _initController() async {
    _scannerController = MobileScannerController(facing: CameraFacing.front);
    await _scannerController.start(); // Start the scanner initially
    _scannerController.barcodes.listen(_onBarcodeDetected);
  }

  @override
  void initState() {
    super.initState();
    _initController();
  }

  @override
  void dispose() {
    _scannerController.dispose();
    super.dispose();
  }

  @override
  void reassemble() {
    super.reassemble();
    _scannerController.dispose();
    _initController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Scanner')),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: MobileScanner(controller: _scannerController),
          ),
          Expanded(
            child: Center(
              child: _isScanning
                  ? const Text('Scanning for QR code...')
                  : const Text('QR code detected!'),
            ),
          ),
        ],
      ),
    );
  }
}
