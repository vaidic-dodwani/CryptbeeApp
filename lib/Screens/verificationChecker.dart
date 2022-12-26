import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class verificationChecker extends ConsumerStatefulWidget {
  final String id;
  const verificationChecker({super.key, required this.id});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _verificationCheckerState();
}

class _verificationCheckerState extends ConsumerState<verificationChecker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text("Verifier -${widget.id}"),
    ));
  }
}
