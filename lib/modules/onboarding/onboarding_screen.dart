import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/models/onboarding/onboarding.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/theme/light_theme.dart';
import '../login/login_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingScreen> {
  var controllerPageView = PageController();
  bool isLastPage = false;

  @override
  void initState() {
    super.initState();
    checkFirstSeen();
  }

  Future<void> checkFirstSeen() async {
    bool? seen = await CacheHelper.getData(key: 'onBoarding');
    if (seen != null) {
      submit();
    }
  }

  void submit() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => LoginScreen()));
  }

  var pagesView = [
    OnBoardingModel(
      title: 'title1',
      body: 'body board 1',
      image: 'assets/images/onboarding/onboarding_1.png',
    ),
    OnBoardingModel(
      title: 'title2',
      body: 'body board 2',
      image: 'assets/images/onboarding/onboarding_1.png',
    ),
    OnBoardingModel(
      title: 'title3',
      body: 'body board 3',
      image: 'assets/images/onboarding/onboarding_1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: PageView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      buildPageView(pagesView[index]),
                  itemCount: pagesView.length,
                  controller: controllerPageView,
                  onPageChanged: (index) {
                    if (index == pagesView.length - 1) {
                      setState(() {
                        isLastPage = true;
                      });
                    } else {
                      setState(() {
                        isLastPage = false;
                      });
                    }
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SmoothPageIndicator(
                controller: controllerPageView,
                count: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPageView(OnBoardingModel onBoardingModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: Image.asset(
            onBoardingModel.image,
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return const Text('');
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          onBoardingModel.title,
          style: getHeadlineTextStyle(
            context,
            screenHeight: MediaQuery.of(context).size.height.toInt(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          onBoardingModel.body,
          style: getBodyTextStyle(
            context,
            screenHeight: MediaQuery.of(context).size.height.toInt(),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        ConditionalBuilder(
          condition: isLastPage,
          builder: (context) {
            return ElevatedButton(
              onPressed: () {
                CacheHelper.putData(key: 'onBoarding', value: true);
                submit();
              },
              child: Text(
                'GET STARTED',
                style: getLabelTextStyle(
                  context,
                  screenHeight: MediaQuery.of(context).size.height.toInt(),
                )?.copyWith(
                  color: Colors.white,
                ),
              ),
            );
          },
          fallback: null,
        ),
      ],
    );
  }
}
