import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpansionTileWrapper extends StatefulWidget {
  final String title;
  final Widget child;

  const ExpansionTileWrapper({
    Key? key,
    required this.title,
    required this.child,
  }) : super(key: key);

  @override
  State<ExpansionTileWrapper> createState() => _ExpansionTileWrapperState();
}

class _ExpansionTileWrapperState extends State<ExpansionTileWrapper>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final collapsedRadius = const BorderRadius.only(
      bottomLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    );
    final expandedRadius = BorderRadius.circular(20);

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: const Color(0xFF137DC7),
        borderRadius: _isExpanded ? expandedRadius : collapsedRadius,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Custom Header
          GestureDetector(
            onTap: () {
              setState(() {
                _isExpanded = !_isExpanded;
              });
            },
            child: Container(
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                  AnimatedRotation(
                    turns: _isExpanded ? 0.5 : 0.0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                  ),
                ],
              ),
            ),
          ),

          // Expandable Body
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            child: AnimatedSize(
              duration: const Duration(milliseconds: 250),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: _isExpanded
                  ? Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: widget.child,
              )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }

}