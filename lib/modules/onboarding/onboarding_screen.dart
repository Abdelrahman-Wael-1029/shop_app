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
        context, MaterialPageRoute(builder: (context) => const LoginScreen()));
  }

  var pagesView = [
    OnBoardingModel(
      title: 'shopping',
      body: 'check our products',
      image: 'images/onboarding/onboarding_1.png',
    ),
    OnBoardingModel(
      title: 'brand',
      body: 'shop from the best brands',
      image: 'images/onboarding/onboarding_2.png',
    ),
    OnBoardingModel(
      title: 'shopping online',
      body: 'shop from the comfort of your home',
      image: 'images/onboarding/onboarding_3.png',
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
              print('error is $error');
              return const Text('');
            },
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Text(
          onBoardingModel.title,
          style: Theme.of(context).textTheme.displayMedium,
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          onBoardingModel.body,
          style: Theme.of(context).textTheme.bodyMedium,
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
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
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
