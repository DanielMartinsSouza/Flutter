import 'package:bdy/components/cards/sale_card.dart';
import 'package:bdy/components/navigation_side_bar/side_menu_item.dart';
import 'package:bdy/screens/category_screen.dart';
import 'package:bdy/screens/home/initial_screen.dart';
import 'package:bdy/screens/login_screen.dart';
import 'package:bdy/screens/product_screen.dart';
import 'package:bdy/screens/register/register_sell.dart';
import 'package:bdy/screens/stock_screen.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import '../../screens/brand_screen.dart';
import '../../screens/client_screen.dart';
import '../../screens/delivery_screen.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: ThemeColors.backgroundColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _buildHeader(context),
              _buildMenuItems(context),
            ],
          ),
        ));
  }

  Widget _buildHeader(BuildContext context) => Container(
        color: ThemeColors.mainColor,
        padding: EdgeInsets.only(
          top: 24 + MediaQuery.of(context).padding.top,
          bottom: 24,
        ),
        child: Column(children: [
          const CircleAvatar(
            radius: 52,
            backgroundImage: AssetImage(
              'assets/images/DBY_Logo.jpeg',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'DBY System',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Sempre ajudando em suas vendas',
            style: Theme.of(context).textTheme.bodyMedium,
          )
        ]),
      );

  Widget _buildMenuItems(BuildContext context) => Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: <Widget>[
            const SideMenuItem(
              icon: Icon(
                Icons.home,
                color: ThemeColors.mainColor,
              ),
              text: Text('Home'),
              route: InitialScreen(),
              exit: false,
              menu: true,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.shopify,
                color: ThemeColors.mainColor,
              ),
              text: Text('Realizar Venda'),
              route: RegisterSell(
                sell: SaleCard(
                    client: "",
                    item: "",
                    brand: "",
                    category: "",
                    value: 0,
                    amount: 0,
                    delivery: 0,
                    pay: 0,
                    status: 0),
              ),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.store_mall_directory_outlined,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Produtos'),
              route: ProductScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.store_mall_directory_outlined,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Marcas'),
              route: BrandScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.category,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Categorias'),
              route: CategoryScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.people_outline,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Clientes'),
              route: ClientScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.storefront_outlined,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Estoque'),
              route: StockScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.delivery_dining,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Entregas'),
              route: DeliveryScreen(),
              exit: false,
              menu: false,
            ),
            const Divider(
              color: ThemeColors.mainColor,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.exit_to_app,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Sair'),
              route: LoginScreen(),
              exit: true,
              menu: false,
            )
          ],
        ),
      );
}
