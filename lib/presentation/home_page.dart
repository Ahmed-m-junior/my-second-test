import 'package:flutter/material.dart';
import 'package:your_app/future_widget.dart';
import 'package:your_app/main.dart';
import 'package:your_app/network/calender.dart';
import 'package:your_app/network/calender_response.dart';
import 'package:your_app/presentation/widgets/dialog_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  CalenderResponse? calenderResponse;
  Calender? Timing;

  late Future<CalenderResponse?> futureCalenderResponse;

  @override
  void initState() {
    super.initState();
    futureCalenderResponse = client.getCalender();
  }

// Future<void> fetchPage() async{
//   final response = await client.getRequest();
//
//   if (calender == null && response != null) {
//     setState(() {
//       calender = response.data;
//     });
//   }
// }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffB39EDB),
      drawer: Drawer(
        backgroundColor: const Color(0xff9675CE),
        elevation: 0,
        width: 300,
        child: ListView(
          padding: const EdgeInsets.only(top: 70),
          children: [
            const Image(
              image: AssetImage("assets/prayer-times.png"),
              height: 80,
              width: 80,
              color: Color(0xff502B69),
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Image.asset('assets/themes.png'),
              iconColor: const Color(0xff502B69),
              title: const Text("Theme"),
              onTap: () {
               const DialogWidget();
              },
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Image.asset('assets/translate.png'),
              iconColor: const Color(0xff502B69),
              title: const Text("Language"),
              onTap: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Image.asset(
                'assets/geography.png',
              ),
              iconColor: const Color(0xff502B69),
              title: const Text("Country"),
              onTap: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            ListTile(
              leading: Image.asset(
                'assets/notifications.png',
                width: 20,
              ),
              iconColor: const Color(0xff502B69),
              title: const Text("Notifications"),
              onTap: () {},
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 5,
            expandedHeight: 150.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            //centerTitle: true,
            // floating: true,
            pinned: true,
            backgroundColor: const Color(0xff9675CE),
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.title,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return PageBody(index);
              },
              childCount: 1,
              // childCount: calenderResponse?.data!.length,
            ),
          ),
        ],
      ),
      // body: ListView.builder(
      //   itemCount: 5,
      //   itemBuilder: (context, index) {
      //     return Padding(
      //       padding: const EdgeInsets.only(top: 20,left: 20,right: 20),
      //       child: Container(
      //         height: 120,
      //         width: 120,
      //         decoration: BoxDecoration(
      //           borderRadius: BorderRadius.circular(18),
      //           color: Color(0xff9675CE),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }

   Widget PageBody(int index) {
    return FutureWidget<CalenderResponse?>(futureCalenderResponse, (response) {
      calenderResponse = response;
      return Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 15,
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Text(
                          "Fajr",
                          style: TextStyle(
                              color: Color(0xff502B69),
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Text(
                          "${response?.data?[index].timings?.Fajr ?? " "}",
                          style: const TextStyle(
                              color: Color(0xff502B69),
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Sunrise",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Sunrise ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Dhuhr",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Dhuhr ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Maghrib",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Maghrib ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Sunset",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Sunset ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Isha",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Isha ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 8,
                bottom: 10,
              ),
              height: 110,
              width: 400,
              child: Card(
                color: const Color(0xff9675CE),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 5,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Midnight",
                      style: TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      "${response?.data?[index].timings?.Midnight ?? " "}",
                      style: const TextStyle(
                          color: Color(0xff502B69),
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
