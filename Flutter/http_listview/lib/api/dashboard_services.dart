import 'package:http/http.dart' as http;
import '../app_constant/app_constant.dart';
import '../model/national_response.dart';

class DashBoardServices {
  getNationalityData() async {
    var response = await http.get(Uri.parse(AppConstant.baseUrl));
    if (response.statusCode == 200) {
      National national = nationalFromJson(response.body);
      return national.data;
    } else {
      return [];
    }
  }
}
