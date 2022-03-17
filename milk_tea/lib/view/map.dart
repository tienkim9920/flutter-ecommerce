import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:milk_tea/component/navbar.dart';
import 'package:milk_tea/constant/name-component.dart';
import 'package:milk_tea/pattern/current-parent.dart';

class MapAddress extends StatelessWidget {

  final CurrentParent currentParent;
  final Function backStep;
  final Function nextStep;
  final Completer<GoogleMapController> _controller;
  final CameraPosition _kGooglePlex;
  final CameraPosition _kLake;

  const MapAddress(this.currentParent, this.backStep, this.nextStep, this._controller,
    this._kGooglePlex, this._kLake, { Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Navbar(true, true, false, true, NameComponent().address, 'flag.png', 
            () => backStep(currentParent.id, currentParent.name), 
            () => nextStep()),
            GoogleMap(
              mapType: MapType.hybrid,
              initialCameraPosition: _kGooglePlex,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            )
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToTheLake,
        label: Text('To the lake!'),
        icon: Icon(Icons.directions_boat),
      ),
    );
  }

    Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}