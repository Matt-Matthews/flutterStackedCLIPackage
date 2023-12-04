import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:stacked/stacked.dart';
import 'package:latlong2/latlong.dart';

import 'map_viewmodel.dart';

class MapView extends StackedView<MapViewModel> {
  final String data;
   const MapView({super.key, required this.data,});

   @override
   void onViewModelReady(MapViewModel viewModel) {
    
    viewModel.getData(222);
  }

  @override
  Widget builder(
    BuildContext context,
    MapViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
      ),
        backgroundColor: Theme.of(context).colorScheme.background,
        floatingActionButton: FloatingActionButton(
          onPressed: viewModel.updateRotateAngle,
          child: Text("${viewModel.rotateAngle}")),
        body: FlutterMap(
          options: MapOptions(
            center: const LatLng(-33.869637, 18.5107103),
            zoom: 9.2,
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://server.arcgisonline.com/ArcGIS/rest/services/World_Imagery/MapServer/tile/{z}/{y}/{x}',
              userAgentPackageName: 'com.android.application',
            ),
            MarkerLayer(
              markers: [
                Marker(
                  point: const LatLng(-33.869000, 18.5107103),
                  width: 80,
                  height: 80, 
                  builder: (BuildContext context) {
                    return const FlutterLogo();
                   },
                   rotate: true,
                   
                  
                
                ),
              ],
            ),
            Center(child: Text(viewModel.name, style: const TextStyle(color: Colors.white, fontSize: 100),),),
          ],
        ));
  }

  @override
  MapViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      MapViewModel();
}
