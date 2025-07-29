import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan)),
      home: MyScaffold(),
    );
  }
}

class MyScaffold extends StatefulWidget {
  const MyScaffold({super.key});

  @override
  State<MyScaffold> createState() => _MyScaffoldState();
}

class _MyScaffoldState extends State<MyScaffold> {
  int _remainingLife = 6;
  int _counter = 0;
  String _text = 'Press the buttons with icon ';
  bool _isLifeRemaining = true;
  List<IconData> icons = [Icons.favorite,Icons.adb_rounded,Icons.add_reaction_sharp,Icons.air,Icons.workspaces_rounded,Icons.favorite,Icons.abc];

  void decrementLife(){
    if(_isLifeRemaining){
    setState(() {
      if(_remainingLife > 0){
      _remainingLife--;
      _text = 'Press the wrong button ';
    }else{
      _text = 'You are out of lifes Game over ';
      _isLifeRemaining = false;
    }
    });
    }
  }

  void incrementCounter(){
    if(_isLifeRemaining){
    setState(() {
      if(_remainingLife > 0){
      _counter++;
      _text = 'Well done keep it up ';
      }else {
        _text = 'You are out of lifes Game over ';
        _isLifeRemaining = false;
      }
    });
    }
  }

  void restartGame(){
    setState(() {
      _counter = 0;
    _remainingLife = 6;
    _isLifeRemaining = true;
    _text = 'Press the buttons with icon ';
    });
  }

  @override
  Widget build(BuildContext context) {
    icons.shuffle();

    return Scaffold(
      body: Column(
        spacing: 30,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [for(var i = 1; i <= 6; i++) if(i <= _remainingLife) Icon(Icons.favorite,color: Colors.red,) else Icon(Icons.favorite_border) ],),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text(_text,style: Theme.of(context).textTheme.titleLarge, ),if (_text == 'Press the buttons with icon ') Icon(Icons.favorite) else if(_text == 'Well done keep it up ') Icon(Icons.celebration,color: Colors.purple.shade300,) else Icon(Icons.warning_amber,color: Colors.lightBlueAccent.shade200,)]),
          Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
      for(var i = 0; i < 7; i++) 
      if(icons[i] == Icons.favorite) 
      FloatingActionButton(
        onPressed: (){incrementCounter();},
        child: Icon(icons[i]),
        ) 
      else FloatingActionButton(
        onPressed: (){decrementLife();},
        child: Icon(icons[i]),) 
      ],
    ),
          Text('Score : $_counter',style: Theme.of(context).textTheme.titleLarge,),
          FloatingActionButton.extended(
            onPressed: (){ restartGame(); }, 
            label: Text(' Restart '),icon: Icon(Icons.restart_alt),)
        ],
      ),
      
    );
  }
}
