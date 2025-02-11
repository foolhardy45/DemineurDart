import 'dart:math';

import 'package:demineur/models/case_model.dart';

class MapModel{
  final int _nbLine = 0;
  final int _nbColumn = 0;
  final int _nbBomb = 0;
  final List<List<CaseModel>> _cases = List<List<CaseModel>>.empty();

  void initCases(){
    for(int i = 0; i < _nbLine; i++){
      _cases.add(List<CaseModel>.empty());
      for(int j = 0; j < _nbColumn; j++){
        _cases[i].add(CaseModel());
      }
    }
  }

  void initBomb(){
    int nbBomb = 0;
    while(nbBomb < _nbBomb){
      int i = 0;
      int j = 0;
      i = Random().nextInt(_nbLine);
      j = Random().nextInt(_nbColumn);
      if(!_cases[i][j].hasBomb){
        _cases[i][j].hasBomb = true;
        nbBomb++;
      }
    }
  }

  void initNumber(){
    for(int i = 0; i < _nbLine; i++){
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
  }

  void generateMap(){
    initCases();
    initBomb();
    initNumber();
  }
  void reveal(int i, int j){
    if(_cases[i][j].hidden){
      _cases[i][j].hidden = false;
    }
  }

  void revealAll(){
    for(int i = 0; i < _nbLine; i++){
      for(int j = 0; j < _nbColumn; j++){
        _cases[i][j].hidden = false;
      }
    }
  }

  void explode(int i, int j){
    _cases[i][j].hasExploded = true;
  }

  void toggleFlag(int i , int j){
    _cases[i][j].hasFlag = !_cases[i][j].hasFlag;

  }
/*
  List<List<CaseModel>> get cases => _cases;

  int get nbBom => _nbBomb;

  int get nbColumn => _nbColumn;

  int get nbLine => _nbLine;
  */
  bool hasBomb(int i, int j) => _cases[i][j].hasBomb;
  bool hasFlag(int i, int j) => _cases[i][j].hasFlag;
  bool hasExploded(int i, int j) => _cases[i][j].hasExploded ?? false;
  bool isHidden(int i, int j) => _cases[i][j].hidden;
  bool isNumber(int i, int j) => _cases[i][j].number != null;
  int? getNumber(int i, int j) => _cases[i][j].number;
}