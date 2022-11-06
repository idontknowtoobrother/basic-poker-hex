import 'dart:math';
import 'bot.dart';
import 'card.dart';
import 'player.dart';

class Dealer {
  
  List<String> cardRank = [
    'Spades',
    'Diamonds',
    'Hearts',
    'Clubs'
  ];

  int _flopValue = 0;

  late List<Card> _cards;

  String randomCardRank(){
    return cardRank[Random().nextInt(4)];
  }

  int randomCardValue(){
    return Random().nextInt(13) + 2;
  }

  void generateMyCards(){
    this._cards = this.generateCards(5, true);
  }


  void startGame(Player player, Bot bot){
    print("\x1B[2J\x1B[0;0H");

    this.givePlayerCards([
      player,
      bot
    ]);
    this.generateMyCards();

    bot.showDetail();
    showCards(bot.getCards());

       
  
    this.showFirstRound();


    player.showDetail();
    showCards(player.getCards());

    player.askRaise();

  }

  void showFirstRound(){
    print('\n\n\t\t\t\b\b\bFlop Value: ${this._flopValue} \$');
    showCards(this._cards);
    print('\n\n');
  }

  List<Card> generateCards(int totalCards, bool isHide){
    List<Card> cards = [];
    for(int i = 0; i < totalCards; i++){
      String rank = randomCardRank();
      int value = randomCardValue();
      Card card = new Card(value, rank);
      if(isHide){
        card.setHidden(true);
      }
      cards.add(card);
    }
    return cards;
  }
  

  void givePlayerCards(List<Player> players){
    players.forEach((player) => {
      player.setCards(generateCards(2, player.isBot()))
    });
  }


}