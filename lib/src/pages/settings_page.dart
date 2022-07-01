import 'package:flutter/material.dart';
import 'package:preferenciasusuariosapp/src/share_prefs/preferencias_usuario.dart';
import 'package:preferenciasusuariosapp/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {

  static final String routeName = 'settings';

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  late bool _colorSecundario;
  late int _genero;
  String? _nombre;

  late TextEditingController _textController;

  final prefs = PreferenciasUsuario();

  @override
  void initState() {
    super.initState();

    prefs.ultimaPagina = SettingsPage.routeName;

    _genero = prefs.genero;
    _colorSecundario = prefs.color;
    _textController = TextEditingController( text: prefs.nombre);
    
  }

  _setSelectedRadio(int? valor) {
    prefs.genero = valor!;
    _genero = valor;
    setState(() {});
  }

  _setColor(bool valor) {
    prefs.color = valor;
    _colorSecundario = valor;
    setState(() {});
  }

   _setNombre(String valor) {
    prefs.nombre = valor;
    _nombre = valor;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor: (prefs.color) ? Colors.teal :  Colors.blue
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Text('Settings', style: TextStyle(fontSize: 45.0, fontWeight: FontWeight.bold)),
          ),
          Divider(),
          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color secundario'), 
            onChanged: _setColor
          ),
          RadioListTile(
            value: 1, 
            title: Text('Masculino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          RadioListTile(
            value: 2, 
            title: Text('Femenino'),
            groupValue: _genero, 
            onChanged: _setSelectedRadio
          ),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Nombre',
                helperText: 'Nombre de la persona usando el telefono'
              ),
              onChanged: _setNombre,
            ),
          )
        ]
      )
    );
  }
}