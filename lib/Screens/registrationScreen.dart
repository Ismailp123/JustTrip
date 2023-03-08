import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:justtrip/Screens/loginScreen.dart';
import 'package:justtrip/Screens/mainscreen.dart';
class RegistrationScreen extends StatelessWidget {
  static const String idScreen = "register";
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 15.0,),
          Image(
            image: AssetImage("images/logo.png"),
            width: 300.0,
            height: 150.0,
            alignment: Alignment.center,
          ),
          SizedBox(height: 1.0,),
          Text(
            "Register as a Rider",
            style:TextStyle(fontSize: 24.0,fontFamily: "Brand Bold"),
            textAlign: TextAlign.center,

          ),
          Padding(padding: EdgeInsets.all(20.0),child:Column(
            children: [SizedBox(height:1.0,),
              TextField(
                controller: nameTextEditingController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Name",
                    labelStyle: TextStyle(
                      fontSize: 14.0,

                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,

                    )
                ),
                style: TextStyle(fontSize: 14.0),
              ),

              SizedBox(height:1.0,),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 14.0,

                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,

                    )
                ),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height:1.0,),
              TextField(
                controller: phoneTextEditingController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Phone",
                    labelStyle: TextStyle(
                      fontSize: 14.0,

                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,

                    )
                ),
                style: TextStyle(fontSize: 14.0),
              ),
              SizedBox(height:1.0,),
              TextField(
                controller: passwordTextEditingController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    labelStyle: TextStyle(
                      fontSize: 14.0,

                    ),
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 10.0,

                    )
                ),
                style: TextStyle(fontSize: 14.0),
              ),

              SizedBox(height: 1.0,),
              ElevatedButton(
                child: Text('Create Account'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                ),

                onPressed: () {
                  if(nameTextEditingController.text.length<3)
                    {
                      displayToastMessage("name must be atleast 3 characters", context);
                      //Fluttertoast.showToast(msg: "Name must be atleast 6 characters");
                    }
                  else if(!emailTextEditingController.text.contains("@"))
                    {
                      displayToastMessage("Email address is not valid.", context);
                    }
                  else if(phoneTextEditingController.text.isEmpty)
                    {
                      displayToastMessage("Phone number is mandory.", context);
                    }
                  else if(passwordTextEditingController.text.length<6)
                  {
                    displayToastMessage("Password must be atleast 6 characters.", context);
                  }
                  else {
                    registerNewUser(context);
                  }
                },
              ),

            ],
          ),
          ),
          TextButton(
            child: Text(
              "Already have an account. Login here",
              style: TextStyle(fontSize: 18),
            ),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
            },
            style: TextButton.styleFrom(
                foregroundColor: Colors.black,
                elevation: 0,
                backgroundColor: Colors.white),
          ),
        ],
      ),
    );
  }
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void registerNewUser(BuildContext context) async
  {
    final User firebaseUser = (await _firebaseAuth.createUserWithEmailAndPassword(email: emailTextEditingController.text, password: passwordTextEditingController.text)).catchError((errMsg){
      displayToastMessage("Error:"+errMsg.toString(), context);
    })).user;
  }

  if(firebaseUser != null)
  {
  usersRef.child(firebaseUser.uid);
  Map userDataMap = {
  "name":nameTextEditingController.text.trim(),
  "email":emailTextEditingController.text.trim(),
  "phone":phoneTextEditingController.text.trim(),
  };
  usersRef.child(firebaseUser.uid).set(userDataMap);
  displayToastMessage("Congratulations,your account has been created.", context);
  Navigator.pushNamedAndRemoveUntil(context, MainScreen.idScreen, (route) => false);
  //save user info to database
  }
  else
  {
    displayToastMessage("New user account has not been created.", context);
    //error occured - display msg
  }

  displayToastMessage(String message,BuildContext context)
  {
    Fluttertoast.showToast(msg: message);
  }
}

