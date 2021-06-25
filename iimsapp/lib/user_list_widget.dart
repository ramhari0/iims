import 'package:flutter/material.dart';
import 'package:iimsapp/models/company_user.dart';
import 'package:iimsapp/repository/imms_data_impl.dart';

class CompanyUserListWidget extends StatefulWidget {
  const CompanyUserListWidget({Key? key}) : super(key: key);

  @override
  _CompanyUserListWidgetState createState() => _CompanyUserListWidgetState();
}

class _CompanyUserListWidgetState extends State<CompanyUserListWidget> {
  /*Future<List<CompanyUser>> fetchCompanyUser() async {
    List<CompanyUser> companyUserList = [];
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));

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
  }*/

  IIMSDataImpl iimsDataImpl = IIMSDataImpl.inst;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<List<CompanyUser>>(
            future: iimsDataImpl.getStudentData(),
            builder: (context, snapShot) {
              if ((snapShot.data == null)) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapShot.hasData) {
                print(snapShot.data!.length.toString());
                List<CompanyUser> userList = [];
                if (snapShot.data != null) {
                  userList.addAll(snapShot.data!);
                }

                return userList.isEmpty
                    ? Center(
                        child: Text("NO COMPANY USER YET"),
                      )
                    : Center(
                        child: Container(
                          //height: 200,
                          width: 500,
                          child: ListView.builder(
                              itemCount: userList.length,
                              itemBuilder: (context, index) {
                                final CompanyUser? singleUser = userList[index];
                                return Center(
                                  child: Container(
                                      height: 50,
                                      width: 100,
                                      child: Text(singleUser!.name!)),
                                );
                              }),
                        ),
                      );
              }
              return Text("NO User data");
            }),
      ),
    );
  }
}
