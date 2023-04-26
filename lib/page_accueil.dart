import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
      home: const HomePage(key: Key('')),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _compteurPanier = 0;

  void _ajouterAuPanier() {
    setState(() {
      _compteurPanier++;
    });
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
        title: const Text('Bienvenu'),
        centerTitle: true,
        actions: <Widget>[
          Stack(
            alignment: Alignment.center,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.shopping_cart),
                onPressed: () {},
              ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: Text(
                  '$_compteurPanier',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
        // actions: <Widget>[
        //   IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
        // ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/mangue.jpg',
              height: 200.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Titre produit',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              ' Description',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _ajouterAuPanier();
                    },
                    child: const Text('Ajouter au panier'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Acheter'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
