import 'package:flutter/material.dart';

Widget cardList(String title, bool completed) {
  return Padding(
    padding: const EdgeInsets.only(top: 10, right: 18, left: 18),
    child: SizedBox(
      height: 100,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 200,
                child: Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: completed == true ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: completed == true
                      ? const Text(
                          " Completed ",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          "Incompleted",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
