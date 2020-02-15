import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
class Registro extends StatefulWidget {
  @override
  _RegistroState createState() => _RegistroState();
  Registro({Key key}):super(key:key);
}

class _RegistroState extends State<Registro> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
                //shrinkWrap: true,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height*.3,
                  ),
                  boton('img/icon-g.png', 'Registrate con google'.toUpperCase(),
                      Colors.redAccent),
                  boton('img/icon-f.png', 'Registrate con Facebook'.toUpperCase(),
                      Colors.blueAccent),
                  
                  nombre(),
                  correo(),
                  password(),
                 SizedBox(
                    height: MediaQuery.of(context).size.height*.08,
                  ),
                  iniciar(),
                //  olvidaste(),
                  registro(),
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
