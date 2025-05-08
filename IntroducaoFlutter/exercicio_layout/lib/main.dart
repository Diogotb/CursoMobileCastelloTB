// tela de perfil com flutter

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      // tela de perfil usuário
      appBar: AppBar(title: Text("Perfil do Usuário"),
      actions: [
        IconButton(
          icon: Icon(Icons.settings),
          onPressed: () => print("Configurações Pressionado"),
        ),
        IconButton(
          onPressed: () => print("Sair Pressionado"), 
          icon: Icon(Icons.exit_to_app))
      ],
      backgroundColor: Colors.grey,
      
      ),
      // imagem do usuario e informações do perfil
      body: Padding(
        padding: EdgeInsets.zero,
        child: Column(
          children: [
            // informações do perfil
            Container(
              width: double.infinity,
              color: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipOval(
                    child: Image.network(
                      "https://images.pexels.com/photos/13246954/pexels-photo-13246954.jpeg",
                      width: 200,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Text("Nome: João da Silva", style: TextStyle(fontSize: 20)),
                  Text("dataNascimento: 01/01/2000", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
            
            // 3 container para exibir informações
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Seguidores: 100", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Seguindo: 200", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text("Publicações: 300", style: TextStyle(fontSize: 20, color: Colors.white)),
                ),
              ],
            ),
            //lista de 5 itens
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Item 1"),
                  subtitle: Text("Descrição do Item 1"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Item 2"),
                  subtitle: Text("Descrição do Item 2"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Item 3"),
                  subtitle: Text("Descrição do Item 3"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Item 4"),
                  subtitle: Text("Descrição do Item 4"),
                  trailing: Icon(Icons.arrow_forward),
                ),
                ListTile(
                  leading: Icon(Icons.star),
                  title: Text("Item 5"),
                  subtitle: Text("Descrição do Item 5"),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ],
            ),
            //lista com icones de redes sociais
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              
              children: [
                IconButton(
                  onPressed: () => print("Facebook Pressionado"),
                  icon: Icon(Icons.facebook),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () => print("Instagram Pressionado"),
                  icon: Icon(Icons.camera_alt),
                  iconSize: 50,
                ),
                IconButton(
                  onPressed: () => print("Twitter Pressionado"),
                  icon: Icon(Icons.alternate_email),
                  iconSize: 50,
                ),
              ],
            ),
          ],
        ),
      ) ,
      //bottonNavigationBar com 3 icones
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "Adicionar",
          ),
        ],
      ),
    );
  }
}