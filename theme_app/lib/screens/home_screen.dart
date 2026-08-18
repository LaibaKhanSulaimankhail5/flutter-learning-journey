import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onThemeToggle;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onThemeToggle,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final text = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Laiba's Notes", style: text.titleMedium),
        actions: [
          IconButton(
            onPressed: onThemeToggle,
            tooltip: isDarkMode ? 'Light mode' : 'Dark mode',
            icon: Icon(
              isDarkMode ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 12, 20, 100),
        children: [
          Text('Study Notes', style: text.headlineSmall),

          const SizedBox(height: 6),

          Text('Keep your university work organized.', style: text.bodyMedium),

          const SizedBox(height: 24),

          TextField(
            decoration: InputDecoration(
              hintText: 'Search notes',
              prefixIcon: const Icon(Icons.search),
              suffixIcon: Icon(Icons.tune, color: colors.primary),
            ),
          ),

          const SizedBox(height: 28),

          Text('Recent Notes', style: text.titleMedium),

          const SizedBox(height: 12),

          const NoteCard(
            title: 'Software Construction',
            description: 'Design patterns, clean code and refactoring.',
            date: '18 Aug 2026',
            icon: Icons.code_outlined,
          ),

          const SizedBox(height: 12),

          const NoteCard(
            title: 'Web Engineering',
            description: 'HTTP, REST APIs and web application architecture.',
            date: '17 Aug 2026',
            icon: Icons.web_outlined,
          ),

          const SizedBox(height: 12),

          const NoteCard(
            title: 'Software Quality',
            description: 'Testing techniques and quality assurance.',
            date: '16 Aug 2026',
            icon: Icons.verified_outlined,
          ),

          const SizedBox(height: 12),

          const NoteCard(
            title: 'Flutter Development',
            description: 'Widgets, layouts and Material design.',
            date: '15 Aug 2026',
            icon: Icons.phone_android_outlined,
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class NoteCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final IconData icon;

  const NoteCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: colors.primaryContainer,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: colors.onPrimaryContainer),
            ),

            const SizedBox(width: 14),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: text.titleMedium),

                  const SizedBox(height: 6),

                  Text(description, style: text.bodyMedium),

                  const SizedBox(height: 12),

                  Text(date, style: text.bodyMedium?.copyWith(fontSize: 12)),
                ],
              ),
            ),

            const SizedBox(width: 8),

            Icon(
              Icons.arrow_forward_ios,
              size: 14,
              color: colors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }
}
