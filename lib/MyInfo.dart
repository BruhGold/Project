// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class MyInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text(
          'Personal information'
        ),
      ),
      body: Center(
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.green,
                child: Icon(
                  Icons.icecream,
                  size: 150,
                ),
              ),
            ),
            SizedBox(height: 18,),
            Name(),
            SizedBox(height: 10,),
            Birth(),
            SizedBox(height: 10,),
            Email(),
            SizedBox(height: 50,),
            SaveButton(),
          ],
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  get OnPressed => null;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 345,
      child: ElevatedButton(
        onPressed: OnPressed,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.green,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        child: Text(
          'Save',
          style: TextStyle(
            fontSize: 50,
          ),
        ),
      ),
    );
  }
}

class Name extends StatelessWidget {
  const Name({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Last name'),
            SizedBox(
              height: 60,
              width: 165,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: '',
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('First name'),
            SizedBox(
              height: 60,
              width: 165,
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: ''
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Birth extends StatelessWidget {
  const Birth({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Birthday'),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 165,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black54),
                borderRadius: BorderRadius.circular(4),
              ),
              child: BDate()
            ),
          ],
        ),
        SizedBox(
          width: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Gender',),
            SizedBox(
              height: 60,
              width: 165,
              child: UnitMenu(),
            ),
          ],
        )
      ],
    );
  }
}

class BDate extends StatefulWidget {
  const BDate({
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _BDateState();
}

class _BDateState extends State<BDate> {
  DateTime _dateTime = DateTime.now();

  void _ShowDatePicker() {
    showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime.now(),
    ).then((value){
      setState(() {
        _dateTime = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _ShowDatePicker,
          icon: Icon(
            Icons.ice_skating,
          ),
        ),
        Text(
          '${_dateTime.day}/${_dateTime.month}/${_dateTime.year}',
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}

class UnitMenu extends StatefulWidget{
  const UnitMenu({super.key});

  @override
  State<UnitMenu> createState() => _UnitMenuState();
}

class _UnitMenuState extends State<UnitMenu> {
  final List<String> list = <String>['Male','Female'];

  @override
  Widget build(BuildContext context) {
    String dropdownValue = list[0];

    return DropdownMenu<String>(
      width: 165,
      initialSelection: list[0],
      onSelected: (String? value) {
        dropdownValue = value!;
      },
      dropdownMenuEntries: list.map<DropdownMenuEntry<String>>((String value) {
        return DropdownMenuEntry<String>(value: value, label: value);
      }).toList(),
    );
  }
}

class Email extends StatelessWidget {
  const Email({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Email'),
        SizedBox(
          height: 60,
          width: 345,
          child: TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: ''
            ),
          ),
        ),
      ],
    );
  }
}