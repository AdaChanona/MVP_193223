import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mvp_all/styles/colors/colors_views.dart';

class LoginPanel extends StatefulWidget {
  const LoginPanel({Key? key}) : super(key: key);

  @override
  State<LoginPanel> createState() => _LoginPanelState();
}

class _LoginPanelState extends State<LoginPanel> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordVisible = false;
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    bool _value = false;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: ColorsViews.textHeader,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: ColorsViews.colorBarra,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Iniciar sesión'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 4, bottom: 4, right: 15),
            child: Image.asset(
              'assets/image/splash.png',
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top:18.0, right:70, bottom:18),
            child: Text(
              'Inicia sesión en tu cuenta para continuar',
              style: TextStyle(
                color: Color.fromARGB(255, 117, 113, 113),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Form(
            child: Column(
              key: _formKey,
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 0,
                    right: 230,
                  ),
                  child: Text(
                    'Correo electrónico',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle:
                          TextStyle(color: Color.fromARGB(255, 161, 161, 161)),
                      hintText: "Email Adress",
                      fillColor: Colors.white70,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 280,
                  ),
                  child: Text(
                    'Contraseña',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 25.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    obscureText:
                        !_passwordVisible, //This will obscure text dynamically
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 161, 161, 161),
                      ),
                      fillColor: Colors.white70,
                      // Here is key idea
                      suffixIcon: IconButton(
                        icon: Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Color.fromARGB(255, 179, 179, 179),
                        ),
                        onPressed: () {
                          // Update the state i.e. toogle the state of passwordVisible variable
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 160, top: 15),
                  child: Row(
                    children: const [
                      Flexible(child: _ContrasennaOlvidada()),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 185),
                  child: _ButtonIngresar()),
                Padding(
                  padding: const EdgeInsets.only(left: 55, top: 20),
                  child: Row(
                    children: const [
                      Flexible(
                        child: _Registrarse(),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ButtonIngresar extends StatelessWidget {
  const _ButtonIngresar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 350,
      child: OutlinedButton(
        onPressed: () {},
        child: const Text('Ingresar',
            style: TextStyle(
                color: Colors.white,
                fontSize: 18)),
        style: ButtonStyle(
          backgroundColor:
          MaterialStateProperty.resolveWith<Color>((states) {
            return ColorsViews.bottomGreen;
          }),
          overlayColor: MaterialStateProperty.resolveWith<Color>(
                (states) {
              if (states.contains(MaterialState.pressed)) {
                return Colors.grey;
              }
              return Colors.transparent;
            },
          ),
          shape:
          MaterialStateProperty.resolveWith<OutlinedBorder>(
                (_) {
              return RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25));
            },
          ),
        ),
      ),
    );
  }
}

class _ContrasennaOlvidada extends StatelessWidget {
  const _ContrasennaOlvidada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: '¿Has olvidado tu contraseña?',
          style: const TextStyle(
              color: ColorsViews.colorBarra,
              fontSize: 17,
              fontWeight: FontWeight.bold),
          recognizer: TapGestureRecognizer()..onTap = () {Navigator.pushNamed(context, '/recover_pass');},
        ),
      ]),
    );
  }
}

class _Registrarse extends StatelessWidget {
  const _Registrarse({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.start,
      text: TextSpan(
        children: <InlineSpan>[
          const TextSpan(
            text: '¿Todavia no tienes cuenta? ',
            style: TextStyle(
              color: ColorsViews.textSubtitle,
              fontSize: 18,
            ),
          ),
          TextSpan(
            text: ' Regístrate.',
            style: const TextStyle(
              color: ColorsViews.colorBarra, fontSize: 18, fontWeight: FontWeight.bold,),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, '/register');
              },
          ),
        ],
      ),
    );
  }
}
