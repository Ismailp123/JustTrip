import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SizedBox(height: 45.0,),
          Image(
            image: AssetImage("images/logo.png"),
            width: 500.0,
            height: 250.0,
            alignment: Alignment.center,
          ),
          SizedBox(height: 1.0,),
          Text(
            "Login as a Rider",
            style:TextStyle(fontSize: 24.0,fontFamily: "Brand Bold"),
            textAlign: TextAlign.center,

          ),
          Padding(padding: EdgeInsets.all(20.0),child:Column(
            children: [
              SizedBox(height:1.0,),
              TextField(
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
                obscureText: true,
                keyboardType: TextInputType.emailAddress,
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
                child: Text('Login'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow,
                ),

                onPressed: () {},
              ),
              TextButton(
                child: Text(
                  "Do not have an account. Register here",
                  style: TextStyle(fontSize: 25),
                ),
                onPressed: () {},
                style: TextButton.styleFrom(
                    foregroundColor: Colors.red,
                    elevation: 2,
                    backgroundColor: Colors.amber),
              ),
            ],
          ))

        ],
      ),
    );
  }
}

