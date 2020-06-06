import 'package:bmnav/bmnav.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:flutter/material.dart';
import 'package:faynmann/ui/login.dart';
import 'package:faynmann/ui/filter.dart';
import 'package:flutter/services.dart';



class MainPage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MainP();
  }
}

class MainP extends State<MainPage> {
  int currentTab = 0;
  final List<Widget> screens = [
    MainPage(), MainPage(), MainPage(), MainPage(),MainPage()
  ];
  Widget currentScreen = MainPage();

  int _selectedpage = 0;
  ScrollController _controller = new ScrollController();
  String _value = null;
  String dropdownValue = 'One';
  void _onItemTapped(int index) {
    setState(() {
      _selectedpage = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: new ListView(
        children: <Widget>[
          Container(
            width:MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 1),
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: AssetImage('images/appBar.png'), fit: BoxFit.fill)),
            child: new Container(
              padding: EdgeInsetsDirectional.only(bottom: MediaQuery.of(context).size.height*0.4, top: MediaQuery.of(context).size.height*0.06),
              height: MediaQuery.of(context).size.height*0.34,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      Hero(
                        tag:'iconBtn',
                        child: IconButton(
                          icon: new Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onPressed: (){
                            Navigator.pop(context);

                          },
                        ),
                      ),
                      Container(
                        child: Text(
                          "Home",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Cairo'
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
                IconButton(
                  padding: EdgeInsets.only(right: 30,top: 12),
                  icon: new Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                )
              ],),
            ),
          ),//header
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 45),
            child: Column(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 44,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black26,
                      width: 0.5,
                    ),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  padding: const  EdgeInsets.only(top: 5,left: 16,right: 20),
                  child: DropdownButtonFormField<String>(

                    decoration:
                    InputDecoration.collapsed(hintText: 'Department',hintStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                        fontFamily: ('Cairo')

                    )),
                    onChanged: ( newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: <String>['Department 1', 'Department 2', 'Department 3', 'Department 4']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            fontFamily: ('Cairo')

                        )),
                      );
                    })
                        .toList(),
                  ),),
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                    height: 44,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.black26,
                        width: 0.5,
                      ),
                      shape: BoxShape.rectangle,
                      borderRadius: BorderRadius.all(Radius.circular(7)),
                    ),
                    padding: const  EdgeInsets.only(top:5,left: 16,right: 20),
                    child: DropdownButtonFormField<String>(

                      decoration:
                          InputDecoration.collapsed(hintText: 'Subject',hintStyle: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                              fontFamily: ('Cairo')

                          )),
                      onChanged: ( newValue) {
                        setState(() {
                          dropdownValue = newValue;
                        });
                      },
                      items: <String>['Subject 1', 'Subject 2', 'Subject 3', 'Subject 4']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                              fontFamily: ('Cairo')

                          ),),
                        );
                      })
                          .toList(),
                    ),),
                Padding(
                  padding: EdgeInsets.all(8),
                ),
                Hero(
                  tag: 'SearchBtn',
                  child:RaisedButton(
                    elevation: 10,
                    padding: EdgeInsets.only(left: 0,right:0),
                    child: Container(
                      child: Center(
                        child:Text("Log in",style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFFbcd8f7),
                            fontFamily: ('Cairo')

                        ),),
                      ),
                      width: MediaQuery.of(context).size.width*0.8,
                      height: 46,
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF0D47A1),
                              Color(0xFF0D47A1),
                              Color(0xFF0d5ba8),
                            ],
                          ),

                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(100.0),
                              topRight: Radius.circular(7),
                              bottomLeft: Radius.circular(7),
                              topLeft: Radius.circular(7))

                      ),
                    ),

                    onPressed: (){
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (context) =>
                          new Filter())
                      );
                      },
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(bottomRight: Radius.circular(100)),side: BorderSide(width:270 )),
                  ),
                ),
                //Search button
                Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02,right: MediaQuery.of(context).size.width*0.58,bottom: 0),
                  child:Text("Latest classes",style: TextStyle(
                    color: Colors.black45,
                      fontFamily: ('Cairo'),
                    fontSize: 14

                  ),),
                ),

               /* Row(
                  children: <Widget>[
                    Container(
                      child: Row(children: <Widget>[
                        Image.asset('images/person1.jpg',height: 150,width: 120,),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 16,top: 18),
                              child: Row(children: <Widget>[
                                Icon(Icons.person,color: Color(0xFF0D47A1),size: 18,),
                                Text('   Eng Hessan Mohamed',style:TextStyle(
                                  fontSize: 13,
                                ) ,)
                              ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child:Row(children: <Widget>[
                                  Icon(Icons.library_books,color: Color(0xFF0D47A1),size: 18,),
                                  Text('   Subject name                ',style:TextStyle(
                                    fontSize: 13,
                                  ) ,)
                                ],
                                )
                            ),
                            Row(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Row(children: <Widget>[
                                  Icon(Icons.access_time,color: Color(0xFF0D47A1),size: 18,),
                                  Text('   Time       ',style:TextStyle(
                                    fontSize: 13,
                                  ) ,)
                                ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Row(children: <Widget>[
                                    Icon(Icons.date_range,color: Color(0xFF0D47A1),size: 18,),
                                    Text('   Date        ',style:TextStyle(
                                      fontSize: 13,
                                    ) ,)
                                  ],
                                  )
                              ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Row(children: <Widget>[
                                Icon(Icons.location_on,color: Color(0xFF0D47A1),size: 18,),
                                Text('   Location                         ',style:TextStyle(
                                  fontSize: 13,
                                ) ,)
                              ],
                              ),
                            )


                          ],),

                        ),

                      ],),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.5,

                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(7)),

                      ),
                      padding: EdgeInsets.only(right: 10,bottom: 0,top: 0,left: 0),
                      width: 330,
                    ),
                    Container(
                      child: Row(children: <Widget>[
                        Image.asset('images/person1.jpg',height: 150,width: 120,),
                        Container(
                          padding: EdgeInsets.only(left: 10),
                          child: Column(children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 16,top: 18),
                              child: Row(children: <Widget>[
                                Icon(Icons.person,color: Color(0xFF0D47A1),size: 18,),
                                Text('   Eng Hessan Mohamed',style:TextStyle(
                                  fontSize: 13,
                                ) ,)
                              ],
                              ),
                            ),
                            Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child:Row(children: <Widget>[
                                  Icon(Icons.library_books,color: Color(0xFF0D47A1),size: 18,),
                                  Text('   Subject name                ',style:TextStyle(
                                    fontSize: 13,
                                  ) ,)
                                ],
                                )
                            ),
                            Row(children: <Widget>[
                              Container(
                                padding: EdgeInsets.only(bottom: 16),
                                child: Row(children: <Widget>[
                                  Icon(Icons.access_time,color: Color(0xFF0D47A1),size: 18,),
                                  Text('   Time       ',style:TextStyle(
                                    fontSize: 13,
                                  ) ,)
                                ],
                                ),
                              ),
                              Container(
                                  padding: EdgeInsets.only(bottom: 16),
                                  child: Row(children: <Widget>[
                                    Icon(Icons.date_range,color: Color(0xFF0D47A1),size: 18,),
                                    Text('   Date        ',style:TextStyle(
                                      fontSize: 13,
                                    ) ,)
                                  ],
                                  )
                              ),
                            ],),
                            Container(
                              padding: EdgeInsets.only(bottom: 16),
                              child: Row(children: <Widget>[
                                Icon(Icons.location_on,color: Color(0xFF0D47A1),size: 18,),
                                Text('   Location                         ',style:TextStyle(
                                  fontSize: 13,
                                ) ,)
                              ],
                              ),
                            )


                          ],),

                        ),

                      ],),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.5,

                        ),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(7)),

                      ),
                      padding: EdgeInsets.only(right: 10,bottom: 0,top: 0,left: 0),
                      width: 330,
                    )
                  ],
                ),*/
                /*Container(
                  padding: EdgeInsets.only(left: 180,top: 10),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.fiber_manual_record,size: 10,color: Color(0xFFc0c3c4),),
                      Icon(Icons.fiber_manual_record,size: 10,color: Color(0xFFc0c3c4),),
                      Icon(Icons.fiber_manual_record,size: 10,color: Color(0xFFc0c3c4),),
                      Icon(Icons.fiber_manual_record,size: 10,color: Color(0xFFc0c3c4),),
                      Icon(Icons.fiber_manual_record,size: 10,color: Color(0xFFc0c3c4),)

                    ],
                  ),
                )*/
              ],
            ),
          ), //buttons and dropdown buttons
          Container(
            width:120,
            height:MediaQuery.of(context).size.height*0.5,
            child:ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: 1,left: MediaQuery.of(context).size.width*0.09,right: 10),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Row(children: <Widget>[
                          Container(
                            child: Row(children: <Widget>[
                              Container(
                                child:Image.asset('images/etsh3.jpg',fit: BoxFit.cover,),
                                decoration:BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(7)),) ,
                                height: 160,
                                  width: 125
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10),
                                child: Column(children: <Widget>[
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8,top: 14),
                                    child: Row(children: <Widget>[
                                      Icon(Icons.person,color: Color(0xFF0D47A1),size: 18,),
                                      Text('   Mr. Hessan Mohamed',style:TextStyle(
                                        fontFamily: ('Cairo'),
                                        fontSize: 13,
                                      ) ,)
                                    ],
                                    ),
                                  ),
                                  Container(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child:Row(children: <Widget>[
                                        Icon(Icons.library_books,color: Color(0xFF0D47A1),size: 18,),
                                        Text('   Subject name                ',style:TextStyle(
                                          fontSize: 13,
                                          fontFamily: ('Cairo'),

                                        ) ,)
                                      ],
                                      )
                                  ),
                                  Row(children: <Widget>[
                                    Container(
                                      padding: EdgeInsets.only(bottom: 8),
                                      child: Row(children: <Widget>[
                                        Icon(Icons.access_time,color: Color(0xFF0D47A1),size: 18,),
                                        Text('   Time       ',style:TextStyle(
                                          fontSize: 13,
                                          fontFamily: ('Cairo'),

                                        ) ,)
                                      ],
                                      ),
                                    ),
                                    Container(
                                        padding: EdgeInsets.only(bottom: 8),
                                        child: Row(children: <Widget>[
                                          Icon(Icons.date_range,color: Color(0xFF0D47A1),size: 18,),
                                          Text('   Date        ',style:TextStyle(
                                            fontSize: 13,
                                            fontFamily: ('Cairo'),

                                          ) ,)
                                        ],
                                        )
                                    ),
                                  ],),
                                  Container(
                                    padding: EdgeInsets.only(bottom: 8),
                                    child: Row(children: <Widget>[
                                      Icon(Icons.location_on,color: Color(0xFF0D47A1),size: 18,),
                                      Text('   Location                         ',style:TextStyle(
                                        fontSize: 13,
                                        fontFamily: ('Cairo'),

                                      ) ,)
                                    ],
                                    ),
                                  )


                                ],),

                              ),

                            ],),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black26,
                                width: 0.5,

                              ),
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.all(Radius.circular(7)),

                            ),
                            padding: EdgeInsets.only(right: 0,bottom: 0,top: 0,left: 0),
                            width: 330,

                          ),
                        ],
                        ),
                        width: 350,
                        height: 160,
                      ),

                    ],
                  ),
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: 15,
            ),
          ) //horizontal list view
        ],
      ),
      bottomNavigationBar: bmnav.BottomNav(
        index: currentTab,
        labelStyle: LabelStyle(textStyle: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w700,fontSize: 11,color: Colors.black45),
            onSelectTextStyle: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w700,fontSize: 11,color: Color(0xFF0D47A1)),
        ),
        iconStyle: IconStyle(size: 16,onSelectColor: Color(0xFF0D47A1),onSelectSize: 20),
        elevation: 8,

        onTap: (i) {
          setState(() {
            currentTab = i;
            currentScreen = screens[i];
          });
        },
        items: [
          bmnav.BottomNavItem(IconData(0xe911, fontFamily: 'Fayicons'), label: 'Home'),
          bmnav.BottomNavItem(IconData(0xe90a, fontFamily: 'Fayicons'), label: 'My Classes'),
          bmnav.BottomNavItem(IconData(0xe90c, fontFamily: 'Fayicons'), label: 'Online'),
          bmnav.BottomNavItem(IconData(0xe90b, fontFamily: 'Fayicons'), label: 'Profile'),
          bmnav.BottomNavItem(IconData(0xe909, fontFamily: 'Fayicons'), label: 'Settings')
        ],
      ),
    );
  }
}
