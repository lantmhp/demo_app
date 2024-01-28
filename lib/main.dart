import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

import 'home.dart';
void main() {
  runApp(
    MaterialApp(
      home: myapp(),
      debugShowCheckedModeBanner: false,
    ),
  );

}

class myapp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _myappState();

}

class _myappState extends State<myapp> {

  final email = TextEditingController().obs;
  final pass = TextEditingController().obs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
            body: Container(
              color: Colors.white,
              child: Padding(padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image.asset('assets/images/img.png',
                          height: 150, width: 300),
                        const Text('Mapping your success', textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            )
                        ),

                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(top: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Email or Username',
                                  style: TextStyle(
                                    fontSize: 22 ,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                  controller: email.value,
                                  decoration: const InputDecoration(
                                    hintText: 'Nhập Email',
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                    ),
                                  )
                              ),
                              const SizedBox(height: 20),
                              const Text('Mật khẩu',
                                  style: TextStyle(
                                    fontSize: 22 ,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              const SizedBox(height: 10),
                              TextFormField(
                                controller: pass.value,
                                obscureText: true,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.check),
                                  hintText: 'Nhập Mật khẩu',
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                                  ),
                                ),

                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: const [
                            Text('Quên mật khẩu',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blueAccent,
                              ),)
                          ],
                        ),
                        const SizedBox(height: 20),
                        InkWell(
                          onTap: (){
                            login();
                          },
                          child: Container(
                            height: 50,
                            color: Colors.blue,
                            child: const Center(
                              child: Text('Đăng nhập'),
                            ),
                          ),
                        ),
                        // ElevatedButton(onPressed: cónCircularProgressIndicator(), child: Text('Login')),
                        const SizedBox(height: 20),

                        const Text('hoặc'),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _roundedImage('assets/images/logo1.png'),
                            const SizedBox(width: 30),
                            _roundedImage('assets/images/logo2.png'),
                            const SizedBox(width: 30),
                            _roundedImage('assets/images/logo3.png'),
                          ],
                        ),
                        const SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('Bạn chưa có tài khoản?',
                              style: TextStyle(
                                  fontSize: 20
                              ),),
                            Text(' Đăng ký',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.blue
                              ),)
                          ],
                        ),
                        const SizedBox(height: 30),
                        const Text('Được cung cấp bởi Tinasoft',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.blue,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.blue, // Màu sắc của đường gạch chân
                            decorationThickness: 1.5, // Độ dày của đường gạch chân
                          ),
                        ),
                        const SizedBox(height: 15),
                        const Text('v1.5.1'),
                      ],
                    ),
                  )
              ),
            )
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
  Widget _roundedImage(String imageUrl) {
    return ClipOval(
      child: Image.asset(
        imageUrl,
        height: 50,
        width: 50,
        fit: BoxFit.cover,
      ),
    );
  }


  void login()async{
    Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage())
    );
    // try{
    //   final res = await post(Uri.parse('https://reqres.in/api/login'),
    //       body: {
    //         'email' : email.value.text,
    //         'password' : pass.value.text,
    //       });
    //
    //   var data = jsonDecode(res.body);
    //   print(res.statusCode);
    //   print(data);
    //   if(res.statusCode == 200){
    //
    //
    //     ScaffoldMessenger.of(context).showSnackBar(
    //       const SnackBar(
    //         content: Text('Đăng nhập thành công'),
    //       ),
    //     );
    //   }else{
    //     Get.snackbar('Login Failed', data['error']);
    //   }
    // }catch(e){
    //   Get.snackbar('Exception', e.toString());
    // }
  }
}








