import 'package:flutter/material.dart';
import 'package:viva_app/Pages/home.dart';
import 'package:viva_app/Auth Pages/Login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final keys=GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _fullNameController = TextEditingController();
  @override
  void dispose(){
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _fullNameController.dispose();
    super.dispose();
  }
  Future SignUp() async {
    if(passwordConfirmed()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addUserDetails(_emailController.text.trim(), _fullNameController.text.trim());
     }
  }

  Future addUserDetails(String email, String username ) async{
    await FirebaseFirestore.instance.collection('users').add({
      'email': email,
      'username': username,
    });
  }

  bool passwordConfirmed(){
    if(_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    }
    else{
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFF0C6),
      body: SafeArea(
        maintainBottomViewPadding: true,
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
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int x){
                      return Column(
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
                          controller: _emailController,
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
                          'Full Name',
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
                          controller: _fullNameController,
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
                        controller: _passwordController,
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
                          controller: _confirmPasswordController,
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
                      );
                      },

        ),
      ),
    )
  ]
    )
    )
    )
    );
  }
}
