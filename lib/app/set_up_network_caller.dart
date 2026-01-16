import 'package:crafty_bay/core/services/network_caller.dart';

NetworkCaller getNetworkCaller() {
  NetworkCaller networkCaller = NetworkCaller(
    headers: {"content-type": "Applecation/json", "token": "token"},

    onUnAuthorized: () {
      //move to login screen
    },
  );
  return networkCaller;
}
