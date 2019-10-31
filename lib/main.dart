import "package:flutter/material.dart";
void main()=>runApp(new MyApp());
//lemda expression for enanomous  function
class MyApp extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      //we deal with material apps only
      home:new LoginPage(),//front scrren which will be visible
      theme:new ThemeData(
        primarySwatch: Colors.blue

      )
    );
  }

}
class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()
  {
    return (new LoginPageState());
  }

}
class LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  //with keyword is used for mixing
  //SingleTickerProviderStateMixin---only one animation controller
  //TickerProviderStateMixin---------multiple animation controller
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;


  @override
  void initState() {
    super.initState();//super method
    _iconAnimationController =new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 250),//0.5 sec
    );
    //it will create  animation controller and it will have the value,duration ,debug level  for current context

  _iconAnimation=new CurvedAnimation
    ( parent: _iconAnimationController,
      curve:Curves.easeOut);
  //we have more animations such as --clean curve ,curve ,etc


  //now  we need to add a listener to change the state of an animation
    _iconAnimation.addListener(()=>this.setState((){}));
    _iconAnimationController.forward();//this tell the animation controller to do the animation forwards



  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
backgroundColor: Colors.black,
body: new Stack(
  fit:StackFit.expand,
  //we have two layouts which overlap each other
  children: <Widget>[
  new Image(
    image: new AssetImage("assets/girl.jpg"),
    fit: BoxFit.cover,
    color: Colors.black87,
    colorBlendMode: BlendMode.darken,

  ),
    Container(
      padding: const EdgeInsets.all(40.0),
      child: new Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
        new FlutterLogo(
          size:_iconAnimation.value*100//value from 0-1(*by 100 so that we can see the animation)

        ),
      new Form(
        child:
            new Theme(
              //to make components visible we used theme here
              data: new ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.teal,
                
                inputDecorationTheme:InputDecorationTheme(
                  //only for text fields 
                    labelStyle: new TextStyle(
                      color: Colors.teal,
                      fontSize:20
                  )
                ) 
                  
                
              ),
              child: new Column(
                crossAxisAlignment:CrossAxisAlignment.center,

        
        
        children: <Widget>[
          new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Email",
              ),
              keyboardType:TextInputType.emailAddress,

          ),


          new TextFormField(
              decoration: new InputDecoration(
                labelText: "Enter Password",

              ),
              keyboardType:TextInputType.text,
              obscureText: true,//eco_code applied

          ),
new Padding(padding: const EdgeInsets.only(top:40.0)),
          new MaterialButton(
            height: 40,
            minWidth: 100.0,
            color:Colors.teal,
            textColor: Colors.white,
            child:(new Icon(Icons.arrow_forward)),
            onPressed: ()=>{},
            splashColor: Colors.redAccent,

          )
      ],
        ),
            )




      )

      ],

      ),
    )


  ],
  ),
    );
  }
}
