// Started with https://docs.flutter.dev/development/ui/widgets-intro
import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/item.dart';
import 'package:to_dont_list/widgets/to_do_items.dart';
import 'package:to_dont_list/widgets/to_do_dialog.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State createState() => _ToDoListState();
}

// Pokemon Zones
class FireZone
 extends StatelessWidget{
  const FireZone
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Fire Zone')),
      body: const Center(
        child: Text('Catch Fire Pokemon Here!')
      ),
    );

  }
}

class GrassZone
 extends StatelessWidget{
  const GrassZone
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Grass Zone')),
      body: const Center(
        child: Text('Catch Grass Pokemon Here!')
      ),
    );

  }
}

class WaterZone
 extends StatelessWidget{
  const WaterZone
  ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Water Zone')),
      body: const Center(
        child: Text('Catch Water Pokemon Here!')
      ),
    );

  }
}
// Pokemon Zones

class _ToDoListState extends State<ToDoList> {
  final List<Item> items = [];
  final _itemSet = <Item>{};

  @override
  void initState(){
    super.initState();
    _loadStarterPokemon();
  }

  void catchPokemon(String name){
    setState(() {
      //(i) = pokemon in list, i.name = pokemon name, name = catchPokemon(name)
      final item = items.firstWhere((i) => i.name == name);
      item.count++;
      _itemSet.add(item);
    });
  }

  void _loadStarterPokemon(){
    items.addAll([
      //Gen 1
      Item(name: "Bulbasaur", type: "grass"),
      Item(name: "Charmander", type: "fire"),
      Item(name: "Squirtle", type: "water"),
      //Gen 2
      Item(name: "Chikorita", type: "grass"),
      Item(name: "Cyndaquil", type: "fire"),
      Item(name: "Tododile", type: "water"),
      //Gen 3
      Item(name: "Treecko", type: "grass"),
      Item(name: "Torchic", type: "fire"),
      Item(name: "Mudkip", type: "water"),
      //Might keep it small for the sake of not having to scroll so much
      /*//Gen 4
      Item(name: "Turtwig", type: "grass"),
      Item(name: "Chimchar", type: "fire"),
      Item(name: "Piplup", type: "water"),
      //Gen 5
      Item(name: "Snivy", type: "grass"),
      Item(name: "Tepig", type: "fire"),
      Item(name: "Oshawott", type: "water"),
      //Gen 6
      Item(name: "Chespin", type: "grass"),
      Item(name: "Fennekin", type: "fire"),
      Item(name: "Froakie", type: "water"),
      //Gen 7
      Item(name: "Rowlet", type: "grass"),
      Item(name: "Litten", type: "fire"),
      Item(name: "Popplio", type: "water"),
      //Gen 8
      Item(name: "Grookie", type: "grass"),
      Item(name: "Scorbunny", type: "fire"),
      Item(name: "Sobble", type: "water"),
      // Gen 9
      Item(name: "Spirigatito", type: "grass"),
      Item(name: "Fuecoco", type: "fire"),
      Item(name: "Quaxly", type: "water"),*/
    ]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pokedex'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          children: items.map((item) {
            return ToDoListItem(
              item: item,
              //Completed going to be repurposed as Caught or !Caught
              caught: _itemSet.contains(item),
            );
          }).toList(),  
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Stack(
          children: [
            //Fire Type Zone
            Align(
              alignment: Alignment.bottomLeft,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const FireZone
                    ()),
                    );
                  },
                  tooltip: 'Open Screen',
                  backgroundColor: Colors.red,
                  foregroundColor: const Color.fromARGB(255, 95, 20, 15),
                  child: Icon(Icons.arrow_upward),
                ),
              ),
            //Grass Type Zone
            Align(
              alignment: Alignment.bottomCenter,
                child: FloatingActionButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const GrassZone
                    ()),
                    );
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: const Color.fromARGB(255, 19, 65, 20),
                  child: Icon(Icons.arrow_upward),
                ),
              ),
            //Water Type Zone
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const WaterZone
                    ()),
                    );
                },
                backgroundColor: Colors.blue,
                foregroundColor: const Color.fromARGB(255, 10, 53, 88),
                child: Icon(Icons.arrow_upward),
              ),
            ),
          ],
        ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    title: 'To Do List',
    home: ToDoList(),
  ));
}
