import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({required Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentState = 0;
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

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    Text("@$username"),
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
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: Text(titleString[currentState]),
          centerTitle: true,
          actions: <Widget>[
            IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          ],
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
        body: const Center(
          child: Text(
            'Martail, il faut te concentrer et laisser la rosette ! Tu dors trop dedans !',
            style: TextStyle(
              fontSize: 25,
              color: Colors.blue,
            ),
          ),
        ));
  }

  // void logout() async {
  //   await storage.delete(key: "token");
  //   Navigator.pushAndRemoveUntil(
  //       context,
  //       MaterialPageRoute(builder: (context) => WelcomePage()),
  //       (route) => false);
  // }
}
