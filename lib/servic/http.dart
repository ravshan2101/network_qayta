import 'dart:convert';

import 'package:http/http.dart';

import 'model/post.dart';

class Network {
  // Domen qismi

  static String Base = "jsonplaceholder.typicode.com";

  // headr qismi

  static Map<String, String> headr = {
    'Content-type': 'application/json; charset=UTF-8'
  };

  // Http apis
  static String API_list = '/posts';
  static String API_create = '/posts';
  static String API_update = '/posts/1';
  static String API_del = '/posts/1';

  // Http request

  static Future<String?> GET(String api, Map<String, String> params) async {
    var uri = Uri.https(Base, api, params);
    var response = await get(uri, headers: headr);
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  static Future<String?> POST(String api, Map<String, String> params) async {
    var uri = Uri.https(
      Base,
      api,
    );
    var response = await post(uri, headers: headr, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }

    return null;
  }

  static Future<String?> PUT(String api, Map<String, String> params) async {
    var uri = Uri.https(Base, api);
    var response = await put(uri, headers: headr, body: jsonEncode(params));
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  static Future<String?> DEL(String api, Map<String, String> params) async {
    var uri = Uri.https(Base, api, params);
    var response = await delete(uri, headers: headr);
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }

  // Http params

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = {};
    return params;
  }

  static Map<String, String> paramsCreate(Post post) {
    Map<String, String> params = {};
    params.addAll({
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString()
    });
    return params;
  }

  static Map<String, String> paramsUpdata(Post post) {
    Map<String, String> params = {};
    params.addAll({
      "id": post.id.toString(),
      'title': post.title!,
      'body': post.body!,
      'userId': post.userId.toString()
    });
    return params;
  }
}
