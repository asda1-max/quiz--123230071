import 'package:flutter/material.dart';
import 'package:quiz123230071/ui/home.dart';


class loginpage extends StatelessWidget {
  const loginpage({super.key});

  @override
  Widget build(BuildContext context) {
    
    final TextEditingController _username = TextEditingController();
    final TextEditingController _pw = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Login", style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),),
      ),
      body: ListView(

        children: [
          Container(
            margin: EdgeInsets.fromLTRB(40, 200, 0, 10),
            child: Text("Login Here", style: TextStyle(fontSize: 20, fontWeight: FontWeight(800)),),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 0, 10),
            child: Text("Welcome back, please enter your details here : ", style: TextStyle(fontSize: 12, fontWeight: FontWeight(400)),),
          ),
          Container(
            width: 350,
            margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: TextField(
              controller: _username,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your Username',
                label: Text("Username :")
              ),
            )
          ),
          
          //Container untuk Password
          Container(
            width: 350,
            margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
            child: TextField(
              obscureText: true,
              controller: _pw,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Your Password',
                label: Text("Password :")
              ),
            )
          ),
          Container(
            margin: EdgeInsets.fromLTRB(40, 0, 40, 10),
            width: 350,
            child: ElevatedButton(
              onPressed: (){
                if(_username.text == "071" && _pw.text == "071"){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Home(user: _username.text)));
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Wrong User Details, try : username = 071, password = 071'),
                        duration: Duration(seconds: 5),
                      ),
                    );
                }
              }, 
              child: Text('Login')),
          )
        ],
      ),
    );
  }
}