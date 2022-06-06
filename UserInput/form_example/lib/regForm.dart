import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;
  bool _hideConfirmPass = true;
  final _formKey = GlobalKey<FormState>();
  User newUser = new User();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _mailController = TextEditingController();
  final _lifeStoryController = TextEditingController();
  final _passController = TextEditingController();
  final _confPassController = TextEditingController();
  final List<String> _countries = ["Россия", "Белорусия", "Турция", "Куба"];
  String? _selectedCountry;

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _mailController.dispose();
    _lifeStoryController.dispose();
    _passController.dispose();
    _confPassController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
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
        title: Text('Register Form'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            TextFormField(
              onSaved: (newValue) => newUser.name = newValue!,
              autofocus: true,
              focusNode: _nameFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _nameFocus, _phoneFocus);
              },
              validator: (value) => _validateName(value),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Имя*',
                hintText: 'Как вас зовут?',
                prefixIcon: Icon(Icons.person),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _nameController.clear();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.phone = newValue!,
              focusNode: _phoneFocus,
              onFieldSubmitted: (_) {
                _fieldFocusChange(context, _phoneFocus, _passFocus);
              },
              validator: (value) => _validatePhone(value)
                  ? null
                  : 'Телефон должен подходить под установленный формат: (XXX)XXX-XXXX',
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Номер телефона*',
                hintText: 'Как мы можем связаться с вами?',
                helperText: 'Формат телефона: (ХХХ)ХХХ-ХХХХ',
                prefixIcon: Icon(Icons.call),
                suffixIcon: GestureDetector(
                  child: Icon(
                    Icons.delete_outline,
                    color: Colors.red,
                  ),
                  onTap: () {
                    _phoneController.clear();
                  },
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  borderSide: BorderSide(color: Colors.blue, width: 2),
                ),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 25),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                icon: Icon(Icons.map),
                labelText: 'Страна проживания',
              ),
              items: _countries.map(
                (country) {
                  return DropdownMenuItem(
                    child: Text(country),
                    value: country,
                  );
                },
              ).toList(),
              onChanged: (data) {
                setState(() {
                  _selectedCountry = data.toString();
                  newUser.country = data.toString();
                });
              },
              value: _selectedCountry,
              // validator: (val) {
              //   return val == null
              //       ? 'Пожалуйста, выберите страну проживания!'
              //       : null;
              // },
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.email = newValue!,
              validator: (value) => _validateMail(value),
              controller: _mailController,
              decoration: InputDecoration(
                labelText: 'Адрес электронной почты*',
                hintText: 'Введите адрес электронной почты',
                icon: Icon(Icons.mail),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.story = newValue,
              controller: _lifeStoryController,
              decoration: InputDecoration(
                labelText: 'О себе',
                hintText: 'Расскажите о себе',
                helperText: 'Всего пару предложений о себе',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 25),
            TextFormField(
              onSaved: (newValue) => newUser.pass = newValue!,
              focusNode: _passFocus,
              validator: (value) => _validatePass(value),
              controller: _passController,
              obscureText: _hidePass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Пароль*',
                hintText: 'Введите пароль',
                suffixIcon: IconButton(
                  icon:
                      Icon(_hidePass ? Icons.visibility : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hidePass = !_hidePass;
                    });
                  },
                ),
                icon: Icon(Icons.security),
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              validator: (value) => _validateConfPass(value),
              controller: _confPassController,
              obscureText: _hideConfirmPass,
              maxLength: 8,
              decoration: InputDecoration(
                labelText: 'Подтвердите пароль*',
                hintText: 'Подтвердите пароль',
                suffixIcon: IconButton(
                  icon: Icon(_hideConfirmPass
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    setState(() {
                      _hideConfirmPass = !_hideConfirmPass;
                    });
                  },
                ),
                icon: Icon(Icons.border_color),
              ),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: _submitForm,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.indigo),
              ),
              child: Text('Зарегистрироваться'),
            ),
          ],
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('Форма заполнена верно!');
      print('Имя: ${_nameController.text}');
      print('Телефон: ${_phoneController.text}');
      _selectedCountry != null
          ? print('Страна: $_selectedCountry')
          : print('Страна не указана');
      print('E-mail: ${_mailController.text}');
      print('О себе: ${_lifeStoryController.text}');
      print('Пароль: ${_passController.text}');
      _showDialog(name: _nameController.text);
    } else {
      _showMessage(
          message:
              'Форма заполнена не верно! Перепроверьте данные и повторите!');
    }
  }

  String? _validateName(String? name) {
    final _nameExp = RegExp(r'^[А-яа-я ]+$');
    if (name!.isEmpty) {
      return 'Поле имя не должно быть пустым!';
    } else if (!_nameExp.hasMatch(name)) {
      return 'Только буквы!';
    }
  }

  bool _validatePhone(String? phone) {
    final _phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d-\d\d\d\d$');
    return _phoneExp.hasMatch(phone!);
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

  String? _validatePass(String? pas) {
    if (pas!.isEmpty) {
      return 'Поле пароль не должно быть пустым!';
    } else if (pas.length < 8) {
      return 'Длина пароля должна быть 8 символов!';
    } else {
      return null;
    }
  }

  String? _validateConfPass(String? confPas) {
    if (confPas!.isEmpty) {
      return 'Поле подтверждение пароля не должно быть пустым!';
    } else if (confPas != _passController.text) {
      return 'Пароли не совпадают!';
    } else {
      return null;
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

  void _showDialog({required String name}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Регистрация успешна!'),
            titleTextStyle: TextStyle(
              color: Colors.green,
            ),
            content: Text(
              '$name зарегистрировался в системе',
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
                  Navigator.pop(context);
                },
                child: Text(
                  'Подтвердить',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          );
        });
  }
}
