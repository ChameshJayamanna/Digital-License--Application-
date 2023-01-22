import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Accident Density Areas',
        theme: ThemeData(
          primarySwatch: Colors.amber,
        ),
        home: const MapScreen(),
        debugShowCheckedModeBanner: false);
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late double latorigin;
  late double lngorigin;
  late double latdestination;
  late double lngdestination;
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPiKey = "AIzaSyDrUFw9y8L_d4tPjD7W32ZPrdQM99L2gEw";

  Set<Marker> markers = Set(); //markers for google map
  Map<PolylineId, Polyline> polylines = {};
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(6.8213806784508435, 79.89051870897487),
    zoom: 12,
  );

  GoogleMapController? _googleMapController;

  late Marker? _origin = null;
  late Marker? _destination = null;

  @override
  void dispose() {
    _googleMapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text("Accident Map"),
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            zoomControlsEnabled: true,
            initialCameraPosition: _initialCameraPosition,
            onMapCreated: (controller) => _googleMapController = controller,
            polylines: Set<Polyline>.of(polylines.values),
            markers: {
              if (_origin != null) _origin!,
              if (_destination != null) _destination!,
            },
            onLongPress: addMarker,
          ),
          Container(
            padding: const EdgeInsets.only(top: 500, left: 325),
            child: FloatingActionButton(
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.black,
              onPressed: () => _googleMapController?.animateCamera(
                CameraUpdate.newCameraPosition(_initialCameraPosition),
              ),
              child: const Icon(Icons.center_focus_strong),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 600, right: 12),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {},
                  child: Text('confirm location'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  getDirections() async {
    print('method accesed');
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      googleAPiKey,
      PointLatLng(latorigin, lngorigin),
      PointLatLng(latdestination, lngdestination),
      travelMode: TravelMode.walking,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    addPolyLine(polylineCoordinates);
  }

  addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.deepPurpleAccent,
      points: polylineCoordinates,
      width: 8,
    );
    polylines[id] = polyline;
    setState(() {});
  }

  void addMarker(LatLng pos) {
    if (_origin == null) {
      setState(() {
        _origin = Marker(
          markerId: const MarkerId('origin'),
          infoWindow: const InfoWindow(title: 'Origin'),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          position: pos,
        );
        latorigin = pos.latitude;
        lngorigin = pos.longitude;
        print(latorigin);
        //reset destination marker
        _destination = null;
      });
    } else {
      setState(() {
        _destination = Marker(
          markerId: const MarkerId('destination'),
          infoWindow: const InfoWindow(title: 'Destination'),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
          position: pos,
        );

        latdestination = pos.latitude;
        lngdestination = pos.longitude;
        print(latdestination);

        getDirections();
      });
    }
  }
}
