import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:eco_market_app/features/main/presentation/pages/network/no_connection_page.dart';
import 'package:flutter/material.dart';

class NetworkStatusWrapper extends StatefulWidget {
  final Widget wrappedChild;
  final bool? isAppFirstLaunch;

  const NetworkStatusWrapper({
    super.key,
    required this.wrappedChild,
    this.isAppFirstLaunch = false,
  });

  @override
  State<NetworkStatusWrapper> createState() => _NetworkStatusWrapperState();
}
 
class _NetworkStatusWrapperState extends State<NetworkStatusWrapper> {
  StreamSubscription<ConnectivityResult>? connectionSubscription;
  bool isInternetConnected = true;

  @override
  void initState() {
    super.initState();
    checkInternetConnection();
  }

  @override
  void dispose() {
    connectionSubscription?.cancel();
    super.dispose();
  }

  Future<void> checkInternetConnection() async {
    connectionSubscription = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        if (result == ConnectivityResult.none) {
          setState(
            () {
              isInternetConnected = false;
            },
          );
        } else {
          setState(
            () {
              isInternetConnected = true;
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return isInternetConnected ? widget.wrappedChild : const NoConnectionPage();
  }
}
