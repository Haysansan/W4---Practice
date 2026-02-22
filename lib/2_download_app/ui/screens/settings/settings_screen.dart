import 'package:flutter/material.dart';

import '../../providers/theme_color_provider.dart';
import '../../theme/theme.dart';
import 'widget/theme_color_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: themeProvider,
      builder: (context, child) {
        final currentThemeColor = themeProvider.themeColor;

        return Container(
          color: currentThemeColor.backgroundColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                "Settings",
                style: AppTextStyles.heading.copyWith(
                  color: currentThemeColor.color,
                ),
              ),
              const SizedBox(height: 50),
              Text(
                "Theme",
                style: AppTextStyles.label.copyWith(color: AppColors.textLight),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: ThemeColor.values
                    .map(
                      (theme) => ThemeColorButton(
                        themeColor: theme,
                        isSelected: theme == currentThemeColor,
                        onTap: (newTheme) => themeProvider.setTheme(newTheme),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}
