import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:xiaomian/assets_code/xm_color.dart';
import 'package:xiaomian/component/network/xm_net_work.dart';
import 'package:xiaomian/component/xm_appbar.dart';
import 'package:xiaomian/component/xm_error.dart';
import 'package:xiaomian/component/xm_error_page.dart';
import 'package:xiaomian/component/xm_intl.dart';
import 'package:xiaomian/component/xm_loading.dart';

class WebPage extends StatefulWidget {
  final String title;
  final String url;
  const WebPage({super.key, required this.title, required this.url});

  @override
  State<WebPage> createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: XMAppBar.name(widget.title),
    body: FutureBuilder(future: loadURL(),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return xmLoading();
      } else if (snapshot.hasError) {
        if (XMNetwork().status == ConnectivityResult.none) {
          return XMErrorPage(error: const XMError(XMErrorType.networkNotAvailable), retry: () {
            setState(() {});
          },);
        }
        return XMErrorPage(error: XMError(XMErrorType.custom, customTitle: XMIntl.current.exceptionOccurred, customMessage: snapshot.error.toString()), retry: () {},);
      } else {
        return WebViewWidget(controller: snapshot.data!);
      }
     },),
  );
  }

  Future<WebViewController> loadURL() async {
    final controller = WebViewController();
    return controller.setJavaScriptMode(JavaScriptMode.unrestricted).then((value) {
      return controller.setBackgroundColor(XMColor.xmMain);
    }).then((value) {
      return controller.setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
          // Update loading bar.
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            return NavigationDecision.navigate;
          },
        )
      );
    }).then((value) => controller.loadRequest(Uri.parse(widget.url))).then((value) => controller);
  }
}