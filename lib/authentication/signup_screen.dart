import 'package:drivers_app/authentication/car_info_screen.dart';
import 'package:drivers_app/authentication/login_screen.dart';
import 'package:drivers_app/global/global.dart';
import 'package:drivers_app/widgets/progress_dialog.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpScreen extends StatefulWidget
{
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  TextEditingController confirmpasswordTextEditingController = TextEditingController();


  validateForm()
  {
    if(nameTextEditingController.text.length < 3)
      {
        Fluttertoast.showToast(msg: "Name must be atleast 3 characters.");
      }
    else if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(emailTextEditingController.text))
    {
      Fluttertoast.showToast(msg: "Email address is not valid.");
    }
    else if(phoneTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Phone is required.");
    }
    else if(phoneTextEditingController.text.length< 9)
      {
        Fluttertoast.showToast(msg: "Please enter valid phone");
      }
    else if(passwordTextEditingController.text.length < 6)
    {
      Fluttertoast.showToast(msg: "Password must be atleast 6 character.");
    }
    else if(confirmpasswordTextEditingController.text.isEmpty)
    {
      Fluttertoast.showToast(msg: "Please confirm password");
    }
    else if(passwordTextEditingController.text!= confirmpasswordTextEditingController.text)
      {
        Fluttertoast.showToast(msg: "Password do not match");
      }
    else{
      saveDriverInfoNow();
    }
  }

  saveDriverInfoNow() async
  {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c)
        {
          return ProgressDialog(message: "Processing, Please wait...",);
        }
    );

    final User? firebaseUser = (
        await fAuth.createUserWithEmailAndPassword(
          email:emailTextEditingController.text.trim(),
          password:passwordTextEditingController.text.trim(),
        ).catchError((msg){
          Navigator.pop(context);
          Fluttertoast.showToast(msg: "Error:"+ msg.toString());
        })
        ).user;


    if(firebaseUser!=null)
    {
      Map driverMap = {
        "id": firebaseUser.uid,
        "name": nameTextEditingController.text.trim(),
        "email": emailTextEditingController.text.trim(),
        "phone": phoneTextEditingController.text.trim(),
      };
     DatabaseReference driversRef= FirebaseDatabase.instance.ref().child("drivers");
     driversRef.child(firebaseUser.uid).set(driverMap);

     currentFirebaseUser = firebaseUser;
     Fluttertoast.showToast(msg: "Account has been created.");
      Navigator.push(context,MaterialPageRoute(builder: (c)=> CarInfoScreen()));

    }
    else
    {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Account has not been Created.");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
               const SizedBox(height: 10,),

              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset("images/logo1.png"),
              ),

              const SizedBox(height: 10,),

              const Text(
                "Register as a Driver",
                    style:TextStyle(
                  fontSize: 26,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
              ),
              ),

              TextField(
              controller: nameTextEditingController,
                style: const TextStyle(
                  color: Colors.white
                ),
                decoration: const InputDecoration(
                labelText: "Name",
                  hintText: "Name",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  hintStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                ),
              ),

              TextField(
                controller: emailTextEditingController,
                  keyboardType: TextInputType.emailAddress,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                    labelText: "Email",
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                ),
              ),

              TextField(
                controller: phoneTextEditingController,
                  keyboardType: TextInputType.phone,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                    labelText: "Phone",
                    hintText: "Phone",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                ),
              ),

              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                    labelText: "Password",
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                ),
              ),

              TextField(
                controller: confirmpasswordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(
                    color: Colors.white
                ),
                decoration: const InputDecoration(
                    labelText: "confirm Password",
                    hintText: "confirm Password",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                    ),
                    labelStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    )
                ),
              ),


              const SizedBox(height: 20,),

              ElevatedButton(
                onPressed: (){
                  validateForm();
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.lightGreenAccent,
                ),
                child: const Text(
                  "Create Account",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 18,
                  ),
                ),
              ),

              TextButton(
                  child:const Text(
                    "Already have an Account? Login Here",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: ()
                  {
                    Navigator.push(context,MaterialPageRoute(builder: (c)=> LoginScreen()));
                  }
              ),
            ],

          ),
        )
      )
    );
  }
}
