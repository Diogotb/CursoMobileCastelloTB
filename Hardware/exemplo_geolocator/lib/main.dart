import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
void main(){
  runApp(MaterialApp(
    home: LocationScreen(),
  ));
}

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  //atributos
  String locationMessage = "Localização Não Encontrada";

  void getLocation() async{
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if(!serviceEnabled){
      locationMessage = "Serviço de localização desabilitado";
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        locationMessage = "Permissão de localização negada";
      }
    }
    if(permission == LocationPermission.deniedForever){
      locationMessage = "Permissão de localização negada para sempre";
    }

    Position position = await Geolocator.getCurrentPosition();
    setState(() {
      locationMessage = "Latitude: ${position.latitude}, Longitude ${position.longitude}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GPS - Localização"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(locationMessage),
            ElevatedButton(
              onPressed: () async {
                getLocation();
              }, 
              child: Text("Obter Localização"))
          ],
        ),
      ),
    );
  }
}