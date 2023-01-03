import 'package:flutter/material.dart';
import 'package:viva_app/home.dart';

import 'Signup.dart';
import 'forgotPassword1.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:viva_app/forgotPassword.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final keys=GlobalKey<FormState>();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  Login(context) async {
    /*if(keys.currentState!.validate()){
      keys.currentState!.save();
      try {
        UserCredential userX = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email.text, password: password.text);
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login successful')));
        Navigator.of(context).pushReplacementNamed('home');
        return userX;
      }
      on FirebaseAuthException catch(e){
        if(e.code=='user-not-found'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("this email does not exist")));
        }
        else if(e.code=='wrong-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("You've entered a wrong password")));
        }


      }
      catch(e){
        print(e);
      }

    }
    else{
      print('not valid');
    }
     */

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFFDBE7F5),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: keys,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage('login.png'),
                ),

                Text('Login',
                    style: TextStyle(
                        fontSize: 35,
                        fontFamily: 'MontaguSlab',
                        color: Color(0xFF3D3DDA),
                        fontWeight: FontWeight.w600)),
                SizedBox(height: 10,),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Email',

                    style: TextStyle(
                      fontFamily: 'MontaguSlab',
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Color(0xFF120D3A),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: TextFormField(
                    controller: email,
                    validator: (controller){
                      if(controller!.isEmpty){
                        return 'Please fill this field';
                      }
                      else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@univ-constantine2.dz").hasMatch(controller.toString())){
                        return 'only emails ending with @university-constantine2.dz \n are allowed';
                      }
                      else{
                        return null;
                      }
                    },
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.email, size: 17,),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF120D3A), width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 15),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: 'MontaguSlab',
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: Color(0xFF120D3A),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  height: 50,
                  child: TextFormField(
                    controller: password,
                    validator: (controller){
                      if(controller!.isEmpty){
                        return 'Please fill this field';
                      }
                      else{
                        return null;
                      }
                    },
                    obscureText: true,
                    style: TextStyle(fontWeight: FontWeight.w100, fontSize: 16),
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderSide:
                          BorderSide(color: Color(0xFF120D3A), width: 2),
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(right: 15),
                  child: TextButton(
                      onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>forgotPassword()));
                      }, child: Text(
                    'Forgot password?',
                    style: TextStyle(
                      fontFamily: 'MontaguSlab',
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xFF120D3A),
                    ),
                  )),
                ),

                Container(
                  width: 200,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: GestureDetector(
                    onTap: () async{

                      /*UserCredential user=  await Login(context);
                      print(user.user!.emailVerified);
                      if(user!= null){
                        Navigator.push(context, MaterialPageRoute(builder: (cpntext)=>Home()));
                      }
                      else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Failed')));
                      } */
                    },
                    child: Container(
                      padding: EdgeInsets.only(top: 17, bottom: 17, left: 65, right: 65),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFF3D3DDA),
                            Color(0xFF120D3A),
                          ],
                        ),
                      ),
                      child: Text('Login',
                        style:
                        TextStyle(fontSize: 20, fontFamily: 'MontaguSlab', color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account? ", style: TextStyle(
                        fontFamily: 'MontaguSlab',
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        color: Color(0xFF120D3A),
                      ),),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => Signup()));
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'MontaguSlab',
                            fontWeight: FontWeight.w800,
                            fontSize: 14,
                            color: Color(0xFF120D3A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}