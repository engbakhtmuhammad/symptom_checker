import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp/Screens/Bio/bio_screen.dart';
import 'package:fyp/Screens/services/news.dart';
import 'package:fyp/Screens/Home/article_view.dart';
import 'package:fyp/constants.dart';

//f7d54802ae9d4e2eb6b90d6e456b63ee

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _loading;
  var newslist;

  void getNews() async {
    News news = News();
    await news.getNews();
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  void initState() {
    _loading = true;
    // TODO: implement initState
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: _loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => BioScreen())),
                      child: Container(
                        width: size.width,
                        height: size.height * .125,
                        decoration: BoxDecoration(
                            color: kBackgroundColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(35),
                                bottomRight: Radius.circular(35))),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40, top: 10),
                                  child: Text(
                                    "How You Feel!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                ),
                                SizedBox(
                                    width: size.width / 1.5,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 40,
                                      ),
                                      child: Text(
                                        "Tap here to check your symptom before it become worse",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400,
                                            fontSize: 15),
                                      ),
                                    ))
                              ],
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                right: 30,
                              ),
                              child: Image.asset("assets/images/fever.png"),
                            )
                          ],
                        ),
                        // child: RoundedButton(
                        //     text: 'Check Symptoms',
                        //     press: () {
                        //       Navigator.push(context, MaterialPageRoute(builder: (context) {
                        //         return BioScreen();
                        //       }));
                        //     }),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 16),
                      child: ListView.builder(
                          itemCount: newslist.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return NewsTile(
                              imgUrl: newslist[index].urlToImage ?? "",
                              title: newslist[index].title ?? "",
                              desc: newslist[index].description ?? "",
                              content: newslist[index].content ?? "",
                              posturl: newslist[index].articleUrl ?? "",
                            );
                          }),
                    ),
                  ],
                ),
              ));
  }
}

class NewsTile extends StatelessWidget {
  final String imgUrl, title, desc, content, posturl;

  NewsTile(
      {this.imgUrl,
      this.desc,
      this.title,
      this.content,
      @required this.posturl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleView(
                      postUrl: posturl,
                    )));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 24),
          width: MediaQuery.of(context).size.width,
          child: Container(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(6),
                      bottomLeft: Radius.circular(6))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.network(
                        imgUrl,
                        height: 200,
                        width: MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(
                    height: 12,
                  ),
                  Text(
                    title,
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Text(
                    desc,
                    maxLines: 2,
                    style: TextStyle(color: Colors.black54, fontSize: 14),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
