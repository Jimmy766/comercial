import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Busqueda extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
  Busqueda({Key key}) : super(key: key);
}

class _BusquedaState extends State<Busqueda> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('img/fondo_b.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: key,
        body: Column(
          
          //shrinkWrap: true,
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(top:28.0),
              child: SizedBox(
                child: Container(
                  color: Colors.white,
                  child: Image.asset(
                    'img/logo1.jpg',
                    alignment: Alignment.centerLeft,
                  ),
                ),
                height: MediaQuery.of(context).size.height * .15,
                width: MediaQuery.of(context).size.width,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar',
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon:Icon( Icons.search,color: Colors.black,)
                ),
              ),
            ),
            Flexible(
              child: GridView.count(
                crossAxisCount: 4,
                children: <Widget>[
                  boton(),
                  boton(),
                  boton(),
                  boton(),
                  
                ],
              ),
            ),
            
          ],
        ),
      ),
    );
  }

  
  Widget boton() {
    return FlatButton(
                      onPressed: () {},
                      child: Column(
                        children: <Widget>[
                          Image.asset('img/comidas.png'),
                          Text(
                            'Restaurantes',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 8,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ));
  }

  Widget iniciar() {
    return FractionallySizedBox(
      widthFactor: 0.3,
      child: OutlineButton(
        onPressed: () {
          mensaje();
        },
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
