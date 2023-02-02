import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helpers {
  static void _toastMessage(String message) {
    Fluttertoast.showToast(msg: message, backgroundColor: Colors.redAccent);
  }

  static void errorHandler(Object e) {
    if (e is DioError) {
      if (e.response?.statusCode == 401) {
        _toastMessage(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        _toastMessage('Connection Timeout');
      } else if (e.type == DioErrorType.receiveTimeout) {
        _toastMessage('Receive Timeout');
      } else if (e.type == DioErrorType.cancel) {
        _toastMessage('Cancelled');
      } else if (e.type == DioErrorType.sendTimeout) {
        _toastMessage('Send Timeout');
      } else if (e.type == DioErrorType.response) {
        _toastMessage('No Response');
      } else if (e.error is SocketException) {
        _toastMessage('No Internet Connection');
      } else if (e.type == DioErrorType.other) {
        _toastMessage('Something went Wrong');
      }
    }
  }

  static const String homeUrl = 'https://jsonplaceholder.typicode.com/posts';
  static const Color whiteColor = Colors.black;
  static final Color tileColor = Colors.blueGrey[200]!;
}
