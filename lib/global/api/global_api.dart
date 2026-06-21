import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:task_tracker_app/global/storage/golabal_storage.dart';

Duration _durationRto = const Duration(seconds: 60);
String _timeoutException = "408";
String _socketException = "Undocumented";
String _messageTimeout = "Mohon periksa koneksi internet Anda";
String _messageSocket = "Perangkat tidak terhubung dangan internet, Mohon periksa koneksi internet Anda";


Future checkConnectionGet({
  required String direktori,
  String? baseUrl,
}) async {
  String customBaseUrl = baseUrl ?? Storage.singleGetLoginModel!.baseUrl;
  Uri? url = Uri.parse("$customBaseUrl$direktori");

  Map<String, String> headers = {};

  // ignore: prefer_typing_uninitialized_variables
  var result;
  try {
    result = await http.get( 
      url,
      headers: headers
    ).timeout(_durationRto);
  } on TimeoutException {
    result = _timeoutException;
  } on SocketException {
    result = _socketException;
  } catch (e) {
    result = _timeoutException;
  }

  return result;
}

Future checkConnectionPost({
  required String direktori,
  required Map<String, dynamic> params,
}) async {
  Uri? url = Uri.parse("${Storage.singleGetLoginModel!.baseUrl}$direktori");

  Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  // ignore: prefer_typing_uninitialized_variables
  var result;
  try {
    result = await http.post(
      url,
      body: jsonEncode(params),
      headers: headers
    ).timeout(_durationRto);
  } on TimeoutException {
    result = _timeoutException;
  } on SocketException {
    result = _socketException;
  } catch (e) {
    result = _timeoutException;
  }

  return result;
}

Future checkConnectionPut({
  required String direktori,
  required Map<String, dynamic> params,
}) async {
  Uri? url = Uri.parse("${Storage.singleGetLoginModel!.baseUrl}$direktori");

  Map<String, String> headers = {
    "Content-Type": "application/json"
  };

  // ignore: prefer_typing_uninitialized_variables
  var result;
  try {
    result = await http.patch(
      url,
      body: jsonEncode(params),
      headers: headers
    ).timeout(_durationRto);
  } on TimeoutException {
    result = _timeoutException;
  } on SocketException {
    result = _socketException;
  } catch (e) {
    result = _timeoutException;
  }

  return result;
}

Future checkConnectionDelete({
  required String direktori,
}) async {
  Uri? url = Uri.parse("${Storage.singleGetLoginModel!.baseUrl}$direktori");

  Map<String, String> headers = {};

  // ignore: prefer_typing_uninitialized_variables
  var result;
  try {
    result = await http.delete(
      url,
      headers: headers
    ).timeout(_durationRto);
  } on TimeoutException {
    result = _timeoutException;
  } on SocketException {
    result = _socketException;
  } catch (e) {
    result = _timeoutException;
  }

  return result;
}

/// - error -> (message, isLoading, isError, isEmpty)
/// - success -> (message, isLoading, isError, isEmpty)
Future checkController({
  required var result,
  required Function(String message, bool isLoading, int statusCode) error,
  required Future Function(String message, bool isLoading, int statusCode)
  success,
}) async {
  // http.Response response = await result;
  if (result == _timeoutException) {
    error(_messageTimeout, false, 504);
  }else if (result == _socketException) {
    error(_messageSocket, false, 408);
  } else if (result.statusCode == 200) {
    await success("success", false, 200);
  } else if (result.statusCode == 201) {
    await success("success", false, 201);
  } else {
    error("500 Internal Server Error", false, 500);
  } 
}

abstract class VariabelController {
  RxString message = "".obs;
  RxBool isLoading = true.obs;
  RxInt statusCode = 0.obs;
  dynamic result;
  void refreshVariabel();
}

class InitVariabelController {
  String message = "";
  bool isLoading = true;
  int statusCode = 0;
  dynamic result;
  void refreshVariabel() {}
}