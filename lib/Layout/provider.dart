import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
//import 'package:http/http.dart' as http;
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:new_app/models/model_new.dart';

class News with ChangeNotifier {
  String apiKey = '68fb6b143cee457e955a470e47d92d5d';
  String baseUri = 'https://newsapi.org/v2';
  List<ModelNew> newModel = [];
  getData() async {
    Response response = await http
        .get(Uri.parse('$baseUri/everything?q=bitcoin&apiKey=$apiKey'));
    var responseBody = jsonDecode(response.body);
    if (responseBody['status'] == 'ok') {
      for (var element in responseBody['articles']) {
        newModel.add(ModelNew.formJson(data: element));
      }
      notifyListeners();
    } else {
      log(responseBody['message']);
      //test1
    }
  }
}
