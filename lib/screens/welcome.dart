import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      headerBackgroundColor: Colors.white,
      finishButtonText: 'Login',
      finishButtonStyle: FinishButtonStyle(
        backgroundColor: Colors.black,
      ),
      onFinish: (){
        Navigator.pushNamed(context, '/login');
      },
      skipTextButton: Text('ข้าม'),
      // trailing: Text('Login'),
      centerBackground: true,
      background: [
        Image.asset('assets/images/slider1.png', height: 400),
        Image.asset('assets/images/slider2.png', height: 400),
        Image.asset('assets/images/slider3.png', height: 400)
      ],
      totalPage: 3,
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
              ),
              Text(
                'Wait for Fun',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
              ),
              Text(
                'Wait for Learn',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 400,
              ),
              Text(
                'Wait for Free',
                style: TextStyle(fontSize: 30),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
