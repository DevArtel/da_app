import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class BannerLoader extends HookWidget {
  const BannerLoader({
    this.isLoading = true,
    this.duration = const Duration(milliseconds: 3000),
    Key? key,
  }) : super(key: key);

  final bool isLoading;
  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final loaderController = useAnimationController(duration: duration);

    useEffect(() {
      loaderController.addListener(() {
        if (loaderController.isCompleted) {
          loaderController.repeat();
        }
      });

      return null;
    }, []);

    useEffect(() {
      loaderController.reset();
      loaderController.forward();

      return null;
    }, [isLoading]);

    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      curve: Curves.fastOutSlowIn,
      opacity: isLoading ? 1 : 0,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator.adaptive(),
        ],
      ),
    );
  }
}
