import 'package:flutter/material.dart';
import 'package:iimsapp/home.dart';
import 'package:iimsapp/insta_login.dart';
import 'package:iimsapp/my_args.dart';
import 'package:iimsapp/news_widget/us_business_news_list.dart';
import 'package:iimsapp/user_list_widget.dart';

Route<String>? generatedRoutes(RouteSettings settings) {
  // implement business logic here
  //print(settings.name)
  final ourArgs = settings.arguments;
  switch (settings.name) {
    case '/insta_login':
      return returnMaterialPageRoute(InstaLogin());

    case InstaHome.routeName:
      return returnMaterialPageRoute(InstaHome(
        myArguments: (ourArgs as MyArguments),
      ));

    case 'user-list':
      return returnMaterialPageRoute(CompanyUserListWidget());

      case 'news-list':
        return returnMaterialPageRoute(UsBusinessNewsListWidget());

    default:
      return returnMaterialPageRoute(InstaLogin());
  }
}

MaterialPageRoute<String> returnMaterialPageRoute(Widget dynamicPage) {
  return MaterialPageRoute(builder: (context) => dynamicPage);
}
