import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen>
    with SingleTickerProviderStateMixin {

  Controller controller = Get.put(Controller());

  AnimationController? animationController;
  Animation? rotate;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 4),);
    rotate = Tween<double>(begin: 10, end: 10).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {

      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text("treva"),
          centerTitle: true,
          leading: Icon(Icons.menu),
          actions: [
            Icon(Icons.search_rounded),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: double.infinity,
                margin: EdgeInsets.all(5),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 75),
                            decoration: BoxDecoration(
                              color: Colors.deepPurple.shade300,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${controller.modelList[index].Name}",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "${controller.modelList[index].Gname}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      // fontWeight: FontWeight.w500,
                                      color: Colors.white60),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  "${controller.modelList[index].Location}",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white60),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/detail',arguments: index),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Transform.rotate(
                            angle: animationController!.value*2*pi,
                            child: Container(
                              height: 130,
                              width: 130,
                              child: Image.asset(
                                  "${controller.modelList[index].Image}"),
                            )),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: controller.modelList.length,
          ),
        ),
      ),
    );
  }
}