import 'package:flutter/material.dart';

class TextFieldKullanimi extends StatefulWidget {
  const TextFieldKullanimi({Key? key}) : super(key: key);

  @override
  State<TextFieldKullanimi> createState() => _TextFieldKullanimiState();
}

class _TextFieldKullanimiState extends State<TextFieldKullanimi> {
  TextEditingController _password = TextEditingController();
  bool _isVisiable = false;
  @override
  void dispose() {
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var ekran = MediaQuery.of(context).size;
    var genislik = ekran.width;
    var yukseklik = ekran.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('TextFromField Kullanımı'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _password,
              cursorColor: Colors.orange,
              obscureText: !_isVisiable,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isVisiable = !_isVisiable;
                    });
                  },
                  icon: Icon(
                    _isVisiable
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  color: Colors.black,
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
                label: const Text(
                  'Şifre',
                  style: TextStyle(color: Colors.black, fontSize: 25),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.orange,
                    width: 2,
                  ),
                ),
              ),
            ),
            SizedBox(height: yukseklik / 5),
            SizedBox(
              height: 46,
              width: genislik,
              child: ElevatedButton(
                onPressed: () {
                  if (_password.text != '') {
                    return;
                  } else {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: const Icon(Icons.sim_card_alert_outlined),
                          title: const Text('Eksik Bilgi'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Boş Bırakılan Yerleri Doldurunuz.',
                              ),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Ok'),
                                  ),
                                  Container(
                                    width: 2,
                                    height: 10,
                                    color: Colors.red,
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  }
                },
                child: const Text('Tıkla'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
