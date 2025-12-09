import 'package:flutter/material.dart';

class KeepliveWrapper extends StatefulWidget {
  final Widget child;
  KeepliveWrapper({Key? key, required this.child}) : super(key: key);

  @override
  _KeepliveWrapperState createState() => _KeepliveWrapperState();
}

class _KeepliveWrapperState extends State<KeepliveWrapper>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    return Container(child: widget.child);
  }

  @override
  bool get wantKeepAlive => true;
}
