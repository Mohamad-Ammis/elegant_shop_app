import 'package:flutter/material.dart';

class HomeScrollControllerService {
  final ScrollController scrollController;

  HomeScrollControllerService(this.scrollController) {
    scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (scrollController.position.atEdge) {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        _handleReachedEnd();
      }
    }
  }

  void _handleReachedEnd() {
    print('Hello, you have reached the end of the list!');
  }

  void dispose() {
    scrollController.dispose();
  }
}
