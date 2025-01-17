import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Recupera extends StatefulWidget {
  @override
  _RecuperaState createState() => _RecuperaState();
  Recupera({Key key}):super(key:key);
}

class _RecuperaState extends State<Recupera> {
  GlobalKey<ScaffoldState> key=GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      body: Container(
        
        child: FractionallySizedBox(
          
          widthFactor: 1,
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/fondo_login.png'), fit: BoxFit.fill),
            ),
            child: ListView(
                shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.4,
                  ),
                  
                  
                  correo(),
                 SizedBox(
                    height: MediaQuery.of(context).size.height*.1,
                  ),
                 
                  iniciar(),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.3,
                  ),
                  
                  //Spacer()
                ],
              ),
            ),
          ),
        ),
      
    );
  }

  Widget boton(String icono, String texto, Color color) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: RaisedButton.icon(
        onPressed: () {mensaje();},
        icon: Image.asset(icono, fit: BoxFit.fill, height: 25, width: 25),
        label: Text(texto, style: TextStyle(color: Colors.white)),
        color: color,
        elevation: 10,
      ),
    );
  }

  Widget iniciar() {
    return FractionallySizedBox(
      widthFactor: 0.3,
          child: OutlineButton(
        
        onPressed: () {mensaje();},
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Enviar',
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
        'Crea tu cuenta  ',
        style: TextStyle(color: Colors.white),
      ),
      OutlineButton(
        onPressed: () {
          Navigator.pushNamed(context, '/registro');
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
