import 'package:auto_route/annotations.dart';
import 'package:project/app_screens/book_detail_screen.dart';
import 'package:project/app_screens/home_screen.dart';
import 'package:project/app_screens/not_found_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: HomeScreen, initial: true),
    AutoRoute(page: BookDetailScreen, path: "/book-detail-screen/:bookId"),
    AutoRoute(page: NotFoundScreen, path: "*"),
  ],
)
class $Routes {}
