import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:flutter_weatherapp/constants/string_constants.dart';
import 'package:flutter_weatherapp/screens/location/provider/location_provider.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocationProvider>(builder: (context, locProvider, data) {
      return Scaffold(
          appBar: AppBar(
            title: const Text(
              StringConstants.locationScreen,
            ),
            titleTextStyle: TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontSize: 20.sp),
            backgroundColor: Colors.blue,
            centerTitle: true,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: locProvider.cityController,
                  focusNode: locProvider.cityFocusNode,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(
                          color: Colors.black,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.r),
                        borderSide: const BorderSide(color: Colors.black)),
                    label: const Text(
                      StringConstants.cityName,
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                  ),
                  onChanged: (value) => locProvider.onTextValueChanged(),
                ),
              ),
              locProvider.cities.isEmpty
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                      itemCount: locProvider.cities.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            locProvider.onSelected(index);
                          },
                          child: Container(
                            padding: EdgeInsets.only(top: 12.h),
                            color: locProvider.selectedIndex == index
                                ? Colors.grey
                                : Colors.white,
                            child: Padding(
                              padding:
                                  EdgeInsets.only(left: 20.w, bottom: 20.h),
                              child: Text(
                                locProvider.cities[index].name,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        );
                      },
                    ))
            ],
          ),
          floatingActionButton: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r)),
                fixedSize: Size(100.w, 40.h),
              ),
              onPressed: () {
                locProvider.onPressed(context);
              },
              child: Center(
                child: Text(
                  StringConstants.submit,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700),
                ),
              )));
    });
  }
}
