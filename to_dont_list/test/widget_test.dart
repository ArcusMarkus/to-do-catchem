// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:to_dont_list/main.dart';
import 'package:to_dont_list/objects/pokemon.dart';


void main() {
  test('Item initializes correctly', () {
    final item = Pokemon(name: "Bulbasaur", type: "grass");

    expect(item.name, "Bulbasaur");
    expect(item.type, "grass");
    expect(item.count, 0);
  });

  test('Item count increments', () {
    final item = Pokemon(name: "Charmander", type: "fire");

    item.count++;
    expect(item.count, 1);

    item.count++;
    expect(item.count, 2);
  });

  testWidgets('Firezone Loads Correctly', (tester) async{
    await tester.pumpWidget(
      const MaterialApp(home: FireZone()),
    );
    expect(find.text('Fire Zone'), findsOneWidget);
    expect(find.text('Tap To Catch Fire Pokemon!'), findsOneWidget);

  });

  testWidgets('Grasszone Loads Correctly', (tester) async{
    await tester.pumpWidget(
      const MaterialApp(home: GrassZone()),
    );
    expect(find.text('Grass Zone'), findsOneWidget);
    expect(find.text('Tap To Catch Grass Pokemon!'), findsOneWidget);

  });

  testWidgets('Waterzone Loads Correctly', (tester) async{
    await tester.pumpWidget(
      const MaterialApp(home: WaterZone()),
    );
    expect(find.text('Water Zone'), findsOneWidget);
    expect(find.text('Tap To Catch Water Pokemon!'), findsOneWidget);

  });

  testWidgets('Pokemon Load Coreectly', (tester) async{
    await tester.pumpWidget(
      const MaterialApp(home: ToDoList()),
    );

    expect(find.text('Bulbasaur'), findsOneWidget);
    expect(find.text('Charmander'), findsOneWidget);
    expect(find.text('Squirtle'), findsOneWidget);
  });

}

  