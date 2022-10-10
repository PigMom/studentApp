import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Lobby extends StatefulWidget {

  @override
  State<Lobby> createState() => _LobbyState();
}

class _LobbyState extends State<Lobby> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              hot(),
              adContainer(),
              hotHashTag(),
              recommencContainer(),
              rateContainer()
            ],
          ),
        ),
      ),
    );
  }

  Widget hot(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Container(
        height: Get.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("실시간 인기글",
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),
            ),
            hotContainer(),
            hotContainer(),
          ],
        ),
      ),
    );
  }

  Widget hotContainer(){
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8.0)
      ),
      height: Get.height / 7,
      width: Get.width,
      child : Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("제목"),
            Text("내용"),
            Text("추천 수/ 댓글 수"),
            Text("해시태그")
          ],
        ),
      ),
    );
  }

  adContainer(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0)
        ),
        height: Get.height / 7,
        width: Get.width,
        child: Center(child: Text("광고"),),
      ),
    );
  }

  hotHashTag(){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0)
        ),
        height: Get.height / 2,
        width: Get.width,
        child : Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text("인기 해시 태그",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  ),
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  ),
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  )
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  ),
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  ),
                  Container(
                    child: Center(child: Text("#해시태그")),
                    height: Get.width / 4,
                    width : Get.width / 4,
                    color: Colors.lightBlueAccent[100],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget recommencContainer(){
    return Container(
      height: Get.height / 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
            child: Text("우리 동네 추천 학원",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Center(child: Text("#해시태그")),
                height: Get.width / 4,
                width : Get.width / 4,
                color: Colors.lightBlueAccent[100],
              ),
              Container(
                child: Center(child: Text("#해시태그")),
                height: Get.width / 4,
                width : Get.width / 4,
                color: Colors.lightBlueAccent[100],
              ),
              Container(
                child: Center(child: Text("#해시태그")),
                height: Get.width / 4,
                width : Get.width / 4,
                color: Colors.lightBlueAccent[100],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget rateContainer(){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: Container(
        height: Get.height / 3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("수강평",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
              ),
            ),
            rateDetailContainer(),
            rateDetailContainer(),
          ],
        ),
      ),
    );
  }

  Widget rateDetailContainer(){
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0)
        ),
        height: Get.height / 7,
        width: Get.width,
        child : Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("학원/강사/과목"),
              Text("리뷰 내용"),
              Text("별점"),
            ],
          ),
        ),
      );
  }

}
