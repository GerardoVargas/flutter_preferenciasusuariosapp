import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  //patron singleton
  static final PreferenciasUsuario _instancia = PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //Ninguna de estas propiedades se usa
 /*  bool?   _colorSecundario;
  int?    _genero;
  String? _nombre; */

  //GETTERS Y SETTERS 

  int get genero {
    return _prefs.getInt('genero') ?? 1;
  }

  set genero(int value) {
    _prefs.setInt('genero', value);
  }

  bool get color {
    return _prefs.getBool('color') ?? false;
  }

  set color(bool value) {
    _prefs.setBool('color', value);
  }

  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre(String value) {
    _prefs.setString('nombre', value);
  }

  String get ultimaPagina {
    return _prefs.getString('ultimaPagina') ?? 'home';
  }

  set ultimaPagina(String value) {
    _prefs.setString('ultimaPagina', value);
  }

}