import 'dart:io';

import 'card.dart';

class Player {

  late String _name;
  late int _chip;
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


  void askRaise(){
    stdout.write('\n\$ Raise (C): ');
    int? chipRaise = int.parse(stdin.readLineSync()!);
  }

  void showDetail() {
    print('[\t\b\b\b\b${this._name}');
    print('[\t\b\b\b\bC: ${this._chip} \$');
  } 


} 