import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:userinfo/feature/user_info/model/photo_model.dart';
import 'package:userinfo/feature/user_info/model/user_model.dart';

class UserInfoService  {

  Future<List<User?>?> getUsers() async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.https('jsonplaceholder.typicode.com', '/users'),);
     // log(response.body);
      List<dynamic> jsonList = json.decode(response.body);
      return jsonList.map((json) => User.fromJson(json)).toList();

    } finally {
      client.close();
    }
  }

  Future<Photo?> getUserPhoto(int? id) async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.https('picsum.photos', '/id/${id}/info'),);
     //log(response.body);
      return Photo.fromJson(json.decode(response.body));

    } finally {
      client.close();
    }
  }

}
