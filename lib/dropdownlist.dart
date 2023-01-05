import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:providerpractices/user_data_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'get_all_user.dart';
import 'next_page.dart';

class Dropdownlist extends StatefulWidget {
  const Dropdownlist({Key? key}) : super(key: key);

  @override
  State<Dropdownlist> createState() => _DropdownlistState();
}

class _DropdownlistState extends State<Dropdownlist> {
  GetAllUser? getAllUser;
  UserModel? _userModel;
  String dropdowncategory = "";
  TextEditingController _name = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _password = TextEditingController();
  Future<void> getAlluser({
    required BuildContext context,
  }) async {
    try {
      Map<String, dynamic> formdata = ({});
      final response = await Dio().get(
        'https://tinkubhaiya.provisioningtech.com/get_ajax/get_all_users/',
      );

      print("get  Api response data :- ");
      print(response.data);

      // getAllUser = GetAllUser.fromJson(response.data);
      setState(() {
        getAllUser = GetAllUser.fromJson(response.data);
      });
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  Future<void> loginUser({
    required BuildContext context,
  }) async {
    try {
      FormData formdata = new FormData.fromMap({
        'user_id': _name.text,
        'password': _pass.text,
      });
      final response = await Dio().post(
        'https://tinkubhaiya.provisioningtech.com/get_ajax/login/',
        data: formdata,
        options: Options(headers: {
          "Client-Service": "frontend-client",
          "Auth-Key": "simplerestapi",
        }),
      );

      print("login  Api response data :- ");
      print(response.data);
      _userModel = UserModel.fromJson(response.data);
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      String data = jsonEncode(_userModel);
      sharedPreferences.setString('token', _userModel!.token.toString());
      sharedPreferences.setString('id', _userModel!.id.toString());
      sharedPreferences.setString('type', _userModel!.type.toString());
      print(' token  ${sharedPreferences.getString('token')}');
      print('hello data ${data}');
      if (response.statusCode == 200) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NextPage()));
      } else {
        print('nonavigation');
      }
      // getAllUser = GetAllUser.fromJson(response.data);
    } on DioError catch (e) {
      print(e.toString());
    }
  }

  getdata() async {
    await getAlluser(context: context);
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
          ),
          Center(
            child: dropdowncategorybutton(),
          ),
          TextFormField(
            autocorrect: false,
            controller: _name,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.blue,
            ),
            decoration: InputDecoration(
              fillColor: Colors.grey.shade100,
              filled: true,
              hintText: 'User Name',
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
            controller: _pass,
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
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(20)),
                  textStyle: MaterialStateProperty.all(
                      const TextStyle(fontSize: 14, color: Colors.white))),
              onPressed: () async {
                await loginUser(context: context);
              },
              child: const Text('Login')),
        ],
      ),
    ));
  }

  Widget dropdowncategorybutton() {
    List<DropdownMenuItem<String>>? dropdownList = [];

    for (int i = 0; i < getAllUser!.users!.length; i++) {
      DropdownMenuItem<String> item = DropdownMenuItem<String>(
        child: Row(
          children: <Widget>[
            Text(getAllUser!.users![i].bRANCHNAME!),
          ],
        ),
        value: getAllUser!.users![i].bRANCHNAME!.toString(),
      );

      dropdownList.add(item);
    }

    return Container(
      height: 50,
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(
          //   color: Colors.grey.shade300,
          // ),
          color: Colors.grey),
      child: DropdownButton<String>(
        value: dropdowncategory.isEmpty ? null : dropdowncategory,
        isExpanded: true,
        underline: Container(),
        hint: const Text('Select categories'),
        icon: const Icon(
          Icons.arrow_drop_down_outlined,
        ),

        // Array list of items
        items: dropdownList,

        onChanged: (newValue) {
          setState(() {
            dropdowncategory = newValue!;
          });
        },
      ),
    );
  }
}
