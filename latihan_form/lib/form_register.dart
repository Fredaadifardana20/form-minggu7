import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormRegister extends StatefulWidget {
  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  List<String> jabatan = [
    "Dosen",
    "Admin",
    "Teknisi",
    "Mahasiswa",
  ];
  String _jabatan = "Mahasiswa";

  String _jk = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerPass = new TextEditingController();
  TextEditingController controllerNoHp = new TextEditingController();
  TextEditingController controllerGender = new TextEditingController();
  TextEditingController controllerAlamat = new TextEditingController();
  TextEditingController controllerDate = new TextEditingController();

  void _pilihJk(String value) {
    setState(() {
      _jk = value;
    });
  }

  void _pilihJabatan(String value) {
    setState(() {
      _jabatan = value;
    });
  }

  void kirimdata() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Nama Lengkap : ${controllerEmail.text}"),
            new Text("Nama Lengkap : ${controllerPass.text}"),
            new Text("Password : ${controllerNoHp.text}"),
            new Text("Moto Hidup : ${controllerGender.text}"),
            new Text("Moto Hidup : ${controllerAlamat.text}"),
            new Text("Moto Hidup : ${controllerDate.text}"),
            new Text("Jenis Kelamin : ${_jk}"),
            new Text("Jabatan : ${_jabatan}"),
            new ElevatedButton(
              child: new Text("OK"),
              onPressed: () => Navigator.pop(context),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.red)),
            ),
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  TextEditingController dateinput = TextEditingController(); //var global

  @override
  void initState() {
    // TODO: implement initState
    dateinput.text = "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: new Icon(Icons.list),
        title: new Text("Data diri"),
        backgroundColor: Colors.teal,
      ),
      body: new ListView(
        children: [
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    icon: Icon(Icons.people),
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0)),
                  ),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerEmail,
                  // obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      icon: Icon(Icons.email),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerPass,
                  obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Password",
                      labelText: "Password",
                      icon: Icon(Icons.password),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerNoHp,
                  // obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "No. Hp",
                      labelText: "No. Hp",
                      icon: Icon(Icons.call),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: new RadioListTile(
                        value: "laki-laki",
                        title: new Text("Laki-Laki"),
                        groupValue: _jk,
                        onChanged: (String? value) {
                          _pilihJk(value!);
                        },
                        activeColor: Colors.blue,
                        // subtitle: new Text("Pilih ini jika anda laki-laki"),
                      ),
                    ),
                    Padding(padding: new EdgeInsets.only(left: 15.0)),
                    Expanded(
                      child: new RadioListTile(
                        value: "perempuan",
                        title: new Text("Perempuan"),
                        groupValue: _jk,
                        onChanged: (String? value) {
                          _pilihJk(value!);
                        },
                        activeColor: Colors.blue,
                        // subtitle: new Text("Pilih ini jika anda perempuan"),
                      ),
                    ),
                  ],
                ),

                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerDate,
                  // obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Tanggal Lahir",
                      labelText: "Tanggal Lahir",
                      icon: Icon(Icons.date_range),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0))),
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            2000), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000

                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      //String formattedDate =
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate; //set output date to TextField value.
                        print(formattedDate);
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerAlamat,
                  // obscureText: true,
                  decoration: new InputDecoration(
                      hintText: "Alamat",
                      labelText: "Alamat",
                      icon: Icon(Icons.location_on),
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                // new TextField(
                //   controller: controllerMoto,
                //   maxLines: 3,
                //   decoration: new InputDecoration(
                //       hintText: "Moto Hidup",
                //       labelText: "Moto Hidup",
                //       border: new OutlineInputBorder(
                //           borderRadius: new BorderRadius.circular(20.0))),
                // ),
                // new Padding(
                //   padding: new EdgeInsets.only(top: 20.0),
                // ),
                // new RadioListTile(
                //   value: "laki-laki",
                //   title: new Text("Laki-Laki"),
                //   groupValue: _jk,
                //   onChanged: (String? value) {
                //     _pilihJk(value!);
                //   },
                //   activeColor: Colors.blue,
                //   subtitle: new Text("Pilih ini jika anda laki-laki"),
                // ),
                // new RadioListTile(
                //   value: "perempuan",
                //   title: new Text("Perempuan"),
                //   groupValue: _jk,
                //   onChanged: (String? value) {
                //     _pilihJk(value!);
                //   },
                //   activeColor: Colors.blue,
                //   subtitle: new Text("Pilih ini jika anda perempuan"),
                // ),
                // new Padding(
                //   padding: new EdgeInsets.only(top: 20.0),
                // ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "Jabatan",
                      style: new TextStyle(fontSize: 10.0, color: Colors.blue),
                    ),
                    new Padding(
                      padding: new EdgeInsets.only(left: 15.0),
                    ),
                    DropdownButton(
                      onChanged: (String? value) {
                        _pilihJabatan(value!);
                      },
                      value: _jabatan,
                      items: jabatan.map((String value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                    )
                  ],
                ),
                new ElevatedButton(
                  child: new Text(
                    "Register",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.blue),
                  ),
                  onPressed: () {
                    kirimdata();
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
