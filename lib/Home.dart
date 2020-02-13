import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _valor_compra = "0";
  String _valor_venda = "0";
  void _jsonBitcoin()async{
    http.Response response = await http.get("https://blockchain.info/ticker");
    Map<String, dynamic> retornoJson = json.decode(response.body);
    setState(() {
      _valor_compra = retornoJson["BRL"]["buy"].toString();
      _valor_venda = retornoJson["BRL"]["sell"].toString();
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
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Image.asset("images/logo2.png", height: 100,),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                  child: Text(
                    "R\$ ${_valor_compra} - Valor de Compra",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Big Shoulders Display",
                    ),
                  ),
                ),Padding(
                  padding: EdgeInsets.only(top: 30,bottom: 30),
                  child: Text(
                    "R\$ ${_valor_venda} - Valor de Venda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
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
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      stops: [0.2, 1],
                      colors: [
                        Colors.orange,
                        Colors.deepOrange
                      ],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: _jsonBitcoin,
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
                  padding: EdgeInsets.only(top: 10),
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
