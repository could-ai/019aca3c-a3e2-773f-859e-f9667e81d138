import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=5'), // Placeholder
                ),
                const SizedBox(height: 16),
                Text(
                  'Sarah Johnson',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  'sarah.j@example.com',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildSectionHeader(context, 'Account'),
          _buildListTile(context, Icons.person_outline, 'Personal Information', () {}),
          _buildListTile(context, Icons.people_outline, 'Linked Students', () {}),
          _buildListTile(context, Icons.security, 'Security & Privacy', () {}),
          
          const SizedBox(height: 24),
          _buildSectionHeader(context, 'Preferences'),
          _buildListTile(context, Icons.notifications_outlined, 'Notifications', () {}),
          _buildListTile(context, Icons.language, 'Language', () {}),
          _buildListTile(context, Icons.dark_mode_outlined, 'Dark Mode', () {}, trailing: Switch(value: false, onChanged: (val){})),
          
          const SizedBox(height: 24),
          _buildSectionHeader(context, 'Support'),
          _buildListTile(context, Icons.help_outline, 'Help Center', () {}),
          _buildListTile(context, Icons.info_outline, 'About App', () {}),
          
          const SizedBox(height: 32),
          OutlinedButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.red,
              side: const BorderSide(color: Colors.red),
            ),
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, left: 16),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }

  Widget _buildListTile(BuildContext context, IconData icon, String title, VoidCallback onTap, {Widget? trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right, size: 20),
      onTap: onTap,
    );
  }
}
