import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/presentation/resource/constants.dart';
import '../../../login_feature/presentation/page/login_screen.dart';
import '../../domain/entity/on_boarding_entity.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    final boardController = PageController();

    List<OnBoardingModel> boarding = [
      const OnBoardingModel(
          title: 'On Board 1 Title',
          body: 'On Board 1 Body',
          image: onBoardingOne),
      const OnBoardingModel(
          title: 'On Board 2 Title',
          body: 'On Board 2 Body',
          image: onBoardingOne),
      const OnBoardingModel(
          title: 'On Board 3 Title',
          body: 'On Board 3 Body',
          image: onBoardingOne),
    ];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>   LoginScreen()),
                    (route) => false);
              },
              child: const Text(
                'SKIP',
                style: TextStyle(
                    color: Colors.blue,
                    fontFamily: 'Abel',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: boardController,
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child:
                              Image(image: AssetImage(boarding[index].image))),
                      const SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        boarding[index].title,
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Abel'),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      Text(
                        boarding[index].body,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Abel'),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                    ],
                  );
                },
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.blue,
                      dotHeight: 10,
                      expansionFactor: 4,
                      dotWidth: 10,
                      spacing: 5.0),
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    if (isLast) {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>   LoginScreen()),
                          (route) => false);
                    } else {
                      boardController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
