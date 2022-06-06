import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'infoPage.dart';
import 'user.dart';

enum Gender { male, female }

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final _formKey = GlobalKey<FormState>();
  User newUser = User();
  bool isAllChecked = false;

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _ageController = TextEditingController();
  final _aboutController = TextEditingController();
  final List<String> stations = [
    "Петроградская",
    "Невский проспект",
    "Спортивная",
    "Гостинный двор",
    "Горьковская"
  ];
  var animalsMap = {
    'Зебра': false,
    'Кошак': false,
    'Анаконда': false,
    'Человек': false,
    'Слон': false,
  };

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _ageFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _ageController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _ageFocus.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Форма заявки на работу в зоопарке'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            /*
            
              не работает валидация полей Имя и Телефон,
              остальная функциональность выполнена
            
            */
            TextFormField(
              onSaved: (newValue) => newUser.name = newValue!,
              validator: (value) => _validateName(value),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Имя*',
                icon: Icon(Icons.man),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _nameController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.phone = newValue!,
              validator: (value) => _validatePhone(value),
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Телефон',
                helperText: 'Формат телефона +7(ХХХ)-ХХХ-ХХ-ХХ',
                icon: Icon(Icons.phone),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _phoneController.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.email = newValue!,
              validator: (value) => _validateMail(value),
              controller: _mailController,
              decoration: InputDecoration(
                labelText: 'Email*',
                icon: Icon(Icons.mail),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _mailController.clear();
                  },
                ),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.age = int.parse(newValue!),
              autofocus: true,
              focusNode: _ageFocus,
              validator: (value) => _validateAge(value),
              controller: _ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Возраст*',
                icon: Icon(Icons.date_range),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _ageController.clear();
                  },
                ),
              ),
            ),
            SizedBox(height: 25),
            Text(
              'Пол',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 25),
            RadioListTile(
              title: Text('Мужской'),
              value: Gender.male,
              groupValue: newUser.gender,
              onChanged: (data) {
                setState(() {
                  newUser.gender = data as Gender;
                });
              },
            ),
            RadioListTile(
              title: Text('Женский'),
              value: Gender.female,
              groupValue: newUser.gender,
              onChanged: (data) {
                setState(() {
                  newUser.gender = data as Gender;
                });
              },
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.about = newValue,
              controller: _aboutController,
              decoration: InputDecoration(
                labelText: 'Перечислите свои личные качества',
                border: OutlineInputBorder(),
              ),
              maxLines: 5,
            ),
            SizedBox(height: 25),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.train),
                labelText: 'Ближайшая к вам станция метро',
              ),
              items: stations.map(
                (station) {
                  return DropdownMenuItem(
                    child: Text(station),
                    value: station,
                  );
                },
              ).toList(),
              onChanged: (data) {
                setState(() {
                  newUser.station = data.toString();
                });
              },
            ),
            SizedBox(height: 25),
            Text(
              'Выберите ваших любимых животных',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Зебра'),
                controlAffinity: ListTileControlAffinity.leading,
                value: animalsMap['Зебра'],
                onChanged: (bool? value) {
                  setState(() {
                    animalsMap['Зебра'] = value!;
                  });
                },
              ),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Кошак'),
                controlAffinity: ListTileControlAffinity.leading,
                value: animalsMap['Кошак'],
                onChanged: (bool? value) {
                  setState(() {
                    animalsMap['Кошак'] = value!;
                  });
                },
              ),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Анаконда'),
                controlAffinity: ListTileControlAffinity.leading,
                value: animalsMap['Анаконда'],
                onChanged: (bool? value) {
                  setState(() {
                    animalsMap['Анаконда'] = value!;
                  });
                },
              ),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Человек'),
                controlAffinity: ListTileControlAffinity.leading,
                value: animalsMap['Человек'],
                onChanged: (bool? value) {
                  setState(() {
                    animalsMap['Человек'] = value!;
                  });
                },
              ),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Слон'),
                controlAffinity: ListTileControlAffinity.leading,
                value: animalsMap['Слон'],
                onChanged: (bool? value) {
                  setState(() {
                    animalsMap['Слон'] = value!;
                  });
                },
              ),
            ),
            Container(
              width: 150,
              child: CheckboxListTile(
                title: Text('Отметить все'),
                controlAffinity: ListTileControlAffinity.leading,
                value: isAllChecked,
                onChanged: (bool? value) {
                  setState(() {
                    isAllChecked = value!;
                    for (var animValue in animalsMap.keys) {
                      animalsMap[animValue] = isAllChecked;
                    }
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
              child: Text('Отправить информацию'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _showDialog();
    } else {
      _showMessage(
          message:
              'Форма заполнена не верно! Перепроверьте данные и повторите!');
    }
  }

  String? _validateName(String? name) {
    final _nameExp = RegExp(r'^[А-Яа-я ]+$');
    if (name!.isEmpty) {
      return 'Поле имя не должно быть пустым!';
    } else if (_nameExp.hasMatch(name)) {
      return null;
    } else {
      return 'Только кирилица!';
    }
  }

  String? _validatePhone(String? phone) {
    final _phoneExp = RegExp(r'^\+\d\(\d\d\d\)-\d\d\d-\d\d-\d\d$');
    if (phone!.isEmpty) {
      return null;
    } else if (!_phoneExp.hasMatch(phone)) {
      return 'Формат телефона должен быть +7(ХХХ)ХХХ-ХХХХ';
    } else {
      return null;
    }
  }

  String? _validateMail(String? mail) {
    final _mailExp = RegExp(r'^[a-zA-Z\d]+@[a-zA-Z\d]+\.[a-zA-Z\d]+$');
    if (mail!.isEmpty) {
      return 'Поле адрес электронной почты не должно быть пустым!';
    } else if (_mailExp.hasMatch(mail)) {
      return null;
    } else {
      return 'Введен не верный формат электронного адреса!';
    }
  }

  _validateAge(String? value) {
    if (value!.isEmpty) {
      return 'Поле возраст должно быть заполнено!';
    } else if (int.parse(value) >= 18) {
      return null;
    } else {
      return 'Люди младше 18 на работу не допускаются!';
    }
  }

  void _showMessage({required String message}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        backgroundColor: Colors.red,
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Вы уверены, что заполнили все поля правильно?'),
            titleTextStyle: TextStyle(
              color: Colors.red,
            ),
            content: Text(
              'Проверьте все данные перед завершением заполнения заявки!',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            actions: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => infoPage(
                            animals: animalsMap,
                            user: newUser,
                          ));
                  Navigator.push(context, route);
                },
                child: Text(
                  'Подтвердить',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Отменить',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
