import 'package:binamod/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Settings",
          style: TextStyle(
              fontSize: 24, fontWeight: FontWeight.bold, color: colorWhite),
        ),
        backgroundColor: colorDeepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildListTile(context, "Account", Icons.account_circle, () {}),
          _buildListTile(context, "Notifications", Icons.notifications, () {}),
          _buildListTile(context, "Language", Icons.language, () {}),
          _buildListTile(context, "Privacy", Icons.lock, () {}),
          _buildListTile(context, "Contact", Icons.contact_mail, () {}),
          _buildListTile(context, "Version", Icons.info, () {}),
          _buildListTile(context, "Privacy Policy", Icons.policy, () {}),
          _buildListTile(context, "About Us", Icons.info_outline, () {}),
          _buildListTile(context, "Help", Icons.help, () {}),
          _buildListTile(context, "Terms of Service", Icons.description, () {}),
          _buildListTile(context, "Feedback", Icons.feedback, () {}),
          _buildListTile(context, "Legal", Icons.gavel, () {}),
          _buildListTile(context, "Updates", Icons.update, () {}),
          _buildListTile(context, "Support", Icons.support, () {}),
          _buildListTile(context, "Account Settings", Icons.settings, () {}),
        ],
      ),
    );
  }

  Widget _buildListTile(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: colorDeepPurpleFifty),
      title: Text(title, style: const TextStyle(fontSize: 18)),
      onTap: onTap,
    );
  }
}
