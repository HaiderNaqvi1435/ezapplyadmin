import 'package:ezapplyadmin/code/managers/forms_manager.dart';
import 'package:ezapplyadmin/uicode/widgets/navcards.dart';
import 'package:ezapplyadmin/uicode/widgets/textinput.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final colorss = Theme.of(context).colorScheme;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            searchinput(colorss: colorss),
            Consumer<FormsManager>(
              builder: (context, value, child) => Expanded(
                child: ListView.builder(
                  itemCount: value.applicationdatalist.length,
                  itemBuilder: (BuildContext context, int index) {
                    return applicationCard(context, size, colorss,
                        value.applicationdatalist[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
