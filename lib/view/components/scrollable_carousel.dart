import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ScrollableCarousel extends StatelessWidget {
  final List<String> images;
  final Function(int index) onTap;

  const ScrollableCarousel({
    super.key,
    required this.images,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 600;
    final scrollController = ScrollController();

    return isMobile ? _nativeCarousel() : _customCarousel(scrollController);
  }

  CarouselView _nativeCarousel() {
    return CarouselView(
      onTap: onTap,
      itemExtent: 180,
      children:
          images
              .map(
                (e) => Image.asset(
                  e,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
    );
  }

  Widget _customCarousel(ScrollController scrollController) {
    return SizedBox(
      height: 200,
      child: Listener(
        onPointerSignal: (event) {
          if (event is PointerScrollEvent) {
            scrollController.animateTo(
              scrollController.offset + event.scrollDelta.dy,
              duration: const Duration(milliseconds: 100),
              curve: Curves.easeOut,
            );
          }
        },
        child: GestureDetector(
          onHorizontalDragUpdate: (details) {
            scrollController.jumpTo(
              scrollController.offset - details.primaryDelta!,
            );
          },
          child: ScrollConfiguration(
            behavior: const _DragScrollBehavior(),
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemExtent: 180,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8.0),
                  child: GestureDetector(
                    onTap: () => onTap(index),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.0),
                      child: Image.asset(
                        images[index],
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class _DragScrollBehavior extends MaterialScrollBehavior {
  const _DragScrollBehavior();

  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
