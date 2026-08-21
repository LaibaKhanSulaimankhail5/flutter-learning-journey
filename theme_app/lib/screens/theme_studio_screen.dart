import 'package:flutter/material.dart';

class ThemeStudioScreen extends StatelessWidget {
  final ThemeMode themeMode;
  final ValueChanged<ThemeMode> onThemeChanged;

  const ThemeStudioScreen({
    super.key,
    required this.themeMode,
    required this.onThemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final text = theme.textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Theme Studio',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        actions: [
          PopupMenuButton<ThemeMode>(
            initialValue: themeMode,
            onSelected: onThemeChanged,
            icon: const Icon(Icons.brightness_6_outlined),
            itemBuilder: (context) => const [
              PopupMenuItem(value: ThemeMode.light, child: Text('Light')),
              PopupMenuItem(value: ThemeMode.dark, child: Text('Dark')),
              PopupMenuItem(value: ThemeMode.system, child: Text('System')),
            ],
          ),
          const SizedBox(width: 8),
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 100),
        children: [
          Text(
            'Material 3 Playground',
            style: text.headlineMedium?.copyWith(fontWeight: FontWeight.w800),
          ),

          const SizedBox(height: 8),

          Text(
            'Explore Flutter themes, colors, typography and components.',
            style: text.bodyLarge,
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.palette_outlined, title: 'Color Scheme'),

          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _ColorBox(label: 'Primary', color: colors.primary),
                  _ColorBox(label: 'Secondary', color: colors.secondary),
                  _ColorBox(label: 'Surface', color: colors.surface),
                  _ColorBox(label: 'Error', color: colors.error),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.text_fields, title: 'Typography'),

          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Headline', style: text.headlineSmall),
                  const SizedBox(height: 8),
                  Text('Title Medium', style: text.titleMedium),
                  const SizedBox(height: 8),
                  Text(
                    'This is body text using the app theme.',
                    style: text.bodyLarge,
                  ),
                  const SizedBox(height: 8),
                  Text('Secondary information', style: text.bodyMedium),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.widgets_outlined, title: 'Buttons'),

          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  FilledButton(onPressed: () {}, child: const Text('Filled')),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Elevated'),
                  ),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text('Outlined'),
                  ),
                  TextButton(onPressed: () {}, child: const Text('Text')),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.edit_outlined, title: 'Input'),

          const SizedBox(height: 12),

          const TextField(
            decoration: InputDecoration(
              labelText: 'Your name',
              hintText: 'Enter something...',
              prefixIcon: Icon(Icons.person_outline),
            ),
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.toggle_on_outlined, title: 'Controls'),

          const SizedBox(height: 12),

          Card(
            child: Column(
              children: [
                SwitchListTile(
                  title: const Text('Notifications'),
                  subtitle: const Text('Receive app notifications'),
                  value: true,
                  onChanged: (_) {},
                ),
                const Divider(height: 1),
                CheckboxListTile(
                  title: const Text('Enable feature'),
                  value: true,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          _SectionTitle(icon: Icons.style_outlined, title: 'Components'),

          const SizedBox(height: 12),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(18),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: CircleAvatar(
                      backgroundColor: colors.primaryContainer,
                      child: Icon(
                        Icons.flutter_dash,
                        color: colors.onPrimaryContainer,
                      ),
                    ),
                    title: const Text('Material 3 Card'),
                    subtitle: const Text(
                      'This component automatically follows the theme.',
                    ),
                  ),
                  const SizedBox(height: 12),
                  Chip(
                    avatar: const Icon(Icons.check, size: 18),
                    label: const Text('Theme Ready'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          onThemeChanged(
            themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark,
          );
        },
        icon: Icon(
          themeMode == ThemeMode.dark ? Icons.light_mode : Icons.dark_mode,
        ),
        label: Text(themeMode == ThemeMode.dark ? 'Light' : 'Dark'),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const _SectionTitle({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;

    return Row(
      children: [
        Icon(icon, size: 21, color: colors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: text.titleLarge?.copyWith(fontWeight: FontWeight.w700),
        ),
      ],
    );
  }
}

class _ColorBox extends StatelessWidget {
  final String label;
  final Color color;

  const _ColorBox({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Container(
      width: 130,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color.computeLuminance() > 0.5
              ? colors.onSurface
              : Colors.white,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
