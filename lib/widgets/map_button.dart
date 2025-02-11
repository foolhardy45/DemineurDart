import 'package:demineur/viewmodels/game_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MapButton extends StatelessWidget{
  const MapButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GameViewModel mapButton = context.watch<GameViewModel>();

    return InkWell(
      onTap: (){
        mapButton.click(0, 0);
      },
      onLongPress: (){
        mapButton.onLongPress(0, 0);
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: mapButton.getIcon(0, 0),
      ),
    );
  }


}