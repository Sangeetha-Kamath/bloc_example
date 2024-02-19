import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_weatherapp/constants/app_constants.dart';
import 'package:flutter_weatherapp/constants/string_constants.dart';

class WeatherDetailCard extends StatelessWidget {
  final String title;
  final String information;
  final String img;


  const WeatherDetailCard({super.key,
  required this.title,
  required this.img,
  required this.information});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:80,
      padding:const EdgeInsets.all(12),
      margin: EdgeInsets.only(top:20.h,right: 20.w,left:20.w),
      decoration:BoxDecoration(color: Colors.lightBlue,
      borderRadius: BorderRadius.circular(12.r),
      boxShadow: [
       BoxShadow( color: Colors.black,
      offset: const Offset(0.4,0.2),
      blurRadius: 0.4.r,
      spreadRadius: 0.4.r
      )
      ],
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
        
        title == StringConstants.weatherCondition?
        Image.network(AppConstants.baseImgUrl+img):
        Image.asset( img,height:40.h,width:40.w),
        SizedBox(width:40.w),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(title,
          style: TextStyle(fontWeight: FontWeight.w700,
          color: Colors.black,
          fontSize: 20.sp),
          ),
          Text(information,
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500
          ),)

        ],)
      ],
      )
    );
  }
}