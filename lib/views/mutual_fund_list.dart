import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/mutual_fund_model.dart';
import '../utils/employeeprovider.dart';
import 'mutual_fund_details.dart';

class MutualFundList extends StatefulWidget {
  const MutualFundList({Key? key}) : super(key: key);

  @override
  State<MutualFundList> createState() => _MutualFundListState();
}

class _MutualFundListState extends State<MutualFundList> {
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EmployeeProvider>(context, listen: false)
          .MutalFundListApi(context: context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mutual Fund'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Consumer<EmployeeProvider>(builder: (context, provider, child) {
              List<MutualFundModel>? fundlist = [];
              fundlist = provider.mutualFundModelList;
              print('lengthhhhhh ${fundlist!.length}');
              return Expanded(
                child: ListView.builder(
                    itemCount: provider.mutualFundModelList!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      '${provider.mutualFundModelList![index].schemeName}'),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                      '${provider.mutualFundModelList![index].schemeCode}'),
                                ],
                              ),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.shade300,
                                  blurRadius: 5.0, // soften the shadow
                                  spreadRadius: 5.0, //extend the shadow
                                  offset: Offset(
                                    4.0, // Move to right 5  horizontally
                                    4.0, // Move to bottom 5 Vertically
                                  ),
                                )
                              ], color: Colors.white),
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MutuaFundDetails(
                                          Schemacode: provider
                                              .mutualFundModelList![index]
                                              .schemeCode)));
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      );
                    }),
              );
            })
          ],
        ),
      ),
    );
  }
}
