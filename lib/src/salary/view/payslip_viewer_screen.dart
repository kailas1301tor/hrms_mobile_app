import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hrms_mobile/res/styles/color_palette.dart';
import 'package:hrms_mobile/res/styles/fonts/plus_jakarta_sans_font_palette.dart';
import 'package:hrms_mobile/src/salary/notifier/staff_salary_notifier.dart';
import 'package:pdfx/pdfx.dart';
import 'package:toastification/toastification.dart';

class PayslipViewerScreen extends ConsumerStatefulWidget {
  final String filePath;
  final String fileName;

  const PayslipViewerScreen({
    super.key,
    required this.filePath,
    required this.fileName,
  });

  @override
  ConsumerState<PayslipViewerScreen> createState() =>
      _PayslipViewerScreenState();
}

class _PayslipViewerScreenState extends ConsumerState<PayslipViewerScreen> {
  late PdfController _pdfController;

  @override
  void initState() {
    super.initState();
    _pdfController = PdfController(
      document: PdfDocument.openFile(widget.filePath),
    );
  }

  @override
  void dispose() {
    _pdfController.dispose();
    super.dispose();
  }

  Future<void> _downloadFile() async {
    final result = await ref
        .read(staffSalaryProvider.notifier)
        .saveFileToDevice(widget.filePath, widget.fileName);

    if (mounted) {
      if (result != null) {
        toastification.show(
          context: context,
          title: Text('Download Complete'),
          description: Text('Payslip saved to $result'),
          type: ToastificationType.success,
          autoCloseDuration: const Duration(seconds: 3),
        );
      } else {
        toastification.show(
          context: context,
          title: Text('Download Failed'),
          description: Text('Unable to save file'),
          type: ToastificationType.error,
          autoCloseDuration: const Duration(seconds: 3),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text(
          widget.fileName,
          style: PlusJakartaSansFontPalette.f0E0F0C_16_600,
        ),
      ),
      body: SafeArea(child: PdfView(controller: _pdfController)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _downloadFile,
        backgroundColor: ColorPalette.primaryColor,
        icon: const Icon(Icons.download_rounded, color: Colors.white),
        label: Text(
          "Download PDF",
          style: PlusJakartaSansFontPalette.fWhite_14_600,
        ),
      ),
    );
  }
}
