import 'package:agro_ai/screens/home/home_screen.dart';
import 'package:agro_ai/utils/constants.dart';
import 'package:agro_ai/widgets/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessComplete extends StatefulWidget {
  const ProcessComplete({super.key});

  @override
  State<ProcessComplete> createState() => _ProcessCompleteState();
}

class _ProcessCompleteState extends State<ProcessComplete>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Column(
                children: [
                  ScaleTransition(
                    scale: _animation,
                    child: Container(
                      padding: const EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [
                            Colors.green.withOpacity(.7),
                            Colors.green.withOpacity(.1),
                          ],
                        ),
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(18),
                        decoration: const BoxDecoration(
                          color: Colors.green,
                          shape: BoxShape.circle,
                        ),
                        child: const PrimaryText(
                          text: '✓',
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryText(
                    text: 'Success',
                    color: Theme.of(context).colorScheme.inversePrimary,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  PrimaryText(
                    text:
                        'We have successfully received your payment. You can proceed and access Unlimited Netflix',
                    color: Theme.of(context).colorScheme.surface,
                    maxLines: 4,
                    textAlign: TextAlign.center,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Get.offAll(const HomeScreen());
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Constants.black,
                      backgroundColor: Colors.cyan.shade800,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const PrimaryText(
                      text: 'Home',
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     PrimaryText(
            //       text: 'Report',
            //       color: Theme.of(context).colorScheme.inversePrimary,
            //     ),
            //     PrimaryText(
            //       text: 'Flag',
            //       color: Theme.of(context).colorScheme.inversePrimary,
            //     ),
            //     PrimaryText(
            //       text: 'Block',
            //       color: Theme.of(context).colorScheme.inversePrimary,
            //     ),
            //   ],
            // )
          ],
        ),
      ),
    );
  }
}
