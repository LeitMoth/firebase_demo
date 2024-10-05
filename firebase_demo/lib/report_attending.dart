import 'package:flutter/material.dart';

import 'src/widgets.dart';

class ReportAttending extends StatelessWidget {
  ReportAttending({super.key, required this.localNumAttending, required this.onUpdate});
  final int localNumAttending;
  final void Function(int localNumAttending) onUpdate;

  final _formKey = GlobalKey<FormState>(debugLabel: '_AttendingCountState');
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        key: _formKey,
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Number of guests',
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  int? intValue;
                  if (value != null) {
                    intValue = int.tryParse(value);
                  }
                  if (intValue == null) {
                    return 'Please enter the size of your party';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(width: 8),
            StyledButton(
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  onUpdate(int.parse(_controller.text));
                  _controller.clear();
                }
              },
              child: const Row(
                children: [
                  Icon(Icons.send),
                  SizedBox(width: 4),
                  Text('RSVP'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
