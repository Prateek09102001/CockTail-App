import 'package:cocktail/main.dart';
import 'package:flutter/material.dart';

class DrinkDetails extends StatelessWidget{

final drink;

  const DrinkDetails({super.key,@required this.drink});
  @override
  Widget build(BuildContext context){
    return Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              myColor,
              Colors.brown])
          )
          ,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(drink["strDrink"]),
          elevation: 0.0,
        ),
        body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                    tag: drink["idDrink"],
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage(
                        drink["strDrinkThumb"]),)
                ),
                const SizedBox(
                  height: 30.0,
                ),
                Text(
                  "ID : ${drink["idDrink"]}",
                style: const TextStyle(
                  color: Colors.white,
                ),),
                const SizedBox(
                  height: 30.0,
                ),
                 Text(
                  "${drink["strDrink"]}",
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),),
              ],),
          ),
        ),
    ); 
  }
}