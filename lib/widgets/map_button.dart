import 'package:demineur/viewmodels/game_view_model.dart';
import 'package:flutter/material.dart';


class MapButton extends StatelessWidget{
  final int i;
  final int j;
  final GameViewModel viewModel;

  const MapButton({super.key, required this.i, required this.j, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => viewModel.click(i, j),
      onLongPress: () => viewModel.onLongPress(i, j),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
        ),
          child: Center(
            child: viewModel.getIcon(i, j),
          ),
        ),
      );
  }


}