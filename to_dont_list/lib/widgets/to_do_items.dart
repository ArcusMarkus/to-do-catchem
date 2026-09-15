import 'package:flutter/material.dart';
import 'package:to_dont_list/objects/item.dart';

typedef ToDoListChangedCallback = Function(Item item, bool caught);
typedef ToDoListRemovedCallback = Function(Item item);

class ToDoListItem extends StatelessWidget {
  const ToDoListItem(
      {required this.item,
      required this.caught,
      super.key
      });

  final Item item;
  final bool caught;

  Color getTypeColor() {
   switch (item.type){
    case "fire":
    return Colors.red;
    case "grass":
    return Colors.green;
    case "water":
    return Colors.blue;
    default:
    return Colors.black;
   }
  }

  TextStyle? _getTextStyle(BuildContext context) {
    if (!caught) return null;

    return const TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: getTypeColor(),
        child: Text(item.abbrev()),
      ),
      title: Text(
        item.name,
        style: _getTextStyle(context),
      ),
    );
  }
}
