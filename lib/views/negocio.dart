import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class Negocio extends StatefulWidget {
  @override
  _NegocioState createState() => _NegocioState();
  Negocio({Key key}) : super(key: key);
}

class _NegocioState extends State<Negocio> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Scaffold(
      backgroundColor: Colors.white,
      key: key,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        
        //shrinkWrap: true,
        children: <Widget>[
          titulo('img/bares.png', "Moe's Bar"),
          carusel('Ropa'),
          Flexible(child: contacto()),
          detalle(),
          Spacer()
        ],
      ),
    ));
  }

  Widget titulo(String icono, String texto) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        Image.asset(
          icono,
          height: 60,
        ),
        Text(
          texto,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Icon(Icons.star),
      ],
    );
  }

  Widget carusel(String texto) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: MediaQuery.of(context).size.width * .1,
            ),
            Text(texto),
          ],
        ),
        Image.asset(
          'img/ejemplo.png',
          height: 250,
          width: 250,
        ),
      ],
    );
  }

  Widget contacto() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        Flexible(
          child: GridView.count(
            crossAxisSpacing: 10,
            crossAxisCount: 5,
            childAspectRatio: 16 / 9,
            children: <Widget>[
              OutlineButton(
                borderSide: BorderSide(color: Colors.green, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                child: Icon(
                  Icons.call,
                  color: Colors.green,
                ),
                onPressed: () {
                  launch('tel:40991120');
                },
              ),
              OutlineButton(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                child: Image.asset(
                  'img/icon-f.png',
                  color: Colors.blue,
                ),
                onPressed: () {
                  launch('https://fb.me/PDRTechnologia/');
                },
              ),
              OutlineButton(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                child: Icon(
                  Icons.map,
                  color: Colors.blue,
                ),
                onPressed: () {
                  launch('https://www.waze.com/ul?ll=40.75889500%2C-73.98513100&navigate=yes&zoom=17');
                },
              ),
              OutlineButton(
                borderSide: BorderSide(color: Colors.blue, width: 1),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(1)),
                child: Icon(
                  Icons.mail,
                  color: Colors.blue,
                ),
                onPressed: () {
                  launch('mailto:info@costasolcr.com');
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget detalle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width * .1,
        ),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: <Widget>[
              Text(
                'Direccion: Costado norte del Banco',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Categoria : Ropa',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Zona: Guanacaste',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                'Ciudad: Liberia',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget olvidaste() {
    return FlatButton(
      onPressed: () {
        mensaje();
      },
      child: Text(
        '¿Olvidaste tu password?',
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget registro() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Text(
        '¿Ya tienes una cuenta? Inicia  ',
        style: TextStyle(color: Colors.white),
      ),
      OutlineButton(
        onPressed: () {
          Navigator.pop(context);
        },
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Aquí'.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
    ]);
  }

  Widget nombre() {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: TextField(
          style: TextStyle(),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hasFloatingPlaceholder: false,
              labelText: 'Nombre',
              fillColor: Colors.white,
              filled: true),
        ));
  }

  Widget correo() {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          style: TextStyle(),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hasFloatingPlaceholder: false,
              labelText: 'Correo',
              fillColor: Colors.white,
              filled: true),
        ));
  }

  Widget password() {
    return FractionallySizedBox(
        widthFactor: 0.8,
        child: TextField(
          obscureText: true,
          style: TextStyle(),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              hasFloatingPlaceholder: false,
              labelText: 'Password',
              fillColor: Colors.white,
              filled: true),
        ));
  }

  mensaje() {
    key.currentState.showSnackBar(SnackBar(
      content: Text('sin conexion o en construccion!'),
    ));
  }
}
