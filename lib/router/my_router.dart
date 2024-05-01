import 'package:go_router/go_router.dart';
import 'package:shop_app/features/home_page/home_page.dart';
import 'package:shop_app/features/list_product_page/list_product_screen.dart';
import 'package:shop_app/features/product_page/product_screen.dart';
import 'package:shop_app/features/search_page/search_screen.dart';
import 'package:shop_app/repositories/models/models.dart';

final router = GoRouter(
  initialLocation: '/home',
  routes: <RouteBase>[
    //Main Screen with Bottom Bar
    GoRoute(
      path: '/home',
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/product',
      name: '/product',
      builder: (context, state) {
        final product = state.extra as Product;
        return ProductScreen(product: product);
      },
    ),
    GoRoute(
      path: '/category/:id',
      name: '/category',
      builder: (context, state) {
        final category =
            Category.values[int.parse(state.pathParameters['id']!)];
        return ListProductScreen(category: category);
      },
    ),
    GoRoute(
      path: '/search',
      name: '/search',
      builder: (context, state) {
        return const SearchScreen();
      },
    )
  ],
);
