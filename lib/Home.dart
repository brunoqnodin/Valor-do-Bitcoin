/*
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String _valor = "R\$ 0";
  void _recuperaValor()async{

    String _url = "https://blockchain.info/ticker";

    http.Response response;

    response = await http.get(_url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _valor = retorno["BRL"]["buy"].toString();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        width: double.infinity,
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30, bottom: 60),
                  child: Image.asset("images/bitcoin.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "R\$ ${_valor}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.all(60),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: _recuperaValor,
                    textColor: Colors.white,
                    child: Text(
                      "Atualizar",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


 */
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor = "0";
  void _recuperaValor()async{
    String _url = "https://blockchain.info/ticker";
    http.Response response = await http.get(_url);
    Map<String, dynamic> retorno = json.decode(response.body);
    setState(() {
      _valor = retorno["BRL"]["buy"].toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white70,
        width: double.infinity,
        padding: EdgeInsets.all(32),
        child: ListView(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Image.asset("images/bitcoin.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                  child: Text(
                    "R\$ ${_valor}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  margin: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: FlatButton(
                    onPressed: _recuperaValor,
                    textColor: Colors.white,
                    child: Text(
                      "Atualizar",
                      style: TextStyle(
                        fontSize: 30,
                        fontFamily: "Big Shoulders Display",
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "O valor do bitcoin é atualizado a cada 15min pela API https://blockchain.info/ticker",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 22,
                        fontFamily: "Big Shoulders Display"
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
