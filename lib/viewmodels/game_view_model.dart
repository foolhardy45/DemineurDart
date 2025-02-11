import 'package:demineur/models/map_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class GameViewModel{
  MapModel mapModel = MapModel();



  void generateMap(){
    mapModel.generateMap();
  }

  void click(int i, int j){
    if(mapModel.isHidden(i, j) && !mapModel.hasFlag(i, j)){
      mapModel.reveal(i, j);
    }
    if(mapModel.hasBomb(i, j)){
      mapModel.explode(i, j);
      mapModel.revealAll();
    }
  }

  void onLongPress(int i, int j){
    mapModel.toggleFlag(i, j);
  }

  Widget getIcon(int i, int j){
    if(mapModel.isHidden(i, j)){
      if(mapModel.hasFlag(i, j)){
        return Image.asset('assets/flag.png');
      }
      return Image.asset('assets/hidden.png');
    }

    if(mapModel.hasBomb(i, j)){
      return Image.asset('assets/bomb.png');
    }

    if(mapModel.hasExploded(i, j)){
      return Image.asset('assets/exploded.png');
    }

    switch(mapModel.getNumber(i, j)){
      case 0:
        return Image.asset('assets/0.png');
      case 1:
        return Image.asset('assets/1.png');
      case 2:
        return Image.asset('assets/2.png');
      case 3:
        return Image.asset('assets/3.png');
      case 4:
        return Image.asset('assets/4.png');
      case 5:
        return Image.asset('assets/5.png');
      case 6:
        return Image.asset('assets/6.png');
      case 7:
        return Image.asset('assets/7.png');
      case 8:
        return Image.asset('assets/8.png');
    }
    return Image.asset('assets/hidden.png');
  }
  


}