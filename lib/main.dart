import 'package:booker_app/inject.dart';
import 'package:booker_app/presentation/book_list/view/book_list_page.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Inject.initAppServiceLocator();
  runApp(const MyApp());
}

class MyApp extends MaterialApp {
  const MyApp({super.key})
      : super(
          home: const BookListPage(),
        );
}
