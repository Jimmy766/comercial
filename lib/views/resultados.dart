import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Resultados extends StatefulWidget {
  @override
  _ResultadosState createState() => _ResultadosState();
  Resultados({Key key}):super(key:key);
}

class _ResultadosState extends State<Resultados> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      key: key,
      appBar: AppBar(
        flexibleSpace: Image.asset('img/fondo_b.png',fit: BoxFit.fill,),  
        elevation: 0,
        title: Text('Resultados'),
      ),
      body: Container(
        
        child: FractionallySizedBox(
          
          widthFactor: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/fondo_b.png'), fit: BoxFit.fill),
            ),
            child: ListView(
                
                //shrinkWrap: true,
                children: <Widget>[
                  boton('img/bares.png', "Moe's Bar"),
                  boton('img/bares.png', "Moe's Bar"),
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  Widget boton(String icono, String texto) {
    return FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(key.currentContext, '/negocio');
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Image.asset(icono,height: 35,),
                          Text(
                            texto,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.star),
                        ],
                      ));
  }

  Widget iniciar() {
    return FractionallySizedBox(
      widthFactor: 0.3,
          child: OutlineButton(
        
        onPressed: () {mensaje();},
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Registro',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget olvidaste() {
    return FlatButton(
      onPressed: () {mensaje();},
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
              labelText: 'Nombre', fillColor: Colors.white, filled: true),
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
              labelText: 'Correo', fillColor: Colors.white, filled: true),
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
              labelText: 'Password', fillColor: Colors.white, filled: true),
        ));
  }
  mensaje(){
    key.currentState.showSnackBar(SnackBar(content: Text('sin conexion o en construccion!'),));
  }
}
