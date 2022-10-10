import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pimomedu/ui/board.dart';
import 'package:pimomedu/ui/hashtag.dart';
import 'package:pimomedu/ui/menu.dart';
import 'package:pimomedu/utils/colors.dart';

import 'academy.dart';
import 'lobby.dart';

class NavigationController extends GetxController {
  RxInt selectedIndex = 0.obs;

  @override
  void onInit() async {
    super.onInit();
  }
}

class Navigation extends StatelessWidget {
  final NavigationController _navigationController =
  Get.put(NavigationController());

  int get _selectedIndex => _navigationController.selectedIndex.value;

  final Color activeColor = Colors.blue;
  final Color inactiveColor = Colors.grey;

  final List iconImages = [
    Icons.calendar_today_outlined,
    Icons.attach_money,
    Icons.map_outlined,
    Icons.account_box,
    Icons.account_box,
  ];

  final List inactiveIcons = [Icons.favorite, Icons.group, Icons.notifications];

  final List<Widget> _page = <Widget>[
    Academy(),
    HashTag(),
    Lobby(),
    Board(),
    MenuPage(),
  ];

  GlobalKey<ScaffoldState> _key = new GlobalKey<ScaffoldState>();

  Future<bool> _onWillPop(BuildContext context) {
    if (_selectedIndex != 0) {
      _navigationController.selectedIndex.value = 0;
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: SafeArea(
        top: false,
        child: Scaffold(
          key: _key,
          resizeToAvoidBottomInset: false,
          appBar: buildAppBar(context),
          body: Obx(() => _page.elementAt(_selectedIndex)),
         bottomNavigationBar: Obx(() => customedNavigationBar()),
         // bottomNavigationBar:
          // SizedBox(
          //     height: 65,
          //     child: Obx(
          //           () => Row(
          //         children: <Widget>[
          //           buildTabbar('학원', 0),
          //           buildTabbar('해시태그', 1),
          //           buildTabbar('홈', 2),
          //           buildTabbar('게시판', 3),
          //           buildTabbar('메뉴', 4),
          //         ],
          //       ),
          //     )),
        ),
      ),
    );
  }

  customedNavigationBar(){
    return Container(
      width: Get.width,
      height: 80,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(Get.width, 80),
            painter: CustomedPainter(),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: AppColor.MainThemeColor,
                child: Icon(Icons.home), elevation: 0.1, onPressed: () {
              _navigationController.selectedIndex.value = 2;
            }),
          ),
          Container(
            width: Get.width,
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(
                    Icons.assignment_sharp,
                    color: _navigationController.selectedIndex == 0 ? AppColor.MainThemeColor : Colors.grey.shade400,
                  ),
                  onPressed: () {
                    _navigationController.selectedIndex.value = 0;
                  },
                  splashColor: Colors.white,
                ),
                IconButton(
                    icon: Icon(
                      Icons.tag,
                      color: _navigationController.selectedIndex == 1 ? AppColor.MainThemeColor : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      _navigationController.selectedIndex.value = 1;
                    }),
                Container(
                  width: Get.width * 0.20,
                ),
                IconButton(
                    icon: Icon(
                      Icons.web_asset_outlined,
                      color: _navigationController.selectedIndex == 3 ? AppColor.MainThemeColor : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      _navigationController.selectedIndex.value = 3;
                    }),
                IconButton(
                    icon: Icon(
                      Icons.apps,
                      color: _navigationController.selectedIndex == 4 ? AppColor.MainThemeColor : Colors.grey.shade400,
                    ),
                    onPressed: () {
                      _navigationController.selectedIndex.value = 4;
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }


  buildAppBar(BuildContext context) {
    if(_navigationController.selectedIndex.value == 0){
      return lobbyAppBar(context);
    } else if(_navigationController.selectedIndex.value == 1){
      return lobbyAppBar(context);
    } else if(_navigationController.selectedIndex.value == 2){
      return lobbyAppBar(context);
    } else if(_navigationController.selectedIndex.value == 3){
      return lobbyAppBar(context);
    } else if(_navigationController.selectedIndex.value == 4){
      return lobbyAppBar(context);
    }
  }

  lobbyAppBar(BuildContext context){
    return AppBar(
      backgroundColor: AppColor.MainThemeColor,
      title: Text(
        "학원 이름"
      ),
      actions: [
        TextButton(onPressed: (){}, child: Text("알림",
          style: TextStyle(color: Colors.white),
        )),
        TextButton(onPressed: (){}, child: Text("내 정보",
          style: TextStyle(color: Colors.white),
        )),
      ],
    );
  }

  Widget buildTabbar(String tabName, int index) {
    var tabbarWidth = Get.width / 5;
    return Container(
      color: Colors.yellow,
      width: tabbarWidth,
      child: InkWell(
        onTap: () => _navigationController.selectedIndex.value = index,
        child: Container(
          decoration: BoxDecoration(
            border: Border(
              //top: BorderSide(color: Colors.grey[300]),
            ),
          ),
          width: tabbarWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                iconImages[index],
                color: _selectedIndex == index ? activeColor : inactiveColor,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3),
                child: Text(tabName,
                    style: _barTextStyle(_selectedIndex == index)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _barTextStyle(active) {
    if (active)
      return TextStyle(color: activeColor, fontSize: 12);
    else
      return TextStyle(color: inactiveColor, fontSize: 12);
  }
}

class CustomedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20), radius: Radius.circular(20.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}