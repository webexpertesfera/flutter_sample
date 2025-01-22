import 'dart:collection';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_sample/constants/export.dart';
import 'package:url_launcher/url_launcher.dart';

class InAppWebViewExampleScreen extends StatefulWidget {
  String? url;
  String? title;

  InAppWebViewExampleScreen({this.url,this.title});

  @override
  _InAppWebViewExampleScreenState createState() => _InAppWebViewExampleScreenState();
}

class _InAppWebViewExampleScreenState extends State<InAppWebViewExampleScreen> {
  final GlobalKey webViewKey = GlobalKey();

  InAppWebViewController? webViewController;
  InAppWebViewSettings settings = InAppWebViewSettings(
      isInspectable: kDebugMode,
      mediaPlaybackRequiresUserGesture: false,
      allowsInlineMediaPlayback: true,
      iframeAllow: "camera; microphone",
      iframeAllowFullscreen: true);

  PullToRefreshController? pullToRefreshController;

  late ContextMenu contextMenu;
  String url = "";
  double progress = 0;
  final urlController = TextEditingController();

  @override
  void initState() {
    super.initState();

    contextMenu = ContextMenu(
        menuItems: [
          ContextMenuItem(
              id: 1,
              title: "Special",
              action: () async {
                print("Menu item Special clicked!");
                print(await webViewController?.getSelectedText());
                await webViewController?.clearFocus();
              })
        ],
        settings: ContextMenuSettings(hideDefaultSystemContextMenuItems: false),
        onCreateContextMenu: (hitTestResult) async {
          print("onCreateContextMenu");
          print(hitTestResult.extra);
          print(await webViewController?.getSelectedText());
        },
        onHideContextMenu: () {
          print("onHideContextMenu");
        },

        onContextMenuActionItemClicked: (contextMenuItemClicked) async {
          var id = contextMenuItemClicked.id;
          print("onContextMenuActionItemClicked: " + id.toString() + " " + contextMenuItemClicked.title);
        });

    pullToRefreshController = kIsWeb || ![TargetPlatform.iOS, TargetPlatform.android].contains(defaultTargetPlatform)
        ? null
        : PullToRefreshController(
            settings: PullToRefreshSettings(
              color: Colors.blue,
            ),
            onRefresh: () async {
              if (defaultTargetPlatform == TargetPlatform.android) {
                webViewController?.reload();
              } else if (defaultTargetPlatform == TargetPlatform.iOS || defaultTargetPlatform == TargetPlatform.macOS) {
                webViewController?.loadUrl(urlRequest: URLRequest(url: await webViewController?.getUrl()));
              }
            },
          );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: widget.title??"",
        ),
        body: SafeArea(
            child: Column(children: <Widget>[
          Expanded(
            child: Stack(
              children: [
                InAppWebView(
                  key: webViewKey,
                  // webViewEnvironment: webViewEnvironment,
                  initialUrlRequest: URLRequest(url: WebUri(widget.url ?? 'https://google.com')),
                  // initialUrlRequest:
                  // URLRequest(url: WebUri(Uri.base.toString().replaceFirst("/#/", "/") + 'page.html')),
                  // initialFile: "assets/index.html",
                  initialUserScripts: UnmodifiableListView<UserScript>([]),
                  initialSettings: settings,
                  contextMenu: contextMenu,
                  pullToRefreshController: pullToRefreshController,
                  onWebViewCreated: (controller) async {
                    webViewController = controller;
                  },
                  onLoadStart: (controller, url) async {
                    setState(() {

                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  onPermissionRequest: (controller, request) async {
                    return PermissionResponse(resources: request.resources, action: PermissionResponseAction.GRANT);
                  },
                  shouldOverrideUrlLoading: (controller, navigationAction) async {
                    var uri = navigationAction.request.url!;

                    if (!["http", "https", "file", "chrome", "data", "javascript", "about"].contains(uri.scheme)) {
                      if (await canLaunchUrl(uri)) {
                        // Launch the App
                        await launchUrl(
                          uri,
                        );
                        // and cancel the request
                        return NavigationActionPolicy.CANCEL;
                      }
                    }

                    return NavigationActionPolicy.ALLOW;
                  },
                  onLoadStop: (controller, url) async {
                    if (url.toString().contains("/paypal/success") || url.toString().contains("/binancepay/success")||  url.toString().contains("/nowpayment/success")) {
                      if (Get.isRegistered<MainController>()) {
                        Get.delete<MainController>();
                      }
                      if (Get.isRegistered<HomeController>()) {
                        Get.delete<HomeController>();
                      }
                      Get.offAllNamed(AppRoutes.mainScreen);
                      showSnackBar("Purchased Successfully");
                    }else if(url.toString().contains("paypal/cancel")||url.toString().contains("nowpayment/cancel")||url.toString().contains("nowpayment/subscription/cancel")||url.toString().contains("paypal/subscription/cancel")){
                      Get.back();
                      showErrorSnackBar(AppStrings.paymentFailed.tr);
                    }else if(url.toString().contains("paypal/subscription/success")||url.toString().contains("nowpayment/subscription/success")){
                      Get.back(result: true);
                      showSnackBar("Payment Successful");

                    }
                    pullToRefreshController?.endRefreshing();
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  onReceivedError: (controller, request, error) {
                    pullToRefreshController?.endRefreshing();
                  },
                  onProgressChanged: (controller, progress) {
                    if (progress == 100) {
                      pullToRefreshController?.endRefreshing();
                    }
                    setState(() {
                      this.progress = progress / 100;
                      urlController.text = this.url;
                    });
                  },
                  onUpdateVisitedHistory: (controller, url, isReload) {
                    setState(() {
                      this.url = url.toString();
                      urlController.text = this.url;
                    });
                  },
                  onConsoleMessage: (controller, consoleMessage) {
                    print(consoleMessage);
                  },onTitleChanged: (controller, title) {
                    widget.title=title;
                  },
                ),
                progress < 1.0 ? LinearProgressIndicator(value: progress) : Container(),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                child: Icon(Icons.arrow_back),
                onPressed: () {
                  webViewController?.goBack();
                },
              ),
              ElevatedButton(
                child: Icon(Icons.arrow_forward),
                onPressed: () {
                  webViewController?.goForward();
                },
              ),
              ElevatedButton(
                child: Icon(Icons.refresh),
                onPressed: () {
                  webViewController?.reload();
                },
              ),
            ],
          ),
        ])));
  }
}
