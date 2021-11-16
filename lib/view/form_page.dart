import 'dart:async';
import 'dart:ui';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:smartin_job/component/form_component.dart';
import 'package:smartin_job/model/model_todo.dart';
import 'package:smartin_job/service/api_service.dart';
import 'package:smartin_job/view/listtodo_page.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _formKey = GlobalKey<FormState>();
  var valJenis;
  Map<int, String> kelamin = {
    1: "Laki-Laki",
    2: "Perempuan",
  };
  var valPosisi;
  Map<int, String> posisi = {
    1: "Web Developer",
    2: "Mobile Developer",
    3: "UI/UX",
    4: "Quality Assurance"
  };

  TextEditingController dateController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController salaryController = TextEditingController();
  TextEditingController desController = TextEditingController();
  String tanggal = "";

  DateTime selectedDate = DateTime.now();
  String pilihDate = "";
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? d = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365000)),
      lastDate: DateTime.now().add(const Duration(days: 3650)),
    );
    if (d != null) {
      setState(() {
        pilihDate = DateFormat("dd/MM/yyyy").format(d);
        dateController.text = DateFormat("dd-MM-yyyy").format(d);
        tanggal = DateFormat("dd MMMM yyyy").format(d);
      });
    }
  }

  List<ModelTodo> data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Registrasi form"),
        backgroundColor: const Color(0xff096D65),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            titleForm("Nama lengkap", 30),
            formSimple("Masukan nama", "Nama tidak boleh kosong",
                namaController, TextInputType.text),
            titleForm("Jenis kelamin", 15),
            formDropdown(valJenis, "Jenis kelamin tidak boleh kosong",
                "Pilih jenis kelamin", kelamin, (value) {
              valJenis = value;
              setState(() {});
            }),
            titleForm("Tanggal lahir", 15),
            formDate(() {
              _selectDate(context);
            }, dateController, "Pilih tanggal lahir",
                "Tanggal lahir tidak boleh kosong"),
            titleForm("Alamat email", 15),
            formSimple(
                "Masukan alamat email",
                "Alamat email tidak boleh kosong",
                emailController,
                TextInputType.emailAddress),
            titleForm("Nomor handphone", 15),
            formSimple(
                "Masukan nomor handphone",
                "Nomor handphone tidak boleh kosong",
                phoneController,
                TextInputType.phone),
            titleForm("Posisi sebagai", 15),
            formDropdown(valPosisi, "Posisi tidak boleh kosong", "Pilih Posisi",
                posisi, (value) {}),
            titleForm("Expected salary", 15),
            formSimple(
                "Masukan Expected salary",
                "Expected salary tidak boleh kosong",
                salaryController,
                TextInputType.number),
            titleForm("Deskripsi diri", 15),
            formSimpleLong(
                "Masukan deskripsi diri",
                "Deskripsi diri tidak boleh kosong",
                desController,
                TextInputType.text),
            ...data.map((e) {
              return Text(e.title);
            }),
            buttonComp(30, "Submit", () {
              if (_formKey.currentState!.validate()) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ListTodoPage()));
              } else {}
            }),
          ],
        ),
      ),
    );
  }
}
