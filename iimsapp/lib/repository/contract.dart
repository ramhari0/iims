import 'package:iimsapp/models/company_user.dart';
import 'package:iimsapp/models/us_business_news.dart';

abstract class IMMSSCollegeContract {
  Future<List<CompanyUser>>? getStudentData();
  Future<UsBusinessNews>? getUsBusinessNews();
}
