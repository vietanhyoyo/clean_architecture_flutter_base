import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final AlertDialog alertLoading = AlertDialog(
  content: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
    const CupertinoActivityIndicator(),
    Container(
        margin: const EdgeInsets.only(left: 30),
        child: const Text("Loading ..."))
  ]),
);
