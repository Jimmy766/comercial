import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Inicio extends StatefulWidget {
  Inicio({Key key}):super(key:key);
  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  GlobalKey<_InicioState> key=GlobalKey();
  @override
  void initState() {
 
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushReplacementNamed(key.currentContext, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      key: key,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('img/fondo1.png'), fit: BoxFit.fill)),
      child: null,
    );
  }
}
