import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/helper/newsHelper.dart';

class TopicNews extends StatefulWidget {
  const TopicNews({super.key});

  @override
  State<TopicNews> createState() => _TopicNewsState();
}

class _TopicNewsState extends State<TopicNews> {
  var data;

  String selectedValue = 'surat';

  // String selectedcategoryValue = 'general';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = NewsHelper.newsHelper.gettopicnews(
      topic: selectedValue,
    );
  }

  getdata() {
    data = NewsHelper.newsHelper.gettopicnews(
      topic: selectedValue,
    );
    setState(() {});
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final s = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: data,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List news = snapshot.data as List;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: TextField(
                      controller: _controller,
                      onSubmitted: (vwl) {
                        selectedValue = _controller.text;
                        setState(() {});
                        getdata();
                      },
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search any topic',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),

                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: contry.length,
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     return ;
                  //   },
                  // ),
                  Expanded(
                    child: news.length == 0
                        ? const Center(
                            child: Text('No data found'),
                          )
                        : ListView.builder(
                            itemCount: news.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  ListTile(
                                    onTap: () {
                                      Get.toNamed('/detail',
                                          arguments: news[index]['url']);
                                    },
                                    leading: Image.network(
                                      news[index]['urlToImage'] != null
                                          ? news[index]['urlToImage']
                                          : 'https://static9.depositphotos.com/1011646/1236/i/450/depositphotos_12369509-stock-photo-breaking-news-screen.jpg',
                                      height: s.height * 0.3,
                                      width: s.width * 0.2,
                                      fit: BoxFit.fill,
                                    ),
                                    title: Text(news[index]['title']),
                                    subtitle: Text(news[index]['publishedAt']),
                                  ),
                                  // SizedBox(height: s.height * 0.01,),'
                                  const Divider()
                                ],
                              );
                            },
                          ),
                  ),
                ],
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
