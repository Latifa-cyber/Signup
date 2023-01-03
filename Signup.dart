import 'package:flutter/material.dart';
import 'package:viva_app/home.dart';
import 'package:viva_app/Login.dart';
import 'forgotPassword1.dart';
//import 'package:firebase_auth/firebase_auth.dart';
//import 'package:viva_app/forgotPassword.dart';
class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
      backgroundColor: Color(0xFFFFF0C6),
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
                Expanded(
                  flex: 2,
                  child: Image(
                    image: AssetImage('signup.png'), height: 213, width: 220,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    height: 400.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0)),
                      color: Colors.white,

                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 10,),
                        Text('SIGN UP',
                            style: TextStyle(
                                fontSize: 35,
                                fontFamily: 'MontaguSlab',
                                color: Color(0xFFFFC727),
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
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Username',
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
                              suffixIcon: Icon(Icons.person, size: 17,),
                              border: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Color(0xFF120D3A), width: 2),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
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
                        SizedBox(height: 10,),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 15),
                          child: Text(
                            'Confirm Password',
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
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Already have an account? ", style: TextStyle(
                                fontFamily: 'MontaguSlab',
                                fontWeight: FontWeight.w200,
                                fontSize: 14,
                                color: Color(0xFF120D3A),
                              ),),
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
                                },
                                child: Text(
                                  'Log in',
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
                              padding: EdgeInsets.symmetric(horizontal: 32, vertical: 17),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xFFFFC727)
                              ),
                              child: Text('Sign Up',
                                style:
                                TextStyle(fontSize: 20, fontFamily: 'MontaguSlab', color: Color(0xFF120D3A), fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}