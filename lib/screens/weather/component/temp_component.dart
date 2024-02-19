import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TempComponent extends StatelessWidget {
  final String title;
  final String temp;
  const TempComponent({super.key, required this.title, required this.temp});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 80,
        padding: const EdgeInsets.all(12),
        margin: EdgeInsets.only(
          right: 20.w,
          left: 20.w,
          top: 20.h,
        ),
        decoration: BoxDecoration(
          color: Colors.lightBlue,
          borderRadius: BorderRadius.circular(12.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black,
                offset: const Offset(0.4, 0.2),
                blurRadius: 0.4.r,
                spreadRadius: 0.4.r)
          ],
        ),
        child: Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                  fontSize: 20.sp),
            ),
            Text(
              temp,
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}
