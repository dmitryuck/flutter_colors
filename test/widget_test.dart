import 'package:color_change/common/Utils.dart';
import 'package:color_change/screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:color_change/main.dart';

void main() {
  testWidgets('Screen has text element with value "Hey there"', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var textElements = find.text('Hey there');

    expect(textElements, findsOneWidget);
  });

  testWidgets('Initial screen background color is white', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var homeScreenElements = find.byType(HomeScreen);

    expect(homeScreenElements, findsOneWidget);

    HomeScreenState homeScreenState = tester.state(homeScreenElements);

    expect(homeScreenState.screenBackgroundColor == Colors.white, true);
  });

  testWidgets('Background color changed when screen click', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var homeScreenElements = find.byType(HomeScreen);

    expect(homeScreenElements, findsOneWidget);

    HomeScreenState homeScreenState = tester.state(homeScreenElements);

    homeScreenState.onScreenClick();

    await tester.pump();

    var decoratedBoxElements = find.byType(DecoratedBox);

    expect(decoratedBoxElements, findsOneWidget);

    DecoratedBox decoratedBox = (decoratedBoxElements.evaluate().single.widget as DecoratedBox);

    expect(
        (decoratedBox.decoration as BoxDecoration).color == homeScreenState.screenBackgroundColor,
        true);
  });

  testWidgets('Check color luminace', (WidgetTester tester) async {
    bool isColorLight = Utils.isColorLight(Color(0xFFFFFFFF));

    expect(isColorLight, true);

    bool isColorDark = !Utils.isColorLight(Color(0xFF000000));

    expect(isColorDark, true);
  });

  testWidgets('Text color change depending on background color luminace',
      (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    var homeScreenElements = find.byType(HomeScreen);

    expect(homeScreenElements, findsOneWidget);

    HomeScreenState homeScreenState = tester.state(homeScreenElements);

    homeScreenState.onScreenClick();

    await tester.pump();

    bool isColorLight = Utils.isColorLight(homeScreenState.screenBackgroundColor);

    var textElement = find.text('Hey there').evaluate().single.widget as Text;

    expect(textElement.style.color, isColorLight ? Color(0xFF000000) : Color(0xFFFFFFFF));
  });
}
