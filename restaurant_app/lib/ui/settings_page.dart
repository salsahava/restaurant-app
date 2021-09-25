import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 32.0,
              right: 16.0,
              bottom: 10.0,
              left: 16.0,
            ),
            child: Text(
              'Settings',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Material(
            child: ListTile(
              title: Text(
                'Restaurant Recommendation',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.copyWith(color: darkBlueGrey),
              ),
              trailing: Consumer<SchedulingProvider>(
                builder: (context, scheduled, _) {
                  return Switch.adaptive(
                    value: scheduled.isScheduled,
                    onChanged: (value) async {
                      scheduled.scheduledRecommendation(value);
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
