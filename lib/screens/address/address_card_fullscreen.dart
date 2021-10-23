import 'package:flutter/material.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:ppg/models/constants.dart';
import 'components/CopyToClipBoardButton.dart';
import 'components/FavoriteStarButton.dart';
import 'components/PublicKeyQRCode.dart';
import 'components/PublicKeyTextBox.dart';

class AddressCardFullscreen extends StatefulWidget {
  @override
  _AddressCardFullscreenState createState() => _AddressCardFullscreenState();
}

class _AddressCardFullscreenState extends State<AddressCardFullscreen> {
  // Whether the green box should be visible or invisible

  ScrollController scrollController;

  ///The controller of sliding up panel
  SlidingUpPanelController panelController = SlidingUpPanelController();

  @override
  void initState() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.expand();
      } else if (scrollController.offset <=
          scrollController.position.minScrollExtent &&
          !scrollController.position.outOfRange) {
        panelController.anchor();
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(
              color: kOnPrimary,
            ),
            title: Text("Bitcoin Address", style: TextStyle(color: kOnPrimary),),
          ),
          body: Center(
            child: Column(
              children: [
                SizedBox(height: 20,),
                RawMaterialButton(
                  shape: RoundedRectangleBorder(),
                  onPressed: () {
                    print("Wallet container pressed.");
                  },
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  child: Container(
                    width: 350,
                    height: 500,
                    // width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: kSecondary,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [BoxShadow(
                        color: kSecondaryDark,
                        offset: Offset(1, 10),
                        blurRadius: 30,
                      ),]
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  color: kOnPrimary,
                                  size: 40,
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Coin name", style: TextStyle(color: kOnPrimary),textDirection: TextDirection.ltr),
                                    Text("Platform name", style: TextStyle(color: kOnPrimary),textDirection: TextDirection.ltr),
                                  ],
                                ),
                                Spacer(),
                                FavoriteWidget(),
                              ]
                          ),
                        ),
                        PublicKeyQRCode(), //QR-code placeholder
                        Text(
                          "Public-Key", style: TextStyle(color: kOnPrimary),
                        ),
                        SizedBox(height: 12),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PublicKeyTextBox(),
                            SizedBox(width: 10),
                            CopyToClipBoardButton(),
                          ],
                        ),
                        SizedBox(height: 12,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Scan Mode", style: TextStyle(color: kOnPrimary),
                            ),
                            // Switch(
                            //   value: _enabled,
                            //   onChanged: (newValue) => setState(() => _enabled = newValue),
                            // ),
                            //OnOff Toggle, requires scaffold
                          ],
                        ),
                        SizedBox(height: 8,),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SlidingUpPanelWidget(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.0),
            decoration: ShapeDecoration(
              color: kSecondary,
              shadows: [
                BoxShadow(
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                    color: const Color(0x11000000)
                ),
              ],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
              ),
            ),
            child: Column(
              children: <Widget>[
                Container(
                  alignment: Alignment.center,
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.menu,
                        size: 30,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          left: 8.0,
                        ),
                      ),
                      Text(
                        'click or drag',
                      )
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  height: 50.0,
                ),
                Divider(
                  height: 0.5,
                  color: kOnSurface,
                ),
                Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Address Information:"),
                            Spacer(),
                            Text("12345566"),
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Balance:"),
                            Spacer(),
                            Text("12345566"),
                          ],
                        ),
                      ),Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Text("Current price in (USD):"),
                            Spacer(),
                            Text("12345566"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Container(
                    child: ListView.separated(
                      controller: scrollController,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('list item $index'),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return Divider(
                          height: 0.5,
                        );
                      },
                      shrinkWrap: true,
                      itemCount: 20,
                    ),
                    color: kOnPrimary,
                  ),
                ),
              ],
              mainAxisSize: MainAxisSize.min,
            ),
          ),
          controlHeight: 50.0,
          anchor: 0.25,
          panelController: panelController,
          onTap: () {
            ///Customize the processing logic
            if (SlidingUpPanelStatus.anchored == panelController.status) {
              panelController.collapse();
            } else {
              panelController.anchor();
            }
          },
          enableOnTap: true, //Enable the onTap callback for control bar.
          dragStart: (details){
            print('dragStart');
          },
          dragCancel: (){
            print('dragCancel');
          },
          dragUpdate: (details){
            print('dragUpdate,${panelController.status==SlidingUpPanelStatus.dragging?'dragging':''}');
          },
          dragEnd: (details){
            print('dragEnd');
          },
        ),
      ],
    );
  }
}

