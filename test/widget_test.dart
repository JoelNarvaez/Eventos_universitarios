import 'package:flutter_test/flutter_test.dart';

import 'package:eventos_universitarios/main.dart';

void main() {
  testWidgets('La app carga y muestra el título', (WidgetTester tester) async {
    await tester.pumpWidget(const CampusEventosApp());

    expect(find.text('Campus Eventos'), findsOneWidget);
  });
}
