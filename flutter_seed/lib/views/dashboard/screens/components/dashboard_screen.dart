import 'package:flutter/material.dart';
import 'package:flutter_seed/views/dashboard/service/user_goal_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var apidata = {};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        primary: false,
        padding: EdgeInsets.all(1),
        child: Column(
          children: [
            // Header(),
            // SizedBox(height: defaultPadding),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Text('Error Handling'),
                      SizedBox(
                        height: 20,
                      ),

                      // MyFiles(),
                      // SizedBox(height: defaultPadding),
                      // RecentFiles(),
                      // if (Responsive.isMobile(context))
                      //   SizedBox(height: defaultPadding),
                      // if (Responsive.isMobile(context)) StarageDetails(),
                      ElevatedButton(
                          onPressed: externalAPI,
                          child: const Text('External API')),
                    const  SizedBox(
                        height: 20,
                      ),

                      ElevatedButton(
                          onPressed: mockAPI, child:const Text('Mock API')),
                     const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: invalidJson,
                          child: const Text('user Data')),

                           const  SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                          onPressed: invalidJsonWithRequired,
                          child: const Text('Invalid Response API')),
                    ],
                  ),
                ),
                // if (!Responsive.isMobile(context))
                //   SizedBox(width: defaultPadding),
                // // On Mobile means if the screen is less than 850 we dont want to show it
                // if (!Responsive.isMobile(context))
                //   Expanded(
                //     flex: 2,
                //     child: StarageDetails(),
                //   ),
              ],
            )
          ],
        ),
      ),
    );
  }

  externalAPI() async {
    var data = await UserGoalService().exGetHotelsData();
    data = data.data;
    print(data);
    if (data) {
      setState(() {
        apidata = data;
      });
    }
  }

  mockAPI() async {
    var data = await UserGoalService().getHotelsData();
    data = data.data;
    print(data);
  }

  invalidJson() async {
    var data = await UserGoalService().userProfile();
    print(data.name);
  }

  invalidJsonWithRequired() async {
    var data = await UserGoalService().userProfile2();
    print(data.name);
  }
}
