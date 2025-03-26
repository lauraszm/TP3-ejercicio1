import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = "Título original";
  String buttonTitle = "Cambiar titulo";
  String buttonText = "Borrar titulo";
  String buttonTextRojo = "Cambiar a rojo";
  String buttonTextVerde = "Cambiar a verde";
  Color color = Color.fromARGB(96, 41, 37, 241);
  double font = 24;
  double sumarTamano = 2;

  void cambiarTitulo() {
    setState(() {
      title = title == "Título original" ? "Nuevo título" : "Título original";
      buttonTitle =
          title == "Título original" ? "Cambiar titulo" : "Volver al original";
    });
  }

  void borrarTitulo() {
    setState(() {
      title = title.isNotEmpty ? "" : "Título original";
      buttonText =
          buttonText == "Borrar titulo" ? "Mostrar titulo" : "Borrar titulo";
    });
  }

  void cambiarColorRojo() {
    setState(() {
      if (color == Color.fromARGB(200, 8, 219, 43) ||
          color == Color.fromARGB(96, 41, 37, 241)) {
        buttonTextRojo = "Color original";
        color = Color.fromARGB(117, 235, 15, 15);
      } else {
        buttonTextRojo = "Cambiar a rojo";
        color = Color.fromARGB(96, 41, 37, 241);
      }
    });
  }

  void cambiarColorVerde() {
    setState(() {
      if (color == Color.fromARGB(117, 235, 15, 15) ||
          color == Color.fromARGB(96, 41, 37, 241)) {
        buttonTextVerde = "Color original";
        color = Color.fromARGB(200, 8, 219, 43);
      } else {
        buttonTextVerde = "Cambiar a verde";
        color = Color.fromARGB(96, 41, 37, 241);
      }
    });
  }

  agrandarLetra() {
    setState(() {
      if (font < 48) {
        font += sumarTamano;
      }
    });
  }

  achicarLetra() {
    setState(() {
      if (font > 10) {
        font -= sumarTamano;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: font,
                fontWeight: FontWeight.bold,
                backgroundColor: color,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: cambiarTitulo,
                  child: Text(buttonTitle),
                ),
                ElevatedButton(
                  onPressed: borrarTitulo,
                  child: Text(buttonText),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: cambiarColorRojo,
                  child: Text(buttonTextRojo),
                ),
                ElevatedButton(
                  onPressed: cambiarColorVerde,
                  child: Text(buttonTextVerde),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: achicarLetra,
                  child: Text("Achicar letra"),
                ),
                ElevatedButton(
                  onPressed: agrandarLetra,
                  child: Text("Agrandar letra"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
