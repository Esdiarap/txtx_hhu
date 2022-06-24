import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MapScreen extends StatefulWidget {
  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Flexible(
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('tweets')
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(child: CircularProgressIndicator());
                      }
                      final tweets = snapshot.data.docs; // 获取document
                      List<Marker> markers = [];
                      for (var tweet in tweets) {
                        // 对document里每一条数据进行处理
                        GeoPoint geopoint =
                            tweet.get('location'); // 获取location数据
                        markers.add(
                          Marker(
                            point:
                                LatLng(geopoint.latitude, geopoint.longitude),
                            builder: (context) => Icon(
                              Icons.pin_drop,
                              color: Colors.red,
                            ),
                          ),
                        );
                      }
                      return FlutterMap(
                        options: MapOptions(center: LatLng(31.8, 119), zoom: 6),
                        layers: [
                          TileLayerOptions(
                            urlTemplate:
                                "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                            subdomains: ['a', 'b', 'c'],
                          ),
                          MarkerLayerOptions(markers: markers),
                        ],
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
