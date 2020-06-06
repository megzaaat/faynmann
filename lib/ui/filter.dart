import 'package:bmnav/bmnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:bmnav/bmnav.dart' as bmnav;
import 'package:faynmann/ui/mainpage.dart';



class Filter extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return Filteration();
  }

}

class Filteration extends State<Filter>{
  int _selectedpage = 0;
  int currentTab = 0;
  final List<Widget> screens = [
    MainPage(), MainPage(), MainPage(), MainPage(),MainPage()
  ];
  Widget currentScreen = MainPage();

  void _onItemTapped(int index) {
    setState(() {
      _selectedpage = index;
    });
  }
  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Scaffold(
      body: new Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height*0.1,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: <Color>[
                      Color(0xFF1A2E58),
                      Color(0xFF0052a3),
                      Color(0xFF0059B1),
                    ],
                  ),

                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(50.0),)


              ),
              child: new Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                        child:Row(children: <Widget>[
                          IconButton(
                            icon: new Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            color: Colors.white,
                            onPressed: (){
                              Navigator.pop(context);
                            },
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 0),
                            child: Text(
                              "Teachers",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: ('Cairo')
                              ),
                            ),
                          ),
                        ],)
                    ),
                    IconButton(
                      padding:EdgeInsets.only(right:MediaQuery.of(context).size.width*0.08),
                      icon: new Icon(
                        Icons.notifications,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),//header
            Row(children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                padding: EdgeInsets.only(left: 12, top: 10),
                child: Icon(Icons.filter_list,size: 35,color: Color(0xFF707070),),
              ),
              Container(
                  padding: EdgeInsets.only(left: 5,top: 10),
                  child: Text('filters',style: TextStyle(
                      color: Color(0xFF707070),
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      fontFamily: ('Cairo')

                  ),)
              ),

            ],),
            Container(
              width: 400,
              height: 620,
              child: TeachersList(),

            )//filters

          ],),
      ),
      bottomNavigationBar: Container(
        child: bmnav.BottomNav(
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
      )
    );
  }

}
class TeachersList extends StatefulWidget {
  @override
  _TeachersListState createState() => _TeachersListState();
}

class _TeachersListState extends State<TeachersList> {
  final _list_teachers =[
    {
      'name':'Mr. Hassan mohamed',
      'time':'time1',
      'pic':'images/etsh.jpg'
    },
    {
    'name':'Mr. Ahmed Magdy',
    'time':'time2',
    'pic':'images/etsh2.jpg'

    },
    {
    'name':'Mr. mohamed ahmed',
    'time':'time3',
    'pic':'images/etsh3.jpg'
    },
    {
    'name':'Mr. Ahmed hassan',
    'time':'time4',
    'pic':'images/etsh4.jpg'

    },
    {
    'name':'Mr. Hassan khaled',
    'time':'time5',
    'pic':'images/etsh5.jpg'
    },
    {
      'name':'Mr. mohamed mahmoud',
      'time':'time1',
      'pic':'images/etsh4.jpg'
    },
    {
      'name':'Mr. Hassan wael',
      'time':'time1',
      'pic':'images/etsh.jpg'
    },
    {
      'name':'Mr. Ahmed moneer',
      'time':'time1',
      'pic':'images/etsh2.jpg'
    },
    {
      'name':'Mr. Hassan alaa',
      'time':'time1',
      'pic':'images/etsh5.jpg'
    },
    {
      'name':'Mr. Ahmed Maher',
      'time':'time1',
      'pic':'images/etsh3.jpg'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          itemCount: _list_teachers.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
              mainAxisSpacing: MediaQuery.of(context).size.width*0.01,
              crossAxisSpacing: 6,childAspectRatio: 0.80
          ),
          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.012,left: MediaQuery.of(context).size.width*0.012 ,
            top:  MediaQuery.of(context).size.width*0.01,bottom: MediaQuery.of(context).size.height*0.3
          ),

          itemBuilder: (BuildContext context, int index){
            return TeachersDetails(
              teacher_name: _list_teachers[index]['name'],
              teacher_pic: _list_teachers[index]['pic'],
              teacher_time: _list_teachers[index]['time'],
            );
          }),
    );
  }
}

class TeachersDetails extends StatelessWidget {
  final teacher_name;
  final teacher_pic;
  final teacher_time;
  TeachersDetails({
    this.teacher_name,
    this.teacher_pic,
    this.teacher_time
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Card(
        margin: EdgeInsets.all(MediaQuery.of(context).size.width*0.009),
        color: Colors.red,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        child: Hero(
            tag: teacher_name,
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child:InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: (){},
                child: GridTile(
                    footer: Container(
                      height: 76,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(5)),
                        color: Colors.white,
                      ) ,
                      padding: EdgeInsets.only(top:7),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child:Text(teacher_name,style: TextStyle(fontFamily: 'Cairo',fontSize: 13,fontWeight: FontWeight.bold,color:Colors.black45),),

                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left:10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child:Icon(Icons.fiber_manual_record,color: Colors.lightGreen,size: 12,textDirection: TextDirection.ltr,),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('Available',style: TextStyle(fontFamily: 'Cairo',color: Colors.lightGreen,fontSize: 11),)
                                )
                              ],),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child:Text('Subject Name(Department)',style: TextStyle(fontFamily: 'Cairo',color: Colors.black38,fontSize: 9,fontWeight: FontWeight.bold),)
                            ,
                          ),
                        ],
                      ),

                    ),
                    child: Container(
                        padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height*0.08),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        ) ,

                        child:Image.asset(teacher_pic,fit: BoxFit.cover,)
                    )
                ),
              ),
            )
        ),
      ),
    );
  }
}









class TeachersTabList extends StatefulWidget {
  @override
  _TeachersTabListState createState() => _TeachersTabListState();
}

class _TeachersTabListState extends State<TeachersTabList> {
  final _list_teachers =[
    {
      'name':'Mr. Hassan mohamed',
      'time':'time1',
      'pic':'images/etsh.jpg'
    },
    {
      'name':'Mr. Ahmed Magdy',
      'time':'time2',
      'pic':'images/etsh2.jpg'

    },
    {
      'name':'Mr. mohamed ahmed',
      'time':'time3',
      'pic':'images/etsh3.jpg'
    },
    {
      'name':'Mr. Ahmed hassan',
      'time':'time4',
      'pic':'images/etsh4.jpg'

    },
    {
      'name':'Mr. Hassan khaled',
      'time':'time5',
      'pic':'images/etsh5.jpg'
    },
    {
      'name':'Mr. mohamed mahmoud',
      'time':'time1',
      'pic':'images/etsh4.jpg'
    },
    {
      'name':'Mr. Hassan wael',
      'time':'time1',
      'pic':'images/etsh.jpg'
    },
    {
      'name':'Mr. Ahmed moneer',
      'time':'time1',
      'pic':'images/etsh2.jpg'
    },
    {
      'name':'Mr. Hassan alaa',
      'time':'time1',
      'pic':'images/etsh5.jpg'
    },
    {
      'name':'Mr. Ahmed Maher',
      'time':'time1',
      'pic':'images/etsh3.jpg'
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _list_teachers.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 4,crossAxisSpacing: 6,childAspectRatio: 0.80),
        padding: EdgeInsets.only(right: 5,left:5 ,top: 8),
        itemBuilder: (BuildContext context, int index){
          return TeachersDetails(
            teacher_name: _list_teachers[index]['name'],
            teacher_pic: _list_teachers[index]['pic'],
            teacher_time: _list_teachers[index]['time'],
          );
        });
  }
}

class TeachersTabDetails extends StatelessWidget {
  final teacher_name1;
  final teacher_pic1;
  final teacher_time1;
  TeachersTabDetails({
    this.teacher_name1,
    this.teacher_pic1,
    this.teacher_time1
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        margin: EdgeInsets.all(5),
        color: Colors.red,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),

        ),
        child: Hero(
            tag: teacher_name1,

            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child:InkWell(
                borderRadius: BorderRadius.circular(5),
                onTap: (){},
                child: GridTile(
                    footer: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(5)),
                        color: Colors.white,
                      ) ,
                      padding: EdgeInsets.only(top: 2),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child:Text(teacher_name1,style: TextStyle(fontFamily: 'Cairo',fontSize: 13,fontWeight: FontWeight.bold,color:Colors.black45),),

                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left:10),
                            child: Row(
                              children: <Widget>[
                                Container(
                                  child:Icon(Icons.fiber_manual_record,color: Colors.lightGreen,size: 12,textDirection: TextDirection.ltr,),
                                ),
                                Container(
                                    padding: EdgeInsets.only(left: 4),
                                    child: Text('Available',style: TextStyle(fontFamily: 'Cairo',color: Colors.lightGreen,fontSize: 11),)
                                )
                              ],),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 10),
                            child:Text('Subject Name(Department)',style: TextStyle(fontFamily: 'Cairo',color: Colors.black38,fontSize: 9,fontWeight: FontWeight.bold),)
                            ,
                          ),
                        ],
                      ),

                    ),
                    child: Container(
                        padding: EdgeInsets.only(bottom: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(10),bottomLeft: Radius.circular(10)),
                        ) ,

                        child:Image.asset(teacher_pic1,fit: BoxFit.cover,)
                    )
                ),
              ),
            )
        ),
      ),
    );
  }
}



