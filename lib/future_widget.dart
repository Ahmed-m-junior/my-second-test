
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
class FutureWidget<T> extends StatelessWidget {
  const FutureWidget(
      this.future,
      this.builder, {
        this.loaderBuilder,
        this.loaderColor = Colors.deepPurple,
        this.retryFunc,
        Key? key,
      }) : super(key: key);

  final Color loaderColor;
  final Function()? retryFunc;
  final Widget Function(T) builder;
  final Widget Function()? loaderBuilder;
  final Future<T>? future;

  @override
  Widget build(BuildContext context) => SizedBox(
    child: FutureBuilder<T>(
      future: future,
      builder: (context, snapshot) {
        Widget child = const SizedBox();
        if (snapshot.connectionState == ConnectionState.waiting ||
            snapshot.connectionState == ConnectionState.none) {
          child = Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
                child: loaderBuilder?.call() ??
                    const SpinKitWave(
                      color: Color(0xff502B69),
                      size: 35.0,
                    )),
          );
        } else if (snapshot.hasError) {
          if (snapshot.error is DioError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                      'Request Failed: ${(snapshot.error as DioError).message}'),
                  backgroundColor: Colors.redAccent,
                  duration: const Duration(seconds: 5),
                ),
              );
            });
          }
          child = TextButton(
            onPressed: retryFunc ?? () {},
            child: const Row(
              children: [
                Icon(Icons.refresh,
                    size: 15,
                    color: Color(0xff502B69),),
                SizedBox(width: 8),
                Text(
                  'اعادة المحاولة',
                  style: TextStyle(
                      fontSize: 12, color: Color(0xff502B69),),
                ),
              ],
            ),
          );
        } else if (snapshot.hasData) {
          child = builder(snapshot.data!);
        }
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 350),
          child: child,
        );
      },
    ),
  );
}
