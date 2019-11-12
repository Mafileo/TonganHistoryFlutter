import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flare_flutter/flare_actor.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.red,
          textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'OpenSans',
              bodyColor: Colors.white,
              displayColor: Colors.white)),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class ContentCards extends StatefulWidget {
  String subtitle;
  int number;
  String name;
  String animationImage;
  bool show;
  List<String> s = new List();
  String menuImage;

  List<String> animationImages = new List();

  ContentCards({this.name});

  @override
  _ContentState createState() => _ContentState(
      this.name,
      this.subtitle,
      this.number,
      this.show,
      this.s,
      this.animationImage,
      this.animationImages,
      this.menuImage);
}

class _ContentState extends State<ContentCards>
    with SingleTickerProviderStateMixin {
  double h = 150;
  bool show = false;
  String title = "";
  String subTitles = "";
  int index;
  int subcount;
  String expndString = "";
  List<String> strs = new List();
  AnimationController _animationController;

  String animationImage = "";
  List<String> animationImages = new List();

  String menuImage = "";

  set str(String st) {
    this.strs.add(st);
  }

  @override
  initState() {
    super.initState();
    _animationController = new AnimationController(
        duration: Duration(milliseconds: 1000), vsync: this);
  }

  _ContentState(
      String title,
      String subTitle,
      int number,
      bool show,
      List<String> s,
      String animationImage,
      List<String> animationImages,
      String menuImage) {
    this.title = title;
    this.index = number;
    this.subTitles = subTitle;
    this.show = show;
    this.strs = s;
    this.menuImage = menuImage;

    this.animationImage = animationImage;
    this.animationImages = animationImages;
    //this.strs.add("value");
    // for(String string in s){
    //   this.strs.add(string);
    // }
  }

  // @override
  // void initState(){
  //   super.initState();
  //   _animationController = AnimationController(
  //     vduration: Duration(milliseconds: 300)
  //   );
  // }

  Widget icon() {
    if (this.show == true) {
      return AnimatedIcon(
        color: Colors.black,
        icon: AnimatedIcons.add_event,
        progress: _animationController,
      );
    } else {
      return Text("");
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> str = new List();

    str = strs;

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      margin: EdgeInsets.all(10.0),
      elevation: 3.0,
      child: Stack(
        children: <Widget>[
         // Image.asset('assets/images/tongan.jpg'),

            Positioned.fill(
              child: FlareActor(
                'assets/animations/'+this.menuImage+'.flr',
                alignment: Alignment.center,
                fit: BoxFit.contain,
                animation: 'Untitled',
              ),
           ),

          Positioned.fill(
            child: Container(
              height: 300,
              width: 300,
              color: Colors.white60,
            ),
          ),

          Center(
            child: AnimatedContainer(
              height: h,
              duration: Duration(seconds: 1),
              curve: Curves.easeInOutBack,
              child: InkWell(
                splashColor: Colors.red,
                onTap: () {
                  setState(() {
                    if (this.show == true) {
                      if (h == 150) {
                        if (str[0] == "Early Culture") {
                          h = 460;
                        } else if (str[0] == "Kingdom of Tonga: 1900–1970") {
                          h = 300;
                        } else if (str[0] == "2002 Election") {
                          h = 460;
                        }
                      } else {
                        h = 150;
                        print("200");
                      }
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PreContact(this.index,
                                  'content.json', this.animationImage)));
                    }
                  });
                },
              ),
            ),
          ),

          Positioned(
            left: 40,
            top: 90,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      icon(),
                      Text(
                        this.title,
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  _list(str)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _list(List<String> strings) {
    //if(this.show == true){
    List<Widget> list = new List();
    for (int i = 0; i < strings.length; i++) {
      list.add(new Center(
        child: Container(
          height: 50,
          child: Row(
            children: <Widget>[
              InkWell(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.arrow_right,
                      size: 17,
                      color: Colors.black,
                    ),
                    SizedBox(width: 5),
                    Text(
                      strings[i],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                onTap: () {
                  if (strings[0] == "Kingdom of Tonga: 1900–1970") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreContact(i,
                                'twenthcentry.json', this.animationImages[i])));
                  } else if (strings[0] == "Early Culture") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreContact(i,
                                'earlycontact.json', this.animationImages[i])));
                  } else if (strings[0] == "2002 Election") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PreContact(i,
                                'twentyfirst.json', this.animationImages[i])));
                  }
                },
              ),
            ],
          ),
        ),
      ));
    }
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: list);

    //}
  }
}

class _MyHomePageState extends State<MyHomePage> {
  double h = 150;
  double i = 150;
  bool show = false;
  int fileNum;

  String animationName = "";

  ContentCards preContact = new ContentCards();
  ContentCards earlyCulture = new ContentCards();
  ContentCards tonganEmpire = new ContentCards();
  ContentCards europeanChrist = new ContentCards();
  ContentCards unification = new ContentCards();
  ContentCards twenthCentry = new ContentCards();
  ContentCards twentyFirst = new ContentCards();

  ImportantPeopleContent queenSalote = new ImportantPeopleContent(
      "Queen Sālote", 0, "importantpeople", "QueenSaloteTupou");
  ImportantPeopleContent georgeTupou = new ImportantPeopleContent(
      "George Tupou I", 1, "importantpeople", "GeorgeTupou");
  ImportantPeopleContent akilisiPohiva = new ImportantPeopleContent(
      "ʻAkilisi Pōhiva", 2, "importantpeople", "AkilisiPohiva");
  ImportantPeopleContent jonahLomu = new ImportantPeopleContent(
      "Jonah Lomu", 3, "importantpeople", "JonahLomu");
  ImportantPeopleContent haku =
      new ImportantPeopleContent("King Haku", 4, "importantpeople", "Haku");

  @override
  void initState() {
    print("I HAVE BEEN CALLLED");

    preContact.name = "Pre-contact";
    preContact.animationImage = 'PreContact';
    preContact.menuImage = 'PreContact';
    preContact.show = false;
    preContact.number = 0;

    earlyCulture.name = "Early Culture";
    earlyCulture.menuImage = 'EarlyCulture';
    earlyCulture.animationImages.add('EarlyCulture');
    earlyCulture.animationImages.add('OldTonga');
    earlyCulture.animationImages.add('LapitaCulture');
    earlyCulture.animationImages.add('PolynesianPlain');
    earlyCulture.animationImages.add('DarkAge');
    earlyCulture.s.add("Early Culture");
    earlyCulture.s.add("The Old Tonga");
    earlyCulture.s.add("The Lapita Period");
    earlyCulture.s.add("The Polynesian Plain:\n700 BC - 400 AD");
    earlyCulture.s.add("The Formative Dark Age:\n400 BC - 1200 AD");
    earlyCulture.show = true;
    //earlyCulture.number = 1;

    tonganEmpire.name = "Tongan Maritime Empire";
    tonganEmpire.menuImage = 'TonganEmpire';
    tonganEmpire.animationImage = 'TonganEmpire';
    tonganEmpire.show = false;
    tonganEmpire.number = 1;

    europeanChrist.name = "European arrival &\nChristianization";
    europeanChrist.menuImage = 'JamesCook';
    europeanChrist.animationImage = 'JamesCook';
    europeanChrist.show = false;
    europeanChrist.number = 2;

    unification.name = "Unification";
    unification.menuImage = 'KingGeorgeTupou';
    unification.animationImage = 'KingGeorgeTupou';
    unification.show = false;
    unification.number = 3;

    twenthCentry.name = "20th Century";
    twenthCentry.menuImage = 'KingdomOfTonga';
    twenthCentry.animationImages.add('Isolation');
    twenthCentry.animationImages.add('KingdomOfTonga');
    twenthCentry.s.add("Kingdom of Tonga: 1900–1970");
    twenthCentry.s.add("Independence: 1970");
    twenthCentry.show = true;
    //twenthCentry.number = 5;

    twentyFirst.name = "21st Century";
    twentyFirst.menuImage = 'NewsMedia';
    twentyFirst.animationImages.add('NewsMedia');
    twentyFirst.animationImages.add('FeletiSevele');
    twentyFirst.animationImages.add('TonganRiot2006');
    twentyFirst.animationImages.add('TonganRiot2006');
    twentyFirst.s.add("2002 Election");
    twentyFirst.s.add("2005 Election");
    twentyFirst.s.add("2006 Riots");
    twentyFirst.s.add("2008 Election");
    twentyFirst.s.add("Democratisation and\n2010 Elections");
    twentyFirst.show = true;
    //twentyFirst.number = 6;

    super.initState();
  }

  void _loopAnimation() {
    setState(() {
      animationName = "Untitled";
    });
  }

  @override
  Widget build(BuildContext context) {
    _loopAnimation();
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
              height: 300,
              color: Colors.white,
            ),
            CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  floating: false,
                  pinned: true,
                  expandedHeight: 200.0,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    background:
                        //Image.asset('assets/images/tongan.jpg', fit: BoxFit.cover),
                        Container(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 25),
                      height: 300,
                      width: 500,
                      color: Colors.white,
                      child: FlareActor(
                        'assets/animations/KingdomOfTongaMenu.flr',
                        alignment: Alignment.center,
                        fit: BoxFit.scaleDown,
                        animation: animationName,
                      ),
                    ),
                    title: Text(
                      "Kingdom Of Tonga",
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Divider(),
                    SizedBox(height: 10),
                    Container(
                      height: 30,
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text(
                        "Important People of Tonga",
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          //fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            SizedBox(width: 10),
                            queenSalote,
                            SizedBox(width: 10),
                            georgeTupou,
                            SizedBox(width: 10),
                            akilisiPohiva,
                            SizedBox(width: 10),
                            jonahLomu,
                            SizedBox(width: 10),
                            haku,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      SizedBox(height: 10),
                      Divider(),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        height: 40,
                        child: Text(
                          "Tongan History",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                      ),
                      preContact,
                      earlyCulture,
                      tonganEmpire,
                      europeanChrist,
                      unification,
                      twenthCentry,
                      twentyFirst,
                      Container(
                        height: 10,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PreContact extends StatefulWidget {
  int fileIndex;
  String s;
  String animatedimage;
  String image;

  PreContact(this.fileIndex, this.s, this.animatedimage) {
    createState();
  }

  @override
  _PreContact createState() =>
      _PreContact(this.fileIndex, this.s, this.animatedimage);
}

class _PreContact extends State<PreContact> {
  String fileContents = "";
  String s = "";
  int fileIndex;
  String animaitonName;
  String animatedImage;
  String image;
  bool constructOneIsCalled = false;

  _PreContact(int index, String s, String animatedImage) {
    this.fileIndex = index;
    this.s = s;
    this.animatedImage = animatedImage;
    this.constructOneIsCalled = true;
    print(this.constructOneIsCalled.toString() + 'sfsdfs' + this.s);
  }

  void _loopAnimation() {
    setState(() {
      animaitonName = "Untitled";
    });
  }

  @override
  Widget build(BuildContext context) {
    _loopAnimation();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future:
                  DefaultAssetBundle.of(context).loadString('load_json/' + s),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //title
                          Container(
                            //padding: EdgeInsets.all(150),
                            height: 300,
                            width: 500,
                            color: Colors.white,
                            child: FlareActor(
                              'assets/animations/' +
                                  this.animatedImage +
                                  '.flr',
                              alignment: Alignment.center,
                              fit: BoxFit.scaleDown,
                              animation: animaitonName,
                            ),
                          ),

                          //Title
                          Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  mydata[fileIndex]['title'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  mydata[fileIndex]['subtitle'],
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.black54,
                                  ),
                                ),
                                Divider(
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(15),
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        mydata[fileIndex]['body'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            wordSpacing: 4,
                                            height: 1.7,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : 1,
                );
              }),
        ),
      ),
    );
  }
}

class ImportantPeopleContent extends StatelessWidget {
  int fileIndex;
  String name = "";
  String jsonFile = "";
  String imageName = "";

  ImportantPeopleContent(String name, int fileIndex, String jF, String iN) {
    this.name = name;
    this.fileIndex = fileIndex;
    this.jsonFile = jF;
    this.imageName = iN;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          InkWell(
            //splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ImportantPeople(this.fileIndex,
                          this.jsonFile + '.json', this.imageName)));
            },
            child: CircleAvatar(
              radius: 43,
              backgroundColor: Colors.red,
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white,
                child: ClipOval(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      'assets/images/' + this.imageName + '.jpg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Text(
            this.name,
            style: TextStyle(color: Colors.black, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class ImportantPeople extends StatelessWidget {
  int fileIndex;
  String jsonFile = "";
  String imageName = "";

  ImportantPeople(int fileIndex, String jF, String iN) {
    this.fileIndex = fileIndex;
    this.jsonFile = jF;
    this.imageName = iN;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('load_json/' + this.jsonFile),
              builder: (context, snapshot) {
                var mydata = json.decode(snapshot.data.toString());

                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //title
                          Container(
                              //padding: EdgeInsets.all(150),
                              height: 300,
                              width: 500,
                              color: Colors.white,
                              child: Image.asset(
                                  'assets/images/' + this.imageName + '.jpg')),

                          //Title
                          Container(
                            padding: EdgeInsets.all(20),
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  mydata[fileIndex]['title'],
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Divider(
                                  color: Colors.black45,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(15),
                                  color: Colors.white,
                                  child: Column(
                                    children: <Widget>[
                                      Text(
                                        mydata[fileIndex]['body'],
                                        style: TextStyle(
                                            fontSize: 17,
                                            wordSpacing: 4,
                                            height: 1.7,
                                            color: Colors.black54),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: mydata == null ? 0 : 1,
                );
              }),
        ),
      ),
    );
  }
}
