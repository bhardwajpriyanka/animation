import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_controller.dart';


class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> with SingleTickerProviderStateMixin {

  Controller controller = Get.put(Controller());
  int index = Get.arguments;

  AnimationController? animationController;
  Animation? rotate;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 4),
    );
    rotate = Tween<double>(begin: 10, end: 10).animate(animationController!);
    animationController!.repeat();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Transform.rotate(
                    angle: animationController!.value * 2 * pi,
                    child:
                    Image.network("${controller.modelList[index].Image}")),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          "${controller.modelList[index].Name}",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Center(
                        child: Text(
                          "${controller.modelList[index].Gname}",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.white60),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          "${controller.modelList[index].title  }",
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.white60),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
