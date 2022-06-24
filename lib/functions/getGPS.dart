import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GetGPS {
  Position position;
  Future<GeoPoint> getGeoPoint() async {
    bool servicestatus = await Geolocator.isLocationServiceEnabled();
    if (servicestatus) {
      print('gps is enabled');
      LocationPermission permission = await Geolocator.checkPermission();
      print('no1');
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        print('i get the permission');
      }
      // 这里获取位置信息会花非常长的时间, 大概10 - 15分钟 一次。
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print('the latitude is ${position.latitude.toString()}');
      print('the longitude is ${position.longitude.toString()}');
      return GeoPoint(position.latitude, position.longitude);
    } else {
      print('gps isnot enabled');
    }
  }
}
