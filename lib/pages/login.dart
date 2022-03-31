import 'package:flutter/material.dart';
import '';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vectores = Container(
      height: 200,
      width: 200,
      margin: const EdgeInsets.only(top: 60, right: 24, left: 24,),
      child: Image.asset("assets/image/splash.png"),
    );

    final botonGoogle = Container(
      margin: const EdgeInsets.only(top: 50, left: 24, right: 24,),
      width: 350,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF3169f5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'assets/icons/google_icon.png',
              scale: 50,
              color: Colors.white,
            ),
            const Text(
              'Continuar con Google',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );

    final botonFacebook = Container(
      margin: const EdgeInsets.only(top: 20, left: 24, right: 24,),
      width: 350,
      height: 48,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: const Color(0xFF324fa5),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const <Widget>[
            Icon(Icons.facebook),
            Text(
              'Continuar con Facebook',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );

    final botonCorreo = Container(
        margin: const EdgeInsets.only(top: 40, left: 24, right: 24,),
        width: 350,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            side: const BorderSide(color: Color(0xFF64686f), width: 3),
            primary: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/register');
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const <Widget>[
              Icon(
                Icons.email,
                color: Color(0xFF64686f),
              ),
              Text(
                'Registrarse con e-mail',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF64686f),
                ),
              ),
            ],
          ),
        ),
    );

    final botonLabel = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 30,
          width: 200,
          margin: const EdgeInsets.only(top:20),
          child: TextButton(
            onPressed:() {},
            child: const Text("Entrar como invitado",
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontSize: 13
              ),
            ),
        ),
      ),
        Container(
          height: 30,
          width: 200,
          margin: const EdgeInsets.only(bottom: 25),
          child: TextButton(
            onPressed: () {},
            child: const Text("Entrar como vendedor",
            style: TextStyle(
            color: Colors.green,
            fontSize: 13),
              ),
            ),
        ),
      ],
    );

    final cuentaSesion = Container(
      width: 400,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '¿Ya tienes una cuenta?',
            style: TextStyle(fontSize: 13, color: Colors.black,),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login_panel');
            },
            child: const Text(
              'Iniciar sesion',
              style: TextStyle(
                color: Colors.pinkAccent,
                fontSize: 13,
              ),
            ),
          ),
        ],
      ),
    );


    return Container(
      color: Colors.white,
      child: Column(
        children: [
          vectores,
          botonGoogle,
          botonFacebook,
          botonCorreo,
          botonLabel,
          cuentaSesion
        ],
      ),
    );
  }

}