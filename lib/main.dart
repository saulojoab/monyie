import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main () {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
    ]);
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
  String _name = "";

  void _setEmail(value){
    if (value == 'oksaulo@gmail.com'){
      setState(() {
        _name = ", Saulo";
      });
    } else {
      setState(() {
        _name = "";
      });
    }
    setState(() {
      _email = value;
    });
  }

  void _setPassword(value){
    setState(() {
      _password = value;
    });
  }

  void _exibirDialogo() {
    showDialog(
       context:  context,
       builder:  (BuildContext context) {
         return AlertDialog(
           title: new Text("Erro!"),
           content: new Text("Os seus dados não conferem, tente novamente"),
           actions: <Widget>[
             new FlatButton(
               child: new Text("Ok!"),
               onPressed: (){
                 Navigator.of(context).pop();
               },
             )
           ],
         );
    },
   );
}

  void _login(){
    if (_email == 'saulojoabps@gmail.com' && _password == "123"){
      print("OK COMPUTER");
    } else {
      _exibirDialogo();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(28, 28, 28, 1),
        child: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: 
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              alignment: Alignment.centerLeft,
              child: Padding(
              padding: EdgeInsets.all(50.0),
              child: 
              Column(children: <Widget>[
                Text(
                  "Bem-vindo",
                  style: TextStyle(fontSize: 40, color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w900),
                ),
                Text(
                  "novamente" + _name + ".",
                  style: TextStyle(fontSize: 40, color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                ),
              ],
              )
              ,)
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'E-mail',
                    helperText: "Insira o seu e-mail acima",
                    helperStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                    prefixIcon: Icon(Icons.email, color: Color.fromRGBO(0, 170, 100, 1),),
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                  ),
                  style: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) =>_setEmail(value),
                ),
              ),
            ),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(10.0),
                margin: EdgeInsets.symmetric(horizontal: 30.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Senha',
                    helperText: "Insira a sua senha acima",
                    helperStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                    prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(0, 170, 100, 1),),
                    hintStyle: TextStyle(color: Color.fromRGBO(0, 170, 100, 1), fontWeight: FontWeight.w100),
                  ),
                  style: TextStyle(color: Color.fromRGBO(0, 170, 100, 1)),
                  obscureText: true,
                  onChanged: (value) =>_setPassword(value),
                ),
              ),
            ),
            Container(
                child:  FlatButton(
                  autofocus: false,
                  onPressed: () => _login(),
                  child: Text('Entrar', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w100), ),
                  color: Color.fromRGBO(0, 170, 100, 1),
                ),
            )
          ],
        ),
      ),
      )
    );
  }
}
