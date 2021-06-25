import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iimsapp/models/us_business_news.dart';
import 'package:iimsapp/repository/imms_data_impl.dart';

class UsBusinessNewsListWidget extends StatefulWidget {
  @override
  _UsBusinessNewsListWidgetState createState() =>
      _UsBusinessNewsListWidgetState();
}

class _UsBusinessNewsListWidgetState extends State<UsBusinessNewsListWidget> {
  late IIMSDataImpl _iimsDataImpl;
  UsBusinessNews? usBusinessNews;

  @override
  void initState() {
    _iimsDataImpl = IIMSDataImpl.inst;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        child: FutureBuilder<UsBusinessNews>(
            future: _iimsDataImpl.getUsBusinessNews(),
            builder: (context, snapShot) {
              if ((snapShot.data == null)) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapShot.hasData) {
                if (snapShot.data != null) {
                  usBusinessNews = snapShot.data;
                }

                return usBusinessNews!.articles!.isEmpty
                    ? Center(
                        child: Text("NO COMPANY USER YET"),
                      )
                    : Center(
                        child: Container(
                          //height: 200,
                          width: 500,
                          child: ListView.builder(
                              itemCount: usBusinessNews!.articles!.length,
                              itemBuilder: (context, index) {
                                final Articles article =
                                    usBusinessNews!.articles![index];
                                return Center(
                                  child: NewsCard(
                                    article: article,
                                  ),
                                );
                              }),
                        ),
                      );
              }
              return Text("NO News data");
            }),
      ),
    );
  }
}

class NewsCard extends StatelessWidget {
  final Articles article;

  NewsCard({required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 100,
      child: Card(
        child: Row(
          children: [
            article.urlToImage != null
                ? Image.network(
                    article.urlToImage!,
                    width: 90,
                    height: 90,
                  )
                : Container(
                    width: 50,
                    height: 50,
                    color: Colors.grey,
                  ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              children: [
                Text(
                  article.title!,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  article.description != null ? article.description! : "N/A",
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
