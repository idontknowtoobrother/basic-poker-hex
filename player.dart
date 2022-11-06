import 'dart:io';

import 'card.dart';

class Player {

  late String _name;
  late int _chip;
  late int _lastBet;
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


  int raise(int value, bool isForce){
    int _value;
    if(isForce){
      _value = value;
    }else{
      stdout.write('\n\$ Raise (C): ');
      _value = int.parse(stdin.readLineSync()!);
    }
    this._chip -= _value;
    this._lastBet = _value;
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