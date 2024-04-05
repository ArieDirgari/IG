import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Padding(padding: EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 30),
            child: Text('Instagram', style: TextStyle(fontSize: 50, fontFamily: 'IG'),),),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Nomor telepon, email atau nama pengguna', border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 15,),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Kata Sandi',border: OutlineInputBorder()
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: (){},
              child: Text('Masuk', style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold, fontSize: 16),),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),))
           ],
        ),),),
      );
    }
  }