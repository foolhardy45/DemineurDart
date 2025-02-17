import 'package:demineur/viewmodels/game_view_model.dart';
import 'package:demineur/widgets/map_button.dart';
import 'package:flutter/material.dart';

import '../models/map_model.dart';

class GameView extends StatelessWidget{
  final GameViewModel viewModel = GameViewModel(mapModel: MapModel(nbLine: 10, nbColumn: 10, nbBomb: 10));

  GameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Demineur')),
      body: Table(
        border: TableBorder.all(),
        children: List.generate(viewModel.nbLine, (i){
          return TableRow(
            children: List.generate(viewModel.nbColumn, (j){
              return MapButton(i: i, j: j, viewModel: viewModel);
            })
          );
        })
      ),
    );
  }

}