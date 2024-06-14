import 'package:agro_ai/utils/constants.dart';
import 'package:agro_ai/utils/faq.dart';
import 'package:agro_ai/widgets/primary_text.dart';
import 'package:flutter/material.dart';

class HomeItems extends StatefulWidget {
  const HomeItems({super.key});

  @override
  State<HomeItems> createState() => _HomeItemsState();
}

class _HomeItemsState extends State<HomeItems> {
  final List<FAQ> faq = [
    FAQ(
      question: 'What crop to plant here?',
      answer: 'answer',
    ),
    FAQ(
      question: ' What fertilizer to use?',
      answer: 'answer',
    ),
    FAQ(
      question: 'Which disease do your crop have ?',
      answer: 'answer',
    ),
  ];
  int currentIndex = 0;
  bool showIndexedBody = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: PrimaryText(
          text: 'FARMER-MARKET BRIDGE',
          fontSize: 17,
          fontWeight: FontWeight.w600,
          color: Constants.black,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 3),
                    color: Constants.grey500,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Center(
                child: PrimaryText(
                  text: 'FARMER-MARKET BRIDGE',
                  color: Constants.grey700,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(
              height: 35,
            ),
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/about.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned.fill(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PrimaryText(
                          text: 'About Us'.toUpperCase(),
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const PrimaryText(
                          text:
                              'We use state-of-the-art machine learning and deep learning technologies to help you guide through the entire farming process. Make informed decisions to understand the demographics of your area, understand the factors that affect your crop and keep them healthy for a super awesome successful yield.',
                          color: Colors.white,
                          maxLines: 10,
                          fontWeight: FontWeight.w700,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 1,
                ),
              ),
              child: Column(
                children: [
                  PrimaryText(
                    text: "Here Are Some Questions We'll Answer",
                    color: Constants.black,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: faq.length,
                    itemBuilder: (_, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListTile(
                            onTap: () {
                              setState(() {
                                if (currentIndex == index) {
                                  currentIndex = -1;
                                } else {
                                  currentIndex = index;
                                  showIndexedBody = !showIndexedBody;
                                }
                              });
                            },
                            contentPadding: EdgeInsets.zero,
                            title: Text(
                              faq[index].question,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                            trailing: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Constants.black,
                                  width: 2,
                                ),
                              ),
                              child: Icon(
                                currentIndex != index
                                    ? Icons.keyboard_arrow_down_rounded
                                    : Icons.keyboard_arrow_up_rounded,
                                color: Constants.black,
                              ),
                            ),
                          ),
                          if (currentIndex == index)
                            Text(
                              faq[index].answer,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Constants.black,
                              ),
                            ),
                          Divider(
                            color: Colors.grey.shade400,
                          ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
