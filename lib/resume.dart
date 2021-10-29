import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ABBASNAZARI/appdata.dart';
import 'package:ABBASNAZARI/cv.dart';
import 'package:ABBASNAZARI/util.dart';
import 'package:seo_renderer/renderers/link_renderer/link_renderer.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer.dart';

class Resume extends StatefulWidget {
  final double hieght, width;
  final Color colorBackground;
  Resume({@required this.hieght, @required this.width, this.colorBackground});

  @override
  _ResumeState createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  double weightSized;
  @override
  void initState() {
    super.initState();

    if (Get.size.height < Get.size.width) {
      weightSized = width - width / 2;
    } else {
      weightSized = Get.size.width - 40.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: widget.hieght,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('img/bg.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              height: widget.hieght - 120,
              width: weightSized,
              margin: EdgeInsets.only(left: 20, bottom: 20, top: 20, right: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xff242429),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                TextRenderer(
                  text: Text(
                    'برنامه های ساخته شده ',
                    style: style.apply(fontSizeDelta: 5),
                  ),
                ),
                Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: widget.colorBackground,
                    ),
                    height: widget.hieght - 120,
                    width: weightSized,
                    margin: EdgeInsets.only(right: 20, top: 20, left: 20.0),
                    child: ListView.builder(
                      itemCount: appDataes.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map<String, String> mApp = appDataes[index];
                        return Column(
                          children: [
                            LinkRenderer(
                              anchorText: 'برنامه' + ' ' + mApp['appname'],
                              link: mApp['applink'],
                              child: InkWell(
                                onTap: () {
                                  print('object');
                                  launchURL(mApp['applink']);
                                },
                                child: Container(
                                  margin:
                                      EdgeInsets.only(top: 20.0, bottom: 20),
                                  height: 100.0,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        child: Image.network(
                                          'img/' + mApp['appicon'],
                                          height: 80,
                                        ),
                                        margin: EdgeInsets.only(
                                            left: 20, bottom: 0),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.only(
                                              right: 20, bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  'برنامه' +
                                                      ' ' +
                                                      mApp['appname'],
                                                  style: style.apply(
                                                      fontSizeDelta: 3),
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Expanded(
                                                child: Text(
                                                  mApp['appdetail'],
                                                  style: style.apply(
                                                    color: Colors.white60,
                                                    fontSizeFactor: 0.8,
                                                  ),
                                                  maxLines: 2,
                                                  textAlign: TextAlign.justify,
                                                  overflow: TextOverflow.clip,
                                                  textDirection:
                                                      TextDirection.rtl,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            if (index != appDataes.length - 1)
                              Container(
                                height: 0.5,
                                width: Get.size.width,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                  begin: FractionalOffset.topLeft,
                                  end: FractionalOffset.topRight,
                                  colors: [widget.colorBackground, titleColor],
                                )),
                              ),
                          ],
                        );
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
