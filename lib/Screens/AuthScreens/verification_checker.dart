import 'package:cryptbee/Config/api_integration.dart';
import 'package:cryptbee/Routing/route_names.dart';
import 'package:cryptbee/Utilities/Widgets/utilities.dart';
import 'package:cryptbee/Utilities/api_functions.dart';
import 'package:cryptbee/Utilities/static_classes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:toast/toast.dart';

class VerificationChecker extends ConsumerStatefulWidget {
  final String email;
  final String token;
  const VerificationChecker(
      {super.key, required this.email, required this.token});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationCheckerState();
}

class _VerificationCheckerState extends ConsumerState<VerificationChecker> {
  Map<String, dynamic> data = <String, dynamic>{};

  @override
  void initState() {
    ApiCalls.verifier(email: widget.email, token: widget.token).then((value) {
      if (value['statusCode'] == 200) {
        clearData().then(
          (info) {
            value['two_factor'] = false;
            value["pan_verify"] = false;
            saveData(value).then((value) {
              App.isLoggedIn = true;
              ToastContext().init(context);
              Toast.show("Verified Successfully!! ",
                  duration: 5, gravity: Toast.bottom);
              context.goNamed(RouteNames.root);
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

  @override
  void dispose() {
    super.dispose();
  }
}
