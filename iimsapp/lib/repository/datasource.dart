import 'dart:convert';
import 'package:iimsapp/models/company_user.dart';
import 'package:http/http.dart' as http;
import 'package:iimsapp/models/us_business_news.dart';

class IIMSDataSource {
  late final http.Client httpClient;
  final String baseNewsUrl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=635860d8efa247f385183d0f459d268e";

  IIMSDataSource({required this.httpClient});

  //here we do all the http calls
  Future<List<CompanyUser>>? fetchStudentDataFetch() async {
    List<CompanyUser> companyUserList = [];
    var response = await httpClient
        .get(Uri.https("jsonplaceholder.typicode.com", "users"));

    if (response.statusCode == 200) {
      //decoding the json from the https call
      List userList = jsonDecode(response.body);

      userList.forEach((userJson) {
        CompanyUser _companyUser =
            CompanyUser.fromJson(userJson as Map<String, dynamic>);

        companyUserList.add(_companyUser);
      });
      //print(companyUserList.length.toString());
      return companyUserList;
    }
    return [];
  }

  Future<UsBusinessNews>? fetchUsBusinessNews() async {
    final http.Response response = await httpClient.get(Uri.parse(baseNewsUrl));

    final Map<String, dynamic> newsResponseMap = jsonDecode(response.body);

    final UsBusinessNews usBusinessNews =
        UsBusinessNews.fromJson(newsResponseMap);

    return usBusinessNews;
  }
}
