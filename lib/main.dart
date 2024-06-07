import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';
void main() {
  runApp(const WebViewPlusExample());
}

class WebViewPlusExample extends StatelessWidget {
  const WebViewPlusExample({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late WebViewController _controler;

  @override
  void initState() {
   /* _controler = WebViewController()
    ..platform.setOnPlatformPermissionRequest((onPermissionRequest){
      _requestCameraPermission(onPermissionRequest);
    })
    ..loadRequest(Uri.parse('https://webcamtests.com'))
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {
          },
        ),
      ); */
    super.initState();
  }

  double _height = 1000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('webview_flutter_plus Example'),
      ),
      body: ListView(
        children: [
          Text("Height of WebviewPlus: $_height",
              style: const TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(
            height: _height,
            child:
           // WebViewWidget(controller: _controler,),
            WebView(
              initialUrl: 'https://webcamtests.com',
            )
          ),
          const Text("End of WebviewPlus",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

  }

  Future<void> _requestCameraPermission(
     // PlatformWebViewPermissionRequest? onPermissionRequest
      ) async {
    PermissionStatus status = await Permission.camera.status;
    if (status.isGranted) {
      // Permiso ya concedido
      print('Permiso de cámara ya estaba concedido concedido');
    //  onPermissionRequest!.grant();
    } else if (status.isDenied || status.isPermanentlyDenied) {
      // Solicita el permiso
      status = await Permission.camera.request();
      if (status.isGranted) {
        // Permiso concedido
        print('Permiso de cámara concedido');
     //   onPermissionRequest!.grant();
      } else {
        // Permiso denegado permanentemente, redirige a la configuración
      //  GoRouter.of(context).pushReplacement('/go-to-config',extra: GoToConfigPage());
      }
    }
  }
}

