import 'dart:convert';

import 'package:cocktail/Screens/DrinkDetails.dart';
import 'package:cocktail/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget{
  const HomePage({super.key});


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  // api interigation
 var api = "https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
 var res , drinks;
 @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async{
    res = await http.get(Uri.parse(api));
    drinks = json.decode(res.body)["drinks"];
    setState(() {});
  }
  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.brown,
          myColor
        ])
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: const Center(child: Text("CockTail App")),
          elevation: 0.0,
        ),
        body: Center(
          child: res != null? ListView.builder(
            itemCount: drinks.length,
          itemBuilder: (context , index){
            var drink = drinks[index];
            return ListTile(
              leading: Hero(
                tag: drink["idDrink"],
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                    drink["strDrinkThumb"] ?? 
                    "https://static.thenounproject.com/png/340719-200.png"),)
                    ),
              title: Text(
                "${drink["strDrink"]}",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),),
              subtitle: Text(
                "${drink["idDrink"]}",
              style: const TextStyle(
                color: Colors.brown,
              ),),
              onTap: (){
                Navigator.push(
                 context,
                 MaterialPageRoute(
                  builder: (context) =>DrinkDetails(drink: drink),
                  fullscreenDialog: true));
              },
            );
          })
          :const CircularProgressIndicator(
            backgroundColor: Colors.white,
          )
        )
      ),
    );
  }
}