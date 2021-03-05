import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoppy/Notifier/DrawerChangeNotifier.dart';
import 'package:shoppy/Services/AuthService.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _auth = AuthService();
    final _drawer = Provider.of<DrawerChangeNotifier>(context,listen: false);
    return Drawer(
      elevation: 20,
      child: ListView(
        children: [
          ListTile(
            onTap: (){},
            leading: CircleAvatar(
              child: Image.asset('asset/Icon.jpg'),
            ),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: (){
              _drawer.setBody(DrawerChangeNotifier.MainHomeDesc);
              Navigator.pop(context);
            },
            title: Text('Home'),
          ),
          ExpansionTile(
            title: Text('Categories'),
            children: [
              ListTile(
                onTap: (){},
                title: Text('Groceries'),
              ),
              ListTile(
                onTap: (){},
                title: Text('Medicines'),
              ),
              ListTile(
                onTap: (){},
                title: Text('Cosmetics'),
              ),
            ],
          ),
          ListTile(
            onTap: (){},
            title: Text('Order'),
          ),
          ListTile(
            onTap: (){
              _drawer.setBody(DrawerChangeNotifier.cartDesc);
              Navigator.pop(context);
              },
            title: Text('cart'),
          ),
          ListTile(
            onTap: (){},
            title: Text('Setting'),
          ),
          ListTile(
            onTap: (){
              _auth.signOut();
            },
            title: Text('Log Out'),
          ),
          ListTile(
            onTap: (){},
            title: Text('About Us'),
          ),
        ],
      ),
    );
  }
}

