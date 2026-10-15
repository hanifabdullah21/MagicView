import 'package:flutter/material.dart';
import 'package:magic_view/magic_view.dart';

class ExampleMagicAlertDialog extends StatefulWidget {
  const ExampleMagicAlertDialog({super.key});

  @override
  State<ExampleMagicAlertDialog> createState() => _ExampleMagicAlertDialogState();
}

class _ExampleMagicAlertDialogState extends State<ExampleMagicAlertDialog> {
  final _titleController = TextEditingController(text: 'Perhatian');
  final _contentController = TextEditingController(
    text: 'Terjadi Kesalahan.',
  );
  final _textPrimaryController = TextEditingController(text: 'Ulangi');
  final _textSecondaryController = TextEditingController(text: 'Batal');

  EnumDialogIconType _iconType = EnumDialogIconType.failed;
  bool _showTitle = true;
  bool _enablePrimary = true;
  bool _enableSecondary = false;

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _textPrimaryController.dispose();
    _textSecondaryController.dispose();
    super.dispose();
  }

  void _showAlert(BuildContext context) {
    showMagicAlertDialog(
      context,
      title: _showTitle && _titleController.text.trim().isNotEmpty
          ? _titleController.text.trim()
          : null,
      content: _contentController.text.trim().isEmpty
          ? ' '
          : _contentController.text.trim(),
      iconType: _iconType,
      barrierDismissable: true,
      textPrimary: _enablePrimary ? _textPrimaryController.text.trim() : null,
      onPrimary: _enablePrimary
          ? () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tombol primary ditekan')),
              );
            }
          : null,
      textSecondary:
          _enableSecondary ? _textSecondaryController.text.trim() : null,
      onSecondary: _enableSecondary
          ? () {
              Navigator.of(context).pop();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Tombol secondary ditekan')),
              );
            }
          : null,
      background: Colors.blue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MagicText('DIALOG'),
        const SizedBox(height: 8),
        MagicButton(
          text: 'Show Magic Dialog',
          () {
            showMagicDialog(
              context,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, size: 120),
                  MagicText('Halo'),
                ],
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        MagicText('Magic Alert Dialog — preview'),
        const SizedBox(height: 8),
        SwitchListTile(
          title: const Text('Tampilkan judul (title)'),
          value: _showTitle,
          onChanged: (value) => setState(() => _showTitle = value),
        ),
        if (_showTitle) ...[
          MagicTextField(
            _titleController,
            hint: 'Title',
          ),
          const SizedBox(height: 8),
        ],
        TextField(
          controller: _contentController,
          decoration: const InputDecoration(
            labelText: 'Message / content',
            border: OutlineInputBorder(),
            alignLabelWithHint: true,
          ),
          minLines: 2,
          maxLines: 6,
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<EnumDialogIconType>(
          value: _iconType,
          decoration: const InputDecoration(
            labelText: 'iconType',
            border: OutlineInputBorder(),
          ),
          items: EnumDialogIconType.values
              .where((e) => e != EnumDialogIconType.custom)
              .map(
                (type) => DropdownMenuItem(
                  value: type,
                  child: Text(type.name),
                ),
              )
              .toList(),
          onChanged: (value) {
            if (value != null) {
              setState(() => _iconType = value);
            }
          },
        ),
        const SizedBox(height: 12),
        SwitchListTile(
          title: const Text('Tombol primary (textPrimary / onPrimary)'),
          value: _enablePrimary,
          onChanged: (value) => setState(() => _enablePrimary = value),
        ),
        if (_enablePrimary) ...[
          MagicTextField(
            _textPrimaryController,
            hint: 'textPrimary',
          ),
          const SizedBox(height: 8),
        ],
        SwitchListTile(
          title: const Text('Tombol secondary (textSecondary / onSecondary)'),
          value: _enableSecondary,
          onChanged: (value) => setState(() => _enableSecondary = value),
        ),
        if (_enableSecondary) ...[
          MagicTextField(
            _textSecondaryController,
            hint: 'textSecondary',
          ),
          const SizedBox(height: 8),
        ],
        const SizedBox(height: 8),
        MagicButton(
          text: 'Show Magic Alert Dialog',
          () => _showAlert(context),
        ),
      ],
    );
  }
}
