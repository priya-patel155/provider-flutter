import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providerpractices/utils/DataUtils.dart';
import 'package:providerpractices/utils/employeeprovider.dart';

import 'dataModel.dart';

class EmployeeList extends StatefulWidget {
  const EmployeeList({Key? key}) : super(key: key);

  @override
  State<EmployeeList> createState() => _EmployeeListState();
}

class _EmployeeListState extends State<EmployeeList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EmployeeProvider>(context, listen: false)
          .EmpList(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<EmployeeProvider>(
      builder: (context, provider, child) {
        List<PracticeModel>? employeelist = [];
        employeelist = provider.employeedatalist;
        print('lengthhhhhh ${employeelist!.length}');
        return Scaffold(
          appBar: AppBar(
            title: Text('Provider Api Practices'),
          ),
          body: employeelist.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: employeelist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Text('${employeelist![index].id}'),
                      title: Text('${employeelist[index].title}'),
                    );
                  }),
        );
      },
    );
  }
}
