import 'dart:io';

import 'card.dart';

class Player {

  late String _name;
  late int _chip;
  late int _lastBet = 0;
  bool _isBot = false;

  List<Card> _cards = [];

  Player(this._name, this._chip);

  void setCards(List<Card> cards) {
    this._cards = cards;
  }

  List<Card> getCards() => this._cards;

  bool isBot() => _isBot;

  String getName() => this._name;
  int getChip() => this._chip;

  void clearRaise(){
    this._lastBet = 0;
  }

  int raise(int value, bool isForce){
    int _value = -1;
    if(isForce){
      _value = value;
    }else{
      while(_value < 0){
        stdout.write('\n\$ Raise (C): ');
        String _strValue = stdin.readLineSync()!;
        if(_strValue == null || _strValue == ''){
          continue;
        }
        _value = int.parse(_strValue);
      }
    }
    this._chip -= _value;
    this._lastBet += _value;
    return _value;
  }

  void showDetail() {
    print('[\t\b\b\b\b${this._name}');
    print('[\t\b\b\b\bC: ${this._chip} \$');
  } 

  void showLastBet(){
    print('\n\t\t\tBet ( ${this._lastBet} ) \$\n');
  }


} 