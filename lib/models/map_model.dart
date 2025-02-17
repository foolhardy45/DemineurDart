import 'dart:math';

import 'package:demineur/models/case_model.dart';

class MapModel{
   int nbLine = 0;
   int nbColumn = 0;
   int nbBomb = 0;
  late List<List<CaseModel>> _cases = [];

  MapModel({required this.nbLine, required this.nbColumn, required this.nbBomb}) {
    generateMap();
  }

  void initCases(){
    _cases = List.generate(nbLine, (i) => List.generate(nbColumn, (j) => CaseModel()));

    /*for(int i = 0; i < _nbLine; i++){
      _cases.add(List<CaseModel>.empty());
      for(int j = 0; j < _nbColumn; j++){
        _cases[i].add(CaseModel());
      }
    }*/
  }

  void initBomb(){
    Random random = Random();
    int bombsPlaced = 0;

    while(bombsPlaced < nbBomb){
      int i = random.nextInt(nbLine);
      int j = random.nextInt(nbColumn);
      if(!_cases[i][j].hasBomb){
        _cases[i][j].hasBomb = true;
        bombsPlaced++;
      }
    }

    /*int nbBomb = 0;
    while(nbBomb < _nbBomb){
      int i = 0;
      int j = 0;
      i = Random().nextInt(_nbLine);
      j = Random().nextInt(_nbColumn);
      if(!_cases[i][j].hasBomb){
        _cases[i][j].hasBomb = true;
        nbBomb++;
      }
    }*/
  }

  void initNumber(){
    for(int i = 0 ; i < nbLine; i++){
      for(int j = 0; j < nbColumn; j++){
        if(!_cases[i][j].hasBomb){
          _cases[i][j].number = computeNumber(i, j);
        }
      }
    }
    /*for(int i = 0; i < _nbLine; i++){
      for(int j = 0; j < _nbColumn; j++){
        if(!_cases[i][j].hasBomb){
          int nbBomb = 0;
          for(int k = i - 1; k <= i + 1; k++){
            for(int l = j - 1; l <= j + 1; l++){
              if(k >= 0 && k < _nbLine && l >= 0 && l < _nbColumn){
                if(_cases[k][l].hasBomb){
                  nbBomb++;
                }
              }
            }
          }
          _cases[i][j].number = nbBomb;
        }
      }
    }

     */
  }

  int computeNumber(int i, int j){
    int nbBomb = 0;
    for(int k = i - 1; k <= i + 1; k++){
      for(int l = j - 1; l <= j + 1; l++){
        if(k >= 0 && k < nbLine && l >= 0 && l < nbColumn){
          if(_cases[k][l].hasBomb){
            nbBomb++;
          }
        }
      }
    }
    return nbBomb;
  }

  CaseModel? tryGetCase(int i, int j){
    if(i >= 0 && i < nbLine && j >= 0 && j < nbColumn){
      return _cases[i][j];
    }
    return null;
  }

  void generateMap(){
    initCases();
    initBomb();
    initNumber();
  }

  void reveal(int i, int j){
    if(_cases[i][j].hasFlag) return;

    _cases[i][j].hidden = false;

    if(_cases[i][j].number == 0){
      for(int k = i - 1; k <= i + 1; k++){
        for(int l = j - 1; l <= j + 1; l++){
          if(k >= 0 && k < nbLine && l >= 0 && l < nbColumn){
            if(_cases[k][l].hidden){
              reveal(k, l);
            }
          }
        }
      }
    }
  }

  void revealAll(){
    for(int i = 0; i < nbLine; i++){
      for(int j = 0; j < nbColumn; j++){
        _cases[i][j].hidden = false;
      }
    }
  }

  void explode(int i, int j){
    _cases[i][j].hasExploded = true;
    revealAll();
  }

  void toggleFlag(int i , int j){
    if(_cases[i][j].hidden){
      _cases[i][j].hasFlag = !_cases[i][j].hasFlag;
    }

  }

  List<List<CaseModel>> get cases => _cases;
/*
  List<List<CaseModel>> get cases => _cases;

  int get nbBom => _nbBomb;

  int get nbColumn => _nbColumn;

  int get nbLine => _nbLine;
  */
}