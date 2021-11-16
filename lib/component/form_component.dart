import 'package:flutter/material.dart';

Widget titleForm(String title, double marTop) {
  return Padding(
    padding: EdgeInsets.only(top: marTop, right: 18, left: 20),
    child: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    ),
  );
}

Widget formSimple(String hintText, String textValidator,
    TextEditingController controller, TextInputType keyboardtype) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return textValidator;
        }
        return null;
      },
    ),
  );
}

Widget formDropdown(var value, String validatorText, String hintext,
    Map mapDropdown, Function(dynamic) onchange) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
    child: DropdownButtonFormField(
      isExpanded: true,
      value: value,
      validator: (value) {
        if (value == null) {
          return validatorText;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: hintext,
        fillColor: Colors.grey[200],
        filled: true,
        errorStyle: const TextStyle(color: Colors.red),
        contentPadding:
            const EdgeInsets.only(top: 16, bottom: 16, right: 18, left: 10),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
      items: mapDropdown.keys.map<DropdownMenuItem<int>>((key) {
        return DropdownMenuItem<int>(
            value: key, child: Text(mapDropdown[key].toString()));
      }).toList(),
      onChanged: onchange,
    ),
  );
}

Widget formDate(Function() onTap, TextEditingController controller,
    String hinText, String validatorText) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
    child: InkWell(
      onTap: onTap,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: const TextStyle(color: Colors.black54),
          fillColor: Colors.grey[200],
          errorStyle: const TextStyle(color: Colors.red),
          //
          enabled: false,
          filled: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0)),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return validatorText;
          }
          return null;
        },
      ),
    ),
  );
}

Widget buttonComp(double marTop, String text, Function() onPressed) {
  return Padding(
    padding: EdgeInsets.only(top: marTop, right: 18, left: 18, bottom: 20),
    child: SizedBox(
      height: 58,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xff096D65)),
          ),
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
          onPressed: onPressed),
    ),
  );
}

Widget formSimpleLong(String hintText, String textValidator,
    TextEditingController controller, TextInputType keyboardtype) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      maxLines: 5,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        errorStyle: const TextStyle(color: Colors.red),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return textValidator;
        }
        return null;
      },
    ),
  );
}

Widget formSearch(String hintText, TextEditingController controller,
    TextInputType keyboardtype, Function(String) onchange) {
  return Padding(
    padding: const EdgeInsets.only(top: 20, right: 18, left: 18, bottom: 20),
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardtype,
      onChanged: onchange,
      decoration: InputDecoration(
        hintText: hintText,
        fillColor: Colors.grey[200],
        prefixIcon: const Icon(
          Icons.search,
          color: Color(0xff096D65),
        ),
        filled: true,
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0)),
      ),
    ),
  );
}
