import 'package:crafty_bay/app/set_up_network_caller.dart';
import 'package:crafty_bay/features/auth/data/models/sing_up_params.dart';
import 'package:flutter/cupertino.dart';

import '../../../app/urls.dart';
import '../../../core/services/network_caller.dart';

class SingUpProvider extends ChangeNotifier {
  bool _isSingUpInProgress = false;

  bool get isSingUpInProgress => _isSingUpInProgress;
  String? _errorMessage;
  String? get errorMessage => _errorMessage;



  Future<bool> singUp(SingUpParams params) async {


    bool isSucess = false;
    _isSingUpInProgress =true;
    notifyListeners();

    final NetworkResponse response = await getNetworkCaller().postRequest(
        url: Urls.SingUpUrl,
    body: params.toJeson(),
    );
    if (response.isSuccess) {
      isSucess = true;
      _errorMessage = null;
      
    }else{
      _errorMessage = response.errorMessage;

    }
    _isSingUpInProgress = false;
    notifyListeners();
    return isSucess;
  }

}