
import 'package:flutter/material.dart';
//import 'package:plant_nusery_app/screens/home_screen.dart';
import 'package:plant_nusery_app/screens/login_sign_up.dart';
import 'package:plant_nusery_app/slidebar/about_us.dart';

import '../slidebar/settings.dart';
import 'botom_navigator_bar.dart';
//import 'package:testhero/search.dart';
//import 'package:shared_preferences/shared_preferences.dart';

class SidebarMenu extends StatefulWidget {
  const SidebarMenu({super.key});

  @override
  State<SidebarMenu> createState() => _SidebarMenuState();
}

class _SidebarMenuState extends State<SidebarMenu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text("User_name"),
            accountEmail: const Text("abcd@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.network(
                  "https://images.unsplash.com/photo-1494790108377-be9c29b29330",
                  height: 90,
                  width: 90,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.unsplash.com/photo-1701205395454-eafa6ea02920",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),


       
 ListTile(
            leading: const Icon(Icons.home),
            title: const Text("Home"),
            onTap: () {
               Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => NavigatorPage(),
                ),
              ); 
            },
          ),

         ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            onTap: () {
              Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) =>SettingsPage(),
                    ),
               );
             
            },
          ),


          const Divider(),//divider line


        ListTile(
            leading: const Icon(Icons.share),
            title: const Text("Share"),
            onTap: () {
            },
          ),
            

//const Divider(),
         ListTile(
            leading: const Icon(Icons.security),
            title: const Text("Security"),
            onTap: () {
             
            },
          ),


         ListTile(
            leading: const Icon(Icons.info),
            title: const Text("About"),
            onTap: () {
               Navigator.of(context).push(
                    MaterialPageRoute(
                    builder: (context) => const about_us(),
                    ),
               );
            },
          ),


         ListTile(
            leading: const Icon(
              Icons.logout,
              color: Colors.redAccent,
            ),
            title: const Text("Logout"),
            onTap: () {
              // Handle the onTap action for Logout
                 Navigator.of(context).push(
                  MaterialPageRoute(
                   builder: (context) => const LoginSignUp(),
                ),
              );
              
            },
          ),
          
        ],
      ),
    ); 
  }
}
