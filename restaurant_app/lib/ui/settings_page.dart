import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/common/styles.dart';
import 'package:restaurant_app/provider/preferences_provider.dart';
import 'package:restaurant_app/provider/scheduling_provider.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 48.0,
                  right: defaultPadding,
                  bottom: defaultPadding / 2,
                  left: defaultPadding,
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
                        .bodyText2
                        ?.copyWith(color: darkBlueGrey),
                  ),
                  trailing: Consumer<SchedulingProvider>(
                    builder: (context, scheduled, _) {
                      return Switch.adaptive(
                        value: provider.isDailyRecActive,
                        onChanged: (value) async {
                          scheduled.scheduledRecommendation(value);
                          provider.enableDailyRec(value);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
