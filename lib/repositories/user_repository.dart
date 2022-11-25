import 'dart:convert';
import 'dart:developer';
import '../models/user_model.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  Future<UserModel?> getUser(int id) async {
    log("Ambil data user");

    await Future.delayed(
      const Duration(seconds: 2),
    );

    try {
      String apiURL = "https://reqres.in/api/users/2";
      var response = await http.get(Uri.parse(apiURL));
      var jsonObject = jsonDecode(response.body);
      var data = (jsonObject as Map<String, dynamic>);
      if (response.statusCode == 200) {
        log(data.toString());
      }
      log("Data user berhasil diambil");
      return UserModel.fromJson(data['data']);
    } catch (e) {
      return null;
    }
  }
}
