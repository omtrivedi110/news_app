import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:news_app/helper/newsHelper.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var data;

  String selectedValue = 'in';
  String selectedcategoryValue = 'general';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    data = NewsHelper.newsHelper
        .getContryNews(country: selectedValue, category: 'general');
  }

  getdata() {
    data = NewsHelper.newsHelper
        .getContryNews(country: selectedValue, category: selectedcategoryValue);
    setState(() {});
  }

  List category = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  // add this on list ae ar at au be bg br ca ch cn co cu cz de eg fr gb gr hk hu id ie il in it jp kr lt lv ma mx my ng nl no nz ph pl pt ro rs ru sa se sg si sk th tr tw ua us ve za
  List contrycode = [
    'ae',
    'ar',
    'ae',
    'ar',
    'at',
    'au',
    'be',
    'bg',
    'br',
    'ca',
    'ch',
    'cn',
    'co',
    'cu',
    'cz',
    'de',
    'eg',
    'fr',
    'gb',
    'gr',
    'hk',
    'hu',
    'id',
    'ie',
    'il',
    'in',
    'it',
    'jp',
    'kr',
    'lt',
    'lv',
    'ma',
    'mx',
    'my',
    'ng',
    'nl',
    'no',
    'nz',
    'ph',
    'pl',
    'pt',
    'ro',
    'rs',
    'ru',
    'sa',
    'se',
    'sg',
    'si',
    'sk',
    'th',
    'tr',
    'tw',
    'ua',
    'us',
    've',
    'za'
  ];
  List contryname = [
    "United Arab Emirates",
    "Argentina",
    "Austria",
    "Australia",
    "Belgium",
    "Bulgaria",
    "Brazil",
    "Canada",
    "Switzerland",
    "China",
    "Colombia",
    "Cuba",
    "Czech Republic",
    "Germany",
    "Egypt",
    "France",
    "United Kingdom",
    "Greece",
    "Hong Kong",
    "Hungary",
    "Indonesia",
    "Ireland",
    "Israel",
    "India",
    "Italy",
    "Japan",
    "South Korea",
    "Lithuania",
    "Latvia",
    "Morocco",
    "Mexico",
    "Malaysia",
    "Nigeria",
    "Netherlands",
    "Norway",
    "New Zealand",
    "Philippines",
    "Poland",
    "Portugal",
    "Romania",
    "Serbia",
    "Russia",
    "Saudi Arabia",
    "Sweden",
    "Singapore",
    "Slovenia",
    "Slovakia",
    "Thailand",
    "Turkey",
    "Taiwan",
    "Ukraine",
    "United States",
    "Venezuela",
    "South Africa"
  ];

  bool iscate = false;
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
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.search),
                          hintText: 'Search Country',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        SystemChannels.textInput.invokeMethod('TextInput.hide');
                        showModalBottomSheet(
                          // isScrollControlled: true,
                          elevation: 0,
                          context: context,
                          builder: (context) {
                            return StatefulBuilder(
                                builder: (context, setState) {
                              return Container(
                                width: double.maxFinite,
                                color: Colors.green.shade500,
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        'Select Country',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Source Sans Pro',
                                          fontWeight: FontWeight.w600,
                                          height: 0,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 25,
                                      ),
                                      Expanded(
                                        child: ListView.builder(
                                          itemCount: contryname.length,
                                          shrinkWrap: true,
                                          // physics: BouncingScrollPhysics(),
                                          itemBuilder: (context, index) {
                                            return Column(
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {
                                                      if (contryname[index] !=
                                                          _controller.text) {
                                                        _controller.text =
                                                            contryname[index];
                                                        selectedValue =
                                                            contrycode[index];
                                                        setState(() {});
                                                        getdata();
                                                      } else {
                                                        _controller.text = '';
                                                      }
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Container(
                                                      width: double.maxFinite,
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                          vertical: 12,
                                                          horizontal: 20),
                                                      decoration:
                                                          ShapeDecoration(
                                                        color: Colors.white,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                        ),
                                                      ),
                                                      child: Row(
                                                        children: [
                                                          Visibility(
                                                            visible: contryname[
                                                                        index] ==
                                                                    _controller
                                                                        .text
                                                                ? true
                                                                : false,
                                                            child: Container(
                                                              width: 20,
                                                              height: 20,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                color: Colors
                                                                    .green
                                                                    .shade500,
                                                                shape:
                                                                    const OvalBorder(),
                                                              ),
                                                            ),
                                                          ),
                                                          Visibility(
                                                            visible: contryname[
                                                                        index] !=
                                                                    _controller
                                                                        .text
                                                                ? true
                                                                : false,
                                                            child: Container(
                                                              width: 20,
                                                              height: 20,
                                                              decoration:
                                                                  ShapeDecoration(
                                                                shape:
                                                                    OvalBorder(
                                                                  side: BorderSide(
                                                                      width: 1,
                                                                      color: Colors
                                                                          .green
                                                                          .shade500),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                          Text(
                                                            '${contryname[index]}',
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 16,
                                                              fontFamily:
                                                                  'Source Sans Pro',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            ),
                                                          ),
                                                          const Spacer(),
                                                        ],
                                                      )),
                                                ),
                                                const SizedBox(
                                                  height: 15,
                                                ),
                                              ],
                                            );
                                          },
                                        ),
                                      ),
                                    ]),
                              );
                            });
                          },
                        ).then((value) {
                          setState(() {});
                        });
                      },
                      readOnly: true,
                    ),
                  ),

                  iscate
                      ? Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // selectedcategoryValue = category[index];
                                setState(() {});
                                selectedcategoryValue = '';
                                setState(() {});
                                getdata();
                                iscate = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green.shade500,
                                    boxShadow: [
                                      // BoxShadow(
                                      //   color: Colors.grey.shade500,
                                      //   spreadRadius: 1,
                                      //   blurRadius: 1,
                                      //   blurStyle: BlurStyle.inner,
                                      //   offset: Offset(0, 2)
                                      //   // blurRadius: 7,
                                      // )
                                    ],
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: Colors.green.shade500)),
                                padding: const EdgeInsets.all(8),
                                margin: const EdgeInsets.only(left: 6),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      '${selectedcategoryValue}',
                                      style:
                                          const TextStyle(color: Colors.white),
                                    ),
                                    const Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  category.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          selectedcategoryValue =
                                              category[index];
                                          iscate = true;
                                          setState(() {});
                                          getdata();
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              boxShadow: [
                                                // BoxShadow(
                                                //   color: Colors.grey.shade500,
                                                //   spreadRadius: 1,
                                                //   blurRadius: 1,
                                                //   blurStyle: BlurStyle.inner,
                                                //   offset: Offset(0, 2)
                                                //   // blurRadius: 7,
                                                // )
                                              ],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              border: Border.all(
                                                  color:
                                                      Colors.green.shade500)),
                                          padding: const EdgeInsets.all(8),
                                          margin:
                                              const EdgeInsets.only(left: 6),
                                          child: Text('${category[index]}'),
                                        ),
                                      )),
                            ),
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
                    child: ListView.builder(
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
