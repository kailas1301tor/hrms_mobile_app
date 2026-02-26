import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../res/styles/color_palette.dart';
import '../../../res/styles/fonts/plus_jakarta_sans_font_palette.dart';

class WebViewScreen extends StatefulWidget {
  final String title;
  final String url;

  const WebViewScreen({super.key, required this.title, required this.url});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController _controller;
  bool _isLoading = true;
  bool _isPopping = false;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            if (progress == 100 && mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  void _handleBack() {
    setState(() {
      _isPopping = true;
    });
    Future.delayed(const Duration(milliseconds: 10), () {
      if (mounted) {
        Navigator.pop(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _handleBack();
      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: _handleBack,
          ),
          titleSpacing: 0,
          title: Text(
            widget.title,
            style: TextStyle(
              color: ColorPalette.loginBackground,
              fontFamily: PlusJakartaSansFontPalette.plusJakartaSansFamily,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: ColorPalette.white,
          elevation: 1,
          iconTheme: const IconThemeData(color: ColorPalette.loginBackground),
        ),
        backgroundColor: ColorPalette.white,
        body: _isPopping
            ? const SizedBox.shrink()
            : Stack(
                children: [
                  WebViewWidget(controller: _controller),
                  if (_isLoading)
                    const Center(
                      child: CircularProgressIndicator(
                        color: ColorPalette.primaryColor,
                      ),
                    ),
                ],
              ),
      ),
    );
  }
}
