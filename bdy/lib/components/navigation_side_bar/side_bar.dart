import 'package:bdy/components/navigation_side_bar/side_menu_item.dart';
import 'package:bdy/screens/home/initial_screen.dart';
import 'package:bdy/screens/login_screen.dart';
import 'package:bdy/screens/register/register_login_screen.dart';
import 'package:bdy/themes/theme_colors.dart';
import 'package:flutter/material.dart';

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
            'Sempre te ajudando em suas vendas',
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
              text: const Text('Realizar Venda'),
              route: RegisterLoginScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.store_mall_directory_outlined,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Produtos'),
              route: LoginScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.people_outline,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Clientes'),
              route: LoginScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.storefront_outlined,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Estoque'),
              route: LoginScreen(),
              exit: false,
              menu: false,
            ),
            SideMenuItem(
              icon: const Icon(
                Icons.delivery_dining,
                color: ThemeColors.mainColor,
              ),
              text: const Text('Entregas'),
              route: LoginScreen(),
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
