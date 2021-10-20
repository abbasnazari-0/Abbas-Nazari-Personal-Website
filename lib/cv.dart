import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ABBASNAZARI/resume.dart';

import 'util.dart';

const colorBackground = Color(0xff31313a);
var hieght = Get.size.height;
var width = Get.size.width;
var name = "عباس نظری";
var mySkill = "برنامه نویس اندروید";
const titleColor = Color(0xffe1e1e4);
const skillColor = Colors.orange;
ScrollController scrollController = new ScrollController();

class CVPage extends StatefulWidget {
  @override
  _CVPageState createState() => _CVPageState();
}

class _CVPageState extends State<CVPage> {
  @override
  Widget build(BuildContext context) {
    hieght = MediaQuery.of(context).size.height;
    return ListView(
      physics: ClampingScrollPhysics(),
      controller: scrollController,
      children: [
        MainViews(),
        Resume(
          hieght: hieght,
          width: width,
          colorBackground: colorBackground,
        )
      ],
    );
  }
}

class MainViews extends StatefulWidget {
  static var circle_container_border = Container(
    width: 140,
    height: 140,
    decoration: BoxDecoration(
        color: Color.fromARGB(140, 49, 49, 58),
        borderRadius: BorderRadius.all(Radius.circular(70.0))),
  );
  static var circle_container_img = Container(
    width: 134,
    height: 134,
    decoration: BoxDecoration(
        color: colorBackground,
        image: DecorationImage(
            image: NetworkImage('img/mee.jpg'), fit: BoxFit.cover),
        borderRadius: BorderRadius.all(Radius.circular(70.0))),
  );
  static var circle_container_right = Container(
    width: 134,
    height: 134,
    decoration: BoxDecoration(
        color: Color.fromARGB(15, 38, 242, 122),
        borderRadius: BorderRadius.all(Radius.circular(70.0))),
  );
  static var rowSocial = Container(
    margin: EdgeInsets.only(top: 14),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            launchURL('https://stackoverflow.com/users/11399464/abbas-nazari');
          },
          icon: Image.network('img/stack.png', color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            launchURL('https://github.com/abbas-nazari');
          },
          icon: Image.network('img/github.png', color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            launchURL('https://www.instagram.com/abbasnazari.af/');
          },
          icon: Image.network('img/instagram.png', color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            launchURL('https://twitter.com/ABBAS64482109');
          },
          icon: Image.network('img/twitter.png', color: Colors.white),
        ),
        IconButton(
          onPressed: () {
            launchURL('https://t.me/abbas_mahdavi');
          },
          icon: Image.network('img/telegram.png', color: Colors.white),
        ),
      ],
    ),
  );

  @override
  _MainViewsState createState() => _MainViewsState();
}

class _MainViewsState extends State<MainViews> {
  var col = Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Expanded(
        flex: 2,
        child: ClipPath(
          clipper: background(),
          child: Container(
            height: hieght / 2 - 45.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(const Radius.circular(10)),
              image: DecorationImage(
                image: NetworkImage('img/bg2.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
      Expanded(
        flex: 2,
        child: Container(
          margin: const EdgeInsets.only(bottom: 0, top: 10, left: 10),
          child: Center(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, top: 10),
                  child: MainViews.circle_container_right,
                ),
                MainViews.circle_container_border,
                Container(
                  margin: const EdgeInsets.all(3),
                  child: MainViews.circle_container_img,
                )
              ],
            ),
          ),
        ),
      ),
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(top: 10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  name,
                  style: style,
                ),
              ),
              Expanded(
                flex: 1,
                child: Text(
                  mySkill,
                  style: style.apply(color: skillColor),
                ),
              ),
            ],
          ),
        ),
      ),
      Expanded(flex: 1, child: MainViews.rowSocial),
      Container(
        margin: EdgeInsets.only(top: 10.0, left: 5),
        height: 0.5,
        width: Get.size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: FractionalOffset.topLeft,
          end: FractionalOffset.topRight,
          colors: [colorBackground, titleColor],
        )),
      ),
      Expanded(
        flex: 1,
        child: Container(
          margin: EdgeInsets.only(top: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: Container(
                  child: InkWell(
                    child: textIcon('نمایش برنامه ها', 'img/application.png'),
                    onTap: () {
                      scrollController.animateTo(
                        scrollController.position.maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: Duration(milliseconds: 500),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: InkWell(
                    child: textIcon('دانلود رزومه', 'img/download.png'),
                    onTap: () {
                      launchURL(
                          'http://myresume.abbasnazari.com/abbasnazari.pdf');
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: InkWell(
                    child: textIcon(
                      'تماس با من',
                      'img/telephone.png',
                    ),
                    onTap: () {
                      launchURL('tel:+93764680300');
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );

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
      height: hieght,
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
                height: hieght - 100,
                width: weightSized,
                margin: EdgeInsets.only(left: 20, bottom: 20, top: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Color(0xff242429))),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: colorBackground,
              ),
              height: hieght - 100,
              width: weightSized,
              child: Stack(
                children: [
                  col,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class background extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = Path();
    path.lineTo(0.0, 0.0);
    path.lineTo(0.0, size.height - 35.0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height - 35);
    path.lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
