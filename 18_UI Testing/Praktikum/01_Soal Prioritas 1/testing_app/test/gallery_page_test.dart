import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testing_app/pages/gallery_page.dart'; // Sesuaikan dengan lokasi berkas GalleryPage

void main() {
  testWidgets('Test GalleryPage UI elements and Bottom Sheet',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: GalleryPage()));

    // test judul "Gallery" ada dalam aplikasi
    expect(find.text('Gallery'), findsOneWidget);

    // test gridview
    expect(find.byType(GridView), findsOneWidget);

    // test ada gambar di dalam grid view
    expect(find.byType(Image), findsWidgets);

    // test bottomsheet
    await tester.tap(find.byType(Image).first);
    await tester.pump();
  });
}
