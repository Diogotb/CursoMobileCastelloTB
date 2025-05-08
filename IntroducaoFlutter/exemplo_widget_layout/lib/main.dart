import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home:MyApp()));
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Exemplo de Layout"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceAround,           
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 150, height: 150, color: Colors.blue),
                Container(width: 150, height: 150, color: Colors.green),
                Container(width: 150, height: 150, color: Colors.red)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 150, height: 150, color: Colors.green),
                Container(width: 150, height: 150, decoration: BoxDecoration(borderRadius: BorderRadius.circular(75),color: Colors.red),),
                Container(width: 150, height: 150, color: Colors.blue)
              ],),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(width: 150, height: 150, color: Colors.red),
                Container(width: 150, height: 150, color: Colors.blue),
                Container(width: 150, height: 150, color: Colors.green)
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(width: 150,height: 150, color: Colors.grey,),
                    Icon(Icons.person)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}