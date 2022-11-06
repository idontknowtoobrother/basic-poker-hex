import 'dart:io';

String getCardRank(Card card){
  switch(card.getRank()) { 
    case 'Spades': { 
      return '♠';
    } 
    
    case 'Diamonds': { 
      return '♦';
    } 

    case 'Hearts': {
      return '♥';
    }

    case 'Clubs': {
      return '♣';
    }
        
    default: { 
      return '*';
    }
  } 
}


void showCards(List<Card> cards){
  var arrs = [
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
    [],
  ];

  cards.forEach((card) {
    arrs[0].add('┌─────────┐');
  });

  cards.forEach((card) {
    if(card.isHidden()){
      arrs[1].add('│░░░░░░░░░│');
    }else{
      arrs[1].add('│${card.getValueDisplay(true)}       │');
    }
  });

  for(int i = 2; i < 4; i++){
    cards.forEach((card) {
      if(card.isHidden()){
        arrs[i].add('│░░░░░░░░░│');
      }else{
        arrs[i].add('│         │');
      }
    });
  }

  cards.forEach((card) {
    if(card.isHidden()){
      arrs[4].add('│░░░░░░░░░│');
    }else{
      arrs[4].add('│    ${getCardRank(card)}    │');
    }
  });

  for(int i = 5; i < 7; i++){
    cards.forEach((card) {
      if(card.isHidden()){
        arrs[i].add('│░░░░░░░░░│');
      }else{
        arrs[i].add('│         │');
      }
    });
  }

  cards.forEach((card) {
    if(card.isHidden()){
      arrs[7].add('│░░░░░░░░░│');
    }else{
      arrs[7].add('│       ${card.getValueDisplay(false)}│');
    }
  });

  cards.forEach((card) {
    arrs[8].add('└─────────┘');
  });


  arrs.forEach((line) {
    for(int i = 0; i < line.length; i++){
      stdout.write(line[i]);
    }
    print('');
  });


}

class Card {
  
  late int _value;
  late String _rank;
  bool _isHidden = false;

  Card(this._value, this._rank);

  bool isHidden() => this._isHidden;

  void setHidden(bool hidden){
    this._isHidden = hidden;
  }

  String getRank() => this._rank;
  int getValue() => this._value;
  String getValueDisplay(bool topSide) {
    late String display;
    // 10 = J
    // 11 = Q
    // 12 = K
    // 13 = A

    display = '${this._value}';
    if(this._value == 11){
      display = 'J';
    }else if(this._value == 12){
      display = 'Q';
    }else if(this._value == 13){
      display = 'K';
    }else if(this._value == 14){
      display = 'A';
    }

    if(this._value != 10){
      if(topSide){
        display += " ";
      }else{
        display = " " + display;
      }
    }
    return display;
  } 

}