import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyAccueil extends StatelessWidget {
  const MyAccueil({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {},
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: Utilisateurs(key: const Key('')),
    );
  }
}

class Utilisateurs extends StatefulWidget {
  const Utilisateurs({required Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _UtilisateursState createState() => _UtilisateursState();
}

class _UtilisateursState extends State<Utilisateurs> {
  int currentState = 0;
  final nomProduit = TextEditingController();
  final prix = TextEditingController();
  final description = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  String _base64String = "";
  dynamic _monImage;
  // List<Widget> widgets = [const HomeScreen(key: null,), ProfileScreen(key: null,)];
  List<String> titleString = ["Accueil", "Mon compte"];
  String username = "";
  Widget profilePhoto = Container(
    height: 100,
    width: 100,
    decoration: BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.circular(50),
    ),
  );

  void _monImageEnBase64() async {
    try {
      //L'mage provient de la caméra
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image == null) return;

      Uint8List imagebytes = await image.readAsBytes();
      //Encodage de l'image en base 64
      _base64String = base64.encode(imagebytes);
      // print(_base64String);

      setState(() {
        //Récupérer l'image en encodage et l'afficher en décodant
        _monImage = Image.memory(base64Decode(_base64String));
      });
    } catch (e) {}
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(titleString[currentState]),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  profilePhoto,
                  const SizedBox(
                    height: 10,
                  ),
                  // Text("@$username"),
                ],
              ),
            ),
            ListTile(
              title: const Text("Produits"),
              trailing: const Icon(Icons.launch),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Paramètres"),
              trailing: const Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Me déconnecter"),
              trailing: const Icon(Icons.power_settings_new),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        color: Colors.teal,
        shape: const CircularNotchedRectangle(),
        notchMargin: 12,
        child: SizedBox(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.home),
                  color: currentState == 0 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 0;
                    });
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: const Icon(Icons.person),
                  color: currentState == 1 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                    });
                  },
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 10,
            ),

            //Début Afficher l'image par décodage de la base 64
            Container(
              child: _monImage == null
                  ? Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/images/monfond.jpg',
                        width: 150,
                        height: 150,
                      ))
                  : SizedBox(
                      width: 300,
                      height: 200,
                      child: _monImage,
                    ),
            ),
            //Fin affichage
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Expanded(
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      // _monImageEnBase64();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 12.0,
                      ),
                      child: Text(
                        'Prendre une photo',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  // TextButton(
                  //   style: TextButton.styleFrom(),
                  //   onPressed: () {
                  //     // _monImageEnBase64();
                  //   },
                  //   child: const Text(
                  //     'Prendre une image',
                  //     style: TextStyle(
                  //       color: Colors.green,
                  //       fontSize: 20,
                  //     ),
                  //   ),
                  // ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Expanded(
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextField(
                    controller: nomProduit,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nom du produit',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Expanded(
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextField(
                    controller: description,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Description du produit',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 300,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Expanded(
                SizedBox(
                  width: 300,
                  height: 60,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    controller: prix,
                    obscureText: false,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Prix du produit',
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const <Widget>[
                // Expanded(
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              height: 60,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                  child: Text(
                    'Vendre le produit',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
