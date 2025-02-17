import 'package:flutter/cupertino.dart';

class CaseModel extends ChangeNotifier{
  bool hidden = true ;
  bool hasBomb = true;
  bool hasExploded = false;
  bool hasFlag = false ;
  int? number;

  CaseModel();

}