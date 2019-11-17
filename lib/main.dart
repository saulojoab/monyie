import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){
      runApp(new MyApp());
    })
};

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: Login(title: 'Flutter Demo Home Page'),
    );
  }
}

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email = "";
  String _password = "";

  void _setEmail(value){
    setState(() {
      _email = value;
    });
  }

  void _setPassword(value){
    setState(() {
      _password = value;
    });
  }

  void _login(){
    if (_email == 'saulojoabps@gmail.com' && _password == "123"){
      print('OK');
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(content: Text('ok'),)
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(49, 50, 72, 1),
        child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(70.0),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Icon(Icons.attach_money, size: 40, color: Color.fromRGBO(0, 170, 100, 1),),
                  Text(
                    'MONYIE',
                    style: TextStyle(fontSize: 40, color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                  ),
                ],)
              ),
            ),
            Container(
              width: 320,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    helperText: "Insira o seu e-mail acima",
                    helperStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                    prefixIcon: Icon(Icons.email, color: Color.fromRGBO(0, 170, 100, 1)),
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                    //border: 
                  ),
                  style: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                  onChanged: (text) => _setEmail(text),
                  keyboardType: TextInputType.emailAddress,
                ),
              )
            ),
            Container(
              width: 320,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    helperText: "Insira a sua senha acima",
                    helperStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                    prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(0, 170, 100, 1),),
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                    //border: 
                  ),
                  
                  style: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                  onChanged: (text) => _setPassword(text),
                  obscureText: true,
                ),
              )
            ),
            Container(
              child: 
              Padding(
                padding: EdgeInsets.all(20.0),
                child:  FlatButton(
                  autofocus: false,
                  onPressed: () => _login(),
                  child: Text('Entrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100), ),
                  color: Color.fromRGBO(0, 170, 100, 1),
                ),
              )
             
            )
          ],
        ),
      ),
      )
    );
  }
}
