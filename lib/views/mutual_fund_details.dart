import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../models/mutual_fund_details_model.dart';
import '../models/mutual_fund_model.dart';
import '../utils/employeeprovider.dart';

class MutuaFundDetails extends StatefulWidget {
  final int? Schemacode;
  MutuaFundDetails({Key? key, this.Schemacode}) : super(key: key);

  @override
  State<MutuaFundDetails> createState() => _MutuaFundDetailsState();
}

class _MutuaFundDetailsState extends State<MutuaFundDetails> {
  late TrackballBehavior _trackballBehavior;

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    _trackballBehavior = TrackballBehavior(
        enable: true, activationMode: ActivationMode.singleTap);
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<EmployeeProvider>(context, listen: false)
          .MutalFundLDetailsApi(
              context: context, schemaCode: widget.Schemacode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Consumer<EmployeeProvider>(builder: (context, provider, child) {
                MutualFundDetailsModel? FundDetailsModel;
                FundDetailsModel = provider.mutualFundDetailsModel;

                List<Data> fundlist = <Data>[];
                FundDetailsModel!.data!.forEach((element) {
                  fundlist.add(element);
                });
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${provider.mutualFundDetailsModel!.meta!.schemeName}',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),

                    // SfCartesianChart(
                    //   title: ChartTitle(text: 'AAPL - 2016'),
                    //   legend: Legend(isVisible: true),
                    //   trackballBehavior: _trackballBehavior,
                    //   series: <CandleSeries>[
                    //     CandleSeries<Data, DateTime>(
                    //         dataSource: fundlist,
                    //         name: 'AAPL',
                    //         xValueMapper: (Data sales, _) => sales.date,
                    //         lowValueMapper: (Data sales, _) => sales.nav,
                    //
                    //   ],
                    //
                    // )
                  ],
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
