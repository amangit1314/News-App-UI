import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/screens/articles/articles_details.dart';
import 'package:news_app/services/api_service.dart';
import 'package:news_app/widgets/my_drawer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
      currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        title: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Builder(
            builder: (context) => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/drawer.svg",
                    height: 15,
                    width: 34,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
                Text(
                  'NewsWare',
                  style: TextStyle(color: Colors.black),
                ),
                IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/search.svg",
                    height: 15,
                    width: 34,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        elevation: 0,
        centerTitle: false,
        titleSpacing: 0,
      ),
      drawer: MyDrawer(),
      body: FutureBuilder(
        future: ApiService.getArticles(),
        builder: (BuildContext context, AsyncSnapshot<List<Article>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return customListTile(
                  context: context,
                  article: snapshot.data![index],
                );
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
