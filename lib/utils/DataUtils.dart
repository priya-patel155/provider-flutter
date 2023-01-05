import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../dataModel.dart';

class DataUtils {
  List<PracticeModel> employeelist = [];
  Future Employelist(BuildContext context) async {
    try {
      final response =
          await Dio().get('https://jsonplaceholder.typicode.com/posts');

      if (response.statusCode == 200) {
        for (int i = 0; i < employeelist.length; i++) {
          employeelist.add(PracticeModel.fromJson(response.data));
        }
      } else {
        print('error');
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.message)));
    }
  }
}
