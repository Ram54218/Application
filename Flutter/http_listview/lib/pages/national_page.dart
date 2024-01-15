import 'package:flutter/material.dart';
import 'package:my_flutter/api/dashboard_services.dart';
import '../model/national_response.dart';

class NationalPage extends StatefulWidget {
  const NationalPage({super.key});

  @override
  State<NationalPage> createState() => _NationalPageState();
}

class _NationalPageState extends State<NationalPage> {
  List<Datum> nationalityList = [];
  DashBoardServices dashBoardServices = DashBoardServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNationality();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DashBoard")),
      body: homeWidget(context),
    );
  }

  homeWidget(BuildContext context) {
    return (nationalityList.isNotEmpty
        ? ListView.builder(
            itemCount: nationalityList.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Text(nationalityList[index].id.toString()),
                  Text(nationalityList[index].firstName),
                  Text(nationalityList[index].lastName),
                ],
              );
            })
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                ),
                Text("loading......"),
              ],
            ),
          ));
  }

  getNationality() async {
    nationalityList = await dashBoardServices.getNationalityData();
    setState(() {});
  }
}
