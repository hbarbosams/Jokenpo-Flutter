import 'dart:math';

import 'package:flutter/material.dart';

class PptPage extends StatefulWidget {
  @override
  _PptPageState createState(){
    return _PptPageState();
  } 
}

class _PptPageState extends State<PptPage> {

  String jogador = 'assets/images/jokenpo.png';
  String bot = 'assets/images/jokenpo.png';
  var numeroJogador;
  var numeroBot;

  void pedra() {
    String jogador ='assets/images/pedra.png';
    this.numeroJogador = 0;
    var random = Random();
    numeroBot = random.nextInt(3);
    if(numeroBot == 0){
      print ('pedra');
      bot = 'assets/images/pedra.png';
    }
    else if(numeroBot == 1){
      print('papel');
      bot = 'assets/images/papel.png';
    }
    else{
      print('tesoura');
      bot = 'assets/images/tesoura.png';
    }
    setState(() {
      this.jogador = jogador;
      this.bot = bot;
    });
  }

  void papel() {
    String jogador ='assets/images/papel.png';
    this.numeroJogador = 1;
    var random = Random();
    numeroBot = random.nextInt(3);
    
    if(numeroBot == 0){
      print('Pedra');
      bot = 'assets/images/pedra.png';
    }
    else if(numeroBot == 1){
      bot = 'assets/images/papel.png';
    }
    else{
      bot = 'assets/images/tesoura.png';
    }
    setState(() {
      this.jogador = jogador;
      this.bot = bot;
    });
  }

  void tesoura() {
    String jogador ='assets/images/tesoura.png';
    this.numeroJogador = 2;
    var random = Random();
    numeroBot = random.nextInt(3);
    if(numeroBot == 0){
      bot = 'assets/images/pedra.png';
    }
    else if(numeroBot == 1){
      bot = 'assets/images/papel.png';
    }
    else{
      bot = 'assets/images/tesoura.png';
    }
    setState(() {
      this.jogador = jogador;
      this.bot = bot;
    });
  }

  String resultadoJogo(){
    if(numeroBot == 0 && numeroJogador == 2 || numeroBot == 1 && numeroJogador == 0 || numeroBot == 2 && numeroJogador == 1){
      return 'Derrota';
    }
    else if(numeroBot == 0 && numeroJogador == 1 || numeroBot == 1 && numeroJogador == 2 || numeroBot == 2 && numeroJogador == 0){
      return 'Vitória';
    }
    else if(numeroBot == numeroJogador){
      return 'Empate';
    }
    else{
      return 'Sem resultado';
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('Jokenpô'),
        centerTitle: true,
        elevation: double.infinity,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text('Escolha uma das opções:')
              ),

              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: 10, top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text('Pedra'),
                      onPressed: pedra,
                    ),
                  ),
              
                  Padding(
                    padding: EdgeInsets.only(right: 10, top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text('Papel'),
                      onPressed: papel,
                    ),
                  ),

                  Padding(
                    padding: EdgeInsets.only( top: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.red),
                      child: Text('Tesoura'),
                      onPressed: tesoura,
                    ),
                  ),

                  
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 80, right: 110),
                    child: Text('Sua escolha')
                  ),
                  
                  Padding(
                    padding: EdgeInsets.only(top: 80, left: 110),
                    child: Text('Escolha do bot')
                  )
                ],
              ),

              Row(
                children: [
                  
                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, right: 40),
                      child: Center(
                        child: Image.asset(jogador, width: 200, height: 200,),
                      )
                    )
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: Center(
                        child: Image.asset('assets/images/x.jpg', width: 50, height: 50, alignment : Alignment.center),
                      ),
                    ),
                  ),

                  Container(
                    child: Padding(
                      padding: EdgeInsets.only(top: 10, left: 40),
                      child: Center(
                        child: Image.asset(bot, width: 200, height: 200,),
                      )
                    ),
                  ),
                ]
              ),

              Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Center(
                    child: Text(resultadoJogo())
                  )
                )
              )
            ] 
          ),
        ],
      )
    );
  }
}