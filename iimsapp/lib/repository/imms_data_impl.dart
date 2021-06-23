import 'package:iimsapp/models/company_user.dart';
import 'package:iimsapp/models/us_business_news.dart';
import 'package:iimsapp/repository/datasource.dart';
import 'contract.dart';
import 'package:http/http.dart' as http;

class IIMSDataImpl implements IMMSSCollegeContract {
  late IIMSDataSource iimsDataSource;

  IIMSDataImpl() : iimsDataSource = IIMSDataSource(httpClient: http.Client());

  @override
  Future<List<CompanyUser>>? getStudentData() {
    return iimsDataSource.fetchStudentDataFetch();
  }

  @override
  Future<UsBusinessNews>? getUsBusinessNews() {
    return iimsDataSource.fetchUsBusinessNews();
  }

}
