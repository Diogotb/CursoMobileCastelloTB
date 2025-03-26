import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Exemplo Scaffold"),
          actions: [
            IconButton(
              onPressed: () => print("Pesquisa"), 
              icon: Icon(Icons.search)),
            IconButton(
              onPressed: () => print("Notificação"), 
              icon: Icon(Icons.notifications)),
          ],
        ),
        body: Center(child: Text("Corpo do App")),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.arrow_back), label: "Voltar"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Perfil"),
          ]),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Text("Menu")),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("Início"),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Perfil"),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=>print("Adicionar"),
          child: Icon(Icons.add),),
      ),
    );
  }
}