import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../controller/controller_stop_watch.dart';

class ScreenHome extends StatelessWidget {
  final controller = Get.put(StopwatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text("STOP WATCH",
                    style: TextStyle(
                        fontSize: 40.sp,
                        fontWeight: FontWeight.w900,
                        color: Color(0xffFFAB00)
                        // color: Colors.grey.shade400
                    )),
                Obx(() => Container(
                      margin: EdgeInsets.all(15),
                      height: 65.h,
                      width: 65.w,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              // offset: Offset(0, 4),
                                color: Colors.green.shade400,
                                blurRadius: 3,
                                spreadRadius: 10)
                          ]),
                      child: Center(
                        // Center the text horizontally and vertically
                        child: Text(
                          controller.elapsedTime,
                          style: TextStyle(
                              fontSize: 48.0,
                              color: Color(0xffFFAB00),
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    )),
                Container(
                  width: Get.width,
                  height: 7.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Color(0xffFFAB00),
                  ),
                  child: TextButton(
                    onPressed:(){
                      if (controller.isRunning) {
                        controller.pauseStopwatch();
                      } else {
                        controller.startStopwatch();
                      }
                    },
                    child:  Obx(() => Text(controller.isRunning ? 'Pause' : 'Start', style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16.sp
                    ),),),
                  ),
                ).marginOnly(bottom: 10.sp),

                Container(
                  height: 7.h,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Color(0xffFFAB00),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextButton(
                    onPressed: controller.resetStopwatch,
                    child: Text(
                      'Reset',
                        style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp
                    )
                    ),
                  ),
                ),
              ],
            ).marginSymmetric(vertical: 5.sp, horizontal: 15.sp)));
  }
}
