import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dio/dio.dart' as dio_service;

class DioServices {
  Dio dio = Dio();
  Future<dynamic> getMethode(String url) async {
    dio.options.headers["content-type"] = 'application/json;';
    return await dio
        .get(
      url,
      options: Options(responseType: ResponseType.json, method: 'Get'),
    )
        .then((response) {
      log(response.toString());
      return response;
    });
  }

  Future<dynamic> PostMethod(Map<String, dynamic> map, String url) async {
    dio.options.headers["content-type"] = 'application/json;';

    //TODO read token from stroge
    return await dio
        .post(
      url,
      data: dio_service.FormData.fromMap(
          map), //map tabdil be from_data zamini ke aks ,fil ersal server
      // data: map, No bec =>form_data
      options: Options(responseType: ResponseType.json, method: 'POST'),
    )
        .then((value) {
      log(value.headers.toString());
      log(value.data.toString());
      log(value.statusCode.toString());
      return value;
    });
  }
}
