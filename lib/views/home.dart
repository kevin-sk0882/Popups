import 'package:flutter/material.dart';
import 'package:popups/views/nouvelle_page.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ElevatedButton(
          onPressed: snack,
          child: const Text(
            "Clique ici, pour un snackBar",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: alerte,
          child: const Text(
            "Clique ici, pour une alerte",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: (() => dialog(
              "Bienvenue Boss", "Je suis en train de faire un peu de flutter")),
          child: const Text(
            "Clique ici, pour un simple dialog",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.blue),
          ),
        ),
        ElevatedButton(
          onPressed: versNew,
          child: const Text(
            "Nouvelle Page",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontStyle: FontStyle.italic,
            ),
          ),
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.resolveWith((states) => Colors.blue),
          ),
        ),
      ],
    ));
  }

  void snack() {
    SnackBar snackBar = const SnackBar(
      content: Text(
        "Je suis un snackbar",
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<void> alerte() async {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Ceci est une alerte"),
            content: const Text(
                "Nous signalons un problème avec l'application, continuer ?"),
            contentPadding: const EdgeInsets.all(5),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    print("Abandon");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    print("Continuons");
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Continuer",
                    style: TextStyle(color: Colors.blue),
                  )),
            ],
          );
        });
  }

  Future<void> dialog(String title, String desc) async {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SimpleDialog(
            title: Text(title),
            contentPadding: const EdgeInsets.all(10),
            children: <Widget>[
              Text(desc),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  print("Appuyer");
                  Navigator.pop(context);
                },
                child: const Text("OK"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.teal),
                  foregroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.white),
                ),
              )
            ],
          );
        });
  }

  void versNew() {
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext builder) {
      return NewPage("Fragment 2");
    }));
  }
}
