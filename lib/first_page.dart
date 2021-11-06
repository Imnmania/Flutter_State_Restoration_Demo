import 'package:flutter/material.dart';
import 'package:state_restoration_demo/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with RestorationMixin {
  final RestorableTextEditingController _textController =
      RestorableTextEditingController();
  final RestorableBool _isChecked = RestorableBool(false);

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'First Page',
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: _textController.value,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green,
                      style: BorderStyle.solid,
                      width: 5.0,
                    ),
                  ),
                  hintText: "Input some text",
                ),
              ),
            ),
            CheckboxListTile(
              value: _isChecked.value,
              onChanged: (value) {
                setState(() {
                  _isChecked.value = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text('Remember me'),
              contentPadding: EdgeInsets.zero,
            ),
            MaterialButton(
              child: const Text('Second Page >'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () {
                FocusScope.of(context).unfocus();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const SecondPage()));
                Navigator.restorablePush(context, _secondScreenNavigation);
              },
            ),
          ],
        ),
      ),
    );
  }

  static Route<void> _secondScreenNavigation(context, arguments) {
    return MaterialPageRoute(builder: (context) => const SecondPage());
  }

  @override
  String? get restorationId => "first_screen";

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_textController, "text_hint_name");
    registerForRestoration(_isChecked, "remember_me");
  }
}
