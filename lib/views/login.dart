

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  Login({Key key}) : super(key: key);
}

class _LoginState extends State<Login> {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FacebookLogin facebookLogin = FacebookLogin();
  GlobalKey<ScaffoldState> key = GlobalKey();
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
                  height: MediaQuery.of(context).size.height * .4,
                ),
                boton(0, 'img/icon-g.png', 'Inicia con google'.toUpperCase(),
                    Colors.redAccent),
                boton(1, 'img/icon-f.png', 'Inicia con Facebook'.toUpperCase(),
                    Colors.blueAccent),

                correo(),
                password(),

                iniciar(),
                olvidaste(),
                registro(),
                //Spacer()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boton(int tipo, String icono, String texto, Color color) {
    return FractionallySizedBox(
      widthFactor: 0.8,
      child: RaisedButton.icon(
        onPressed: () {
          if (tipo == 0)
            login();
          else if (tipo == 1) loginFace();
        },
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
        onPressed: () {
          login();
        },
        borderSide: BorderSide(color: Colors.white, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Text(
          'Iniciar',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget olvidaste() {
    return FlatButton(
      onPressed: () {
        Navigator.pushNamed(key.currentContext, '/recupera');
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

  login() {
    _handleSignIn().then((FirebaseUser user) {
      print(user);
    }).catchError((e) => print(e));
    //Navigator.pushReplacementNamed(key.currentContext, '/busqueda');
  }

  loginFace() {
    _handleSignInFacebook();
  }

  Future<FirebaseUser> _handleSignIn() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    print("signed in " + user.displayName);
    return user;
  }

  _handleSignInFacebook() async {
    final FacebookLoginResult result = await facebookLogin.logIn(['email']);
    

    switch (result.status) {
      case FacebookLoginStatus.loggedIn:
        AuthCredential c = FacebookAuthProvider.getCredential(
            accessToken: result.accessToken.token);
        
        AuthResult r = await _auth.signInWithCredential(c);
        
        final FirebaseUser user = r.user;
        print(user);
        break;
      case FacebookLoginStatus.cancelledByUser:
        print('cancelado');
        break;
      case FacebookLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
