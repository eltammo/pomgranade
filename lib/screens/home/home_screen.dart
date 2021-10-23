import 'package:flutter/material.dart';
import 'package:ppg/models/constants.dart';
import 'package:ppg/size_config.dart';
import 'package:ppg/screens/home/components/body.dart';

import '../create_new_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = new GlobalKey<ScaffoldState>();
  bool toggleHideBalance = false;
  bool toggleFlightMode = false;
  bool networkStatus = false;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _drawerKey,
      appBar: AppBar(
          backgroundColor: kPrimary,
          leading: IconButton(
            icon: Icon(Icons.menu, color: kOnPrimary, size: 30,),
            onPressed: () {
              _drawerKey.currentState.openDrawer();
              print("SidebarMenu button pressed.");
            },
          ),
          centerTitle: true,
          title: Text('Krasseste App', style: TextStyle(color: kOnPrimary, fontSize: 22)),//Image.asset('assets/images/logo.png'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.edit, color:  kOnPrimary, size: 30,),
              onPressed: () {
                print("Edit button pressed");
              },
            ),
            SizedBox(
              width: SizeConfig.defaultSize * 0.5,
            ),
          ]
      ),
      body: Body(),
      drawer: Drawer(
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Menu', style: TextStyle(color: kOnPrimary, fontSize: 24),),
                    Text('Krankes menu... ein Wasser bitte.', style: TextStyle(color: kOnPrimary, fontSize: 14),),
                    SizedBox(height: 8,),
                    Spacer(),
                    Row(
                      children: [
                        Text("Network status:", style: TextStyle(color: kOnPrimary, fontSize: 14)),
                        SizedBox(width: 8,),
                        networkStatus ? Icon(Icons.cloud_done_rounded, color: kOnPrimary) : Icon(Icons.cloud_off_rounded, color: kOnPrimary),
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: kPrimary,
                ),
              ),
              SwitchListTile(
                title: Text("Hide Balance", style: TextStyle(color: kPrimaryDark),),
                subtitle: Text("Hides your balance bro."),
                secondary: toggleHideBalance ? Icon(Icons.account_balance_wallet_outlined, color: kPrimaryDark,) : Icon(Icons.account_balance_wallet_rounded, color: kPrimaryDark,),
                value: toggleHideBalance,
                onChanged: (bool value) {
                  setState(() => toggleHideBalance = value);
                },
              ),
              SwitchListTile(
                title: Text("FlightMode", style: TextStyle(color: kPrimaryDark),),
                subtitle: Text("Fly high bro."),
                secondary: toggleFlightMode ? Icon(Icons.airplanemode_active, color: kPrimaryDark,) : Icon(Icons.wifi, color: kPrimaryDark,),
                value: toggleFlightMode,
                onChanged: (bool value) {
                  setState(() => toggleFlightMode = value);
                },
              ),
              ListTile(
                title: Text('Export Public Keys', style: TextStyle(color: kPrimaryDark),),
                subtitle: Text("Exports your stuff bro"),
                leading: Icon(Icons.file_download, color: kPrimaryDark,),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Settings', style: TextStyle(color: kPrimaryDark),),
                subtitle: Text("What to say..."),
                leading: Icon(Icons.settings, color: kPrimaryDark,),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: Text('Log out', style: TextStyle(color: kPrimaryDark),),
                leading: Icon(Icons.logout, color: kPrimaryDark,),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              SwitchListTile(
                title: Text("Network Status Toggle", style: TextStyle(color: kPrimaryDark),),
                subtitle: Text("Online or Offline Cloud Icon"),
                secondary: Icon(Icons.wifi_tethering_sharp, color: kPrimaryDark,),
                value: networkStatus,
                onChanged: (bool value) {
                  setState(() => networkStatus = value);
                },
              ),
            ],
          )
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kSecondary,
        child: Icon(Icons.add_rounded, color: kOnPrimary,),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => CreateNewCard()));
        },
      ),
    );
  }
}
