import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:providerpractices/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NextPage extends StatefulWidget {
  const NextPage({Key? key}) : super(key: key);

  @override
  State<NextPage> createState() => _NextPageState();
}

class _NextPageState extends State<NextPage> {
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  UserModel? _userModel;
  String? userid;
  String? account;
  int? type;
  SharedPreferences? sharedPreferences;
  Future<void> AddUser({
    required BuildContext context,
  }) async {
    try {
      print('hello flutter');
      String? token = sharedPreferences!.getString('token');
      String? id = sharedPreferences!.getString('token');
      String? type = sharedPreferences!.getString('type');
      print('tokennext ${token}');
      FormData data = new FormData.fromMap({
        'name': _username.text,
        'phone': _phone.text,
        'password': _password.text,
      });
      final response = await Dio().post(
        'https://tinkubhaiya.provisioningtech.com/post_ajax/add_account/',
        data: data,
        options: Options(headers: {
          "User-ID": id,
          "Authorization": token,
          "type": type,
          "Client-Service": "frontend-client",
          "Auth-Key": "simplerestapi"
        }),
      );

      print("login  Api response data :- ");
      print(response.data);

      _userModel = UserModel.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  // getdata() async {
  //   SharedPreferences shared = await SharedPreferences.getInstance();
  //   Map<String, dynamic> data = jsonDecode(shared.getString('register')!);
  //   var user = UserModel.fromJson(data);
  //   setState(() {
  //     token = user.token;
  //     userid = user.id;
  //     type = user.type;
  //   });
  // }

  String? token;
  @override
  void initState() {
    super.initState();

    // getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 50),
          TextFormField(
            autocorrect: false,
            controller: _username,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: 'Name',
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            autocorrect: false,
            controller: _phone,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: 'Phone',
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            autocorrect: false,
            controller: _password,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: 'password',
              hintStyle: TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                  fontWeight: FontWeight.w400),
              contentPadding: EdgeInsets.all(16),
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () async {
                await AddUser(context: context);
              },
              child: const Text('Add')),
        ],
      ),
    );
  }
}
