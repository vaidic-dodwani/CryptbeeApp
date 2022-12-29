import 'package:cryptbee/Config/apiIntegration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Utilities/apiFunctions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class verificationChecker extends ConsumerStatefulWidget {
  final String email;
  final String token;
  const verificationChecker(
      {super.key, required this.email, required this.token});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _verificationCheckerState();
}

class _verificationCheckerState extends ConsumerState<verificationChecker> {
  Map<String, dynamic> data = <String, dynamic>{};

  @override
  void initState() {
    ApiCalls.verifier(email: widget.email, token: widget.token).then((value) {
      if (value['statusCode'] == 200) {
        clearData().then(
          (info) {
            saveData(value).then((value) {
              ToastContext().init(context);
              Toast.show("Verified Successfully!! ",
                  duration: 5, gravity: Toast.bottom);
              context.goNamed(RouteNames.homePage);
            });
          },
        );
      } else {
        ToastContext().init(context);
        Toast.show(value[value.keys.first][0],
            duration: 5, gravity: Toast.bottom);
        context.goNamed(RouteNames.signIn);
        setState(() {
          data = value;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Image.asset(
          "assests/background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Center(
            child: Center(
                child: data.toString() != '{}'
                    ? Text(
                        data[data.keys.first][0],
                        style: titleLarge(),
                      )
                    : const CircularProgressIndicator(
                        color: Palette.primaryColor,
                      )))
      ],
    ));
  }
}
