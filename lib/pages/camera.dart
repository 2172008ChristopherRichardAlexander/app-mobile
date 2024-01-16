import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  CameraController? _cameraController; 
  QRViewController? _qrViewController;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);

    await _cameraController?.initialize(); 

    if (!mounted) {
      return;
    }

    setState(() {});
  }

  @override
  void dispose() {
    _qrViewController?.dispose();
    _cameraController?.dispose(); // Dispose only if initialized
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _qrViewController = controller;
      controller.scannedDataStream.listen((scanData) {
        print("Scanned data: $scanData");
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_cameraController == null) { 
      return Center(child: CircularProgressIndicator());
    } else if (!_cameraController!.value.isInitialized) {
      return Center(child: CircularProgressIndicator());
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: QRView(
        key: _qrKey,
        onQRViewCreated: _onQRViewCreated,
      ),
    );
  }
}
