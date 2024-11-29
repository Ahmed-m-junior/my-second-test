
import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:your_app/network/calender_response.dart';



typedef T Unmarshable<T>(Map<String, dynamic> json);
typedef String Marshable<T>(T object);

class Repository {
  BuildContext? context;
  final client = http.Client();
  static const encoder = JsonEncoder.withIndent("  ");

  String base = "https://api.aladhan.com/v1/calendarByCity/2023/10?city=Cairo&country=Egypt&method=2";

  void showAlert(BuildContext context, String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(msg),
    ));
  }
  Future<Response?> getRequest(
      {String? auth,
        String? path,
        Map<String, dynamic>? queryParameters}) async {
    debugPrintSynchronously("GET " + base + path!);{
      try {
        Dio dio = Dio();
        dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
          return handler.next(options); //continue
        }, onResponse: (response, handler) {
          print("response_data");
          print(response.data);
          return handler.next(response);
        }, onError: (DioError e, handler) {
          final r = e.response;
          if (r != null && r.statusCode == 401) {
            return handler.next(e);
          } else if (r != null && r.statusCode == 404) {
            return handler.next(e);
          }
          return handler.next(e);
        }));
        return dio.get(base + path, queryParameters: queryParameters);
        // return mResponse;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
  }
  Future<CalenderResponse?> getCalender() async {
    final completer = Completer<CalenderResponse?>();
    try {
      String path = "https://api.aladhan.com/v1/calendarByCity/2023/10?city=Cairo&country=Egypt&method=2";
      dynamic response = await getRequest(path: path);

      CalenderResponse calenderResponse = CalenderResponse.fromJson(response.data);
      completer.complete(calenderResponse);
    } catch (e) {
      completer.complete(null);
    }
    return completer.future;
  }
}