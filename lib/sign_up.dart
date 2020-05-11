import 'dart:math';

import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:authentication_app/constants.dart';
  bool _bigger= false;
 
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool showtext;
  IconData icon = Icons.lock_outline;


@override
  void initState() {
    super.initState();
    showtext = true;
  }

 
  @override
  Widget build(BuildContext context) {
    final size= MediaQuery.of(context).size;

           KeyboardVisibilityNotification().addNewListener(
             onHide: () {
               setState(() {
                         _bigger=false;

               });
    
      });
 
   
    return Scaffold(
        backgroundColor: kfirstColor,
        body: SafeArea(
                  child: Container(
            constraints: BoxConstraints.expand(),
      decoration:  const BoxDecoration(

          gradient:  LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
             kfirstColor,                   
            ksecondColor,
           
            ],
          ),),  
//TODO start here 
      child: OrientationBuilder(
          builder: (context,orientation){
              return  SingleChildScrollView(
                
                padding: orientation ==  Orientation.landscape ? 
                EdgeInsets.symmetric(horizontal: size.height * 0.5, vertical: (size.width / 2) * 0.06 ):
                EdgeInsets.symmetric(horizontal: (size.width / 2) * 0.1 ,vertical: size.height * 0.3),
                child: Column(
                     crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AnimatedContainer(
                   duration: Duration(seconds: 1),
                   curve: Curves.easeInOutCirc,
                     margin:
                     orientation ==  Orientation.portrait ? 
                     _bigger  ? 
                     EdgeInsets.symmetric(vertical: 0,horizontal: size.width  * 0.2):
                    
                     EdgeInsets.symmetric(vertical: (size.height  * 0.06) )
                     :
                       
                     EdgeInsets.symmetric(vertical:(size.width / 2) * 0.01, horizontal: (size.height / 4) * 0.02), 
                     
                     child: Text("Smiley",style: TextStyle(
                     fontWeight: FontWeight.bold,
                     color: kfirstColor,
                      fontSize: orientation ==  Orientation.portrait ?  _bigger ? 40.0 : 60.0
                                : 35.0
                  ),)),
                InputText("Email",Icon(Icons.email,color:kfirstColor),false,TextInputType.emailAddress,
                      ),
            
                InputText("password",Icon(icon,color: kfirstColor),showtext),
                Align(
                  alignment: Alignment.centerRight,
                       child: FlatButton(onPressed: (){
                    setState(() {
                 showtext = !showtext;
                 icon == Icons.lock_outline ? icon = Icons.lock_open : icon = Icons.lock_outline;
                    });

                  }, child:  Text(showtext ? "Show Password" :"Hide Password",
                       style:TextStyle(color:kfirstColor),),
                  
                  ),
                ),

            RaisedButton(
             onPressed: null, 
                color:  ksecondColor,

                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(45.0),
                    ),
                    padding:  orientation ==  Orientation.portrait ? 
                    EdgeInsets.symmetric(vertical:  size.height * 0.01,horizontal:size.width * 0.02): 
                    EdgeInsets.symmetric(vertical:  (size.width / 5) * 0.06,horizontal: (size.height / 2) * 0.02),
             child: Text("Sign Up",
             style: TextStyle(
            color: kfirstColor,
            fontWeight: FontWeight.bold,
            fontSize: 25.0
                
             ),
             )
             ),
                 SizedBox(height: (size.height /2)*0.1,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:<Widget>[
                       Text( "Already have an account?",style: TextStyle(fontSize: 15.0,color: kfirstColor)),
                       FlatButton(onPressed: null, 
                       child:  Text("Sign in",style: TextStyle(fontSize: 17.0,color: kfirstColor,
                       fontWeight: FontWeight.bold)
                       )
                       )
                      
                     ]
                   ),
                           
                           
                           
                           
                
            ],
        ),
              );
          }
      ),
      
    ),
        ),
        );
  }
}


class InputText extends StatefulWidget {
  final String label;
  final Widget iconData;
  final bool show;
  final TextInputType textType;
  InputText(this.label, this.iconData,   [this.show,this.textType]);
  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
   String errorText;
   bool error=false;
   String passwordValidator(String value) {
  if(value == null) {
  
    return 'Password Field is Empty';
  }
  if(value.length < 6) {
 
    return 'The password must contain at least 6 characters';
  }
   
  return null;
}


String emailValidator(String value) {
  //https://stackoverflow.com/questions/16800540/validate-email-address-in-dart
  
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value)) {
   return 'Invalid Email address';
  }
  return null;
}




  @override
  Widget build(BuildContext context) {         
    return Container(
                    
                      margin: EdgeInsets.symmetric(horizontal: 30.0,
                      vertical: 10.0),
                      child: TextField(
                      keyboardType: widget.textType,
                       obscureText: widget.show,
                    
                   decoration: new InputDecoration(
                              
                           focusedBorder: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                    const Radius.circular(45.0),
                                     ),
                                      borderSide: BorderSide(
                                      color: ksecondColor
                                   ),
                         ),
                        enabledBorder:  OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                    const Radius.circular(45.0),
                                     ),
                                     borderSide: BorderSide(
                                      color: kfirstColor,
                                   ),
                         ),
                       hintStyle: new TextStyle(color: kfirstColor),
                       errorText: errorText ,
                       
                       hintText: widget.label,
                       fillColor: Colors.white70,
                       prefixIcon: widget.iconData,
                       
                                                          
                  
                 ),
                 
                 onTap: (){
                   setState(() {
                      _bigger= true;

                   });
                  
               
                 },
                
                  onChanged: (inputText){
                    setState(() {
                        widget.textType ==
                      TextInputType.emailAddress ? errorText = emailValidator(inputText) :
                       errorText = passwordValidator(inputText);
                    });
                          
                  },
                 ),
                    );
  }
}