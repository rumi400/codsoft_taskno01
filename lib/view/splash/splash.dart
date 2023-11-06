import 'package:flutter/material.dart';
import 'package:flutter_hive_tdo/view/home/home_view.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white,
                  Colors.blue
                  ,
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    // height: 50,
                    // width: 50,
                    child: Image.asset("assets/img/1.png", )
                ),
                const SizedBox(height: 15,),
                const Text("Todo App",style: TextStyle(fontSize: 30,color: Colors.white,fontWeight: FontWeight.bold,), ),
                const SizedBox(height: 15,),
                SizedBox(
                    width: MediaQuery.of(context).size.width*.60,
                    child: const LinearProgressIndicator())
              ],
            )
        )
    );

  }
startTimer() async
{
  await Future.delayed(const Duration(seconds: 3),(){
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  const HomeView()));
  });
}

}
