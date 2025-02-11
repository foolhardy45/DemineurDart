import 'package:demineur/models/map_model.dart';



class GameViewModel{
  final MapModel mapModel = MapModel();



  void generateMap(){
    mapModel.generateMap();
  }


}