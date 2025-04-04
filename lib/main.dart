import 'package:flutter/material.dart';
import 'widgets/button.dart';
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
  String cambiarTituloText = "Cambiar titulo";
  String borrarTituloText = "Borrar titulo";
  String buttonTextRojo = "Cambiar a rojo";
  String buttonTextVerde = "Cambiar a verde";
  String achicarLetraText = "Achicar letra";
  String agrandarLetraText = "Agrandar letra";
  Color color = Color.fromARGB(96, 41, 37, 241);
  double font = 24;
  double sumarTamano = 2;

  void cambiarTitulo() {
    setState(() {
      title = title == "Título original" ? "Nuevo título" : "Título original";
      cambiarTituloText =
          title == "Título original" ? "Cambiar titulo" : "Volver al original";
    });
  }

  void borrarTitulo() {
    setState(() {
      title = title.isNotEmpty ? "" : "Título original";
      borrarTituloText =
          borrarTituloText == "Borrar titulo" ? "Mostrar titulo" : "Borrar titulo";
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
                Button(cambiarTituloText, cambiarTitulo),
                Button(borrarTituloText, borrarTitulo),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(buttonTextRojo, cambiarColorRojo),
                Button(buttonTextVerde, cambiarColorVerde),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button(achicarLetraText, achicarLetra),
                Button(agrandarLetraText, agrandarLetra)
              ],
            ),
          ],
        ),
      ),
    );
  }
}
