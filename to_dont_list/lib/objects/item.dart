// Data class to keep the string and have an abbreviation function

class Item {
  final String name;
  final String type;
  int count;

  Item({required this.name, required this.type, this.count = 0});
  
  String abbrev() {
    return name.substring(0, 1);
  }
}
