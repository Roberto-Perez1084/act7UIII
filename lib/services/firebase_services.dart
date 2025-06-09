import 'package:cloud_firestore/cloud_firestore.dart';
// ignore: unused_import
import 'package:flutter/material.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getProduct() async {
  List product = [];
  CollectionReference collectionReferenceProduct = db.collection("Product");
  QuerySnapshot queryProduct = await collectionReferenceProduct.get();
  for (var doc in queryProduct.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final Product = {
    "idproducto": data['idproducto'],
    "uid": doc.id,
    "nombreprod": data['nombreprod'],
    "tipoprod": data['tipoprod'],
    "cantprod": data['cantprod'],
    "precioprod": data['precioprod'],
    "idproveedor": data['idproveedor'],
    "colorprod": data['colorprod'],
  };
  

    product.add(Product);
  }
  await Future.delayed(const Duration(seconds: 5));
  return product;
}

Future<void> addProduct(
  String idproducto, 
  String nombreprod, 
  String tipoprod, 
  String cantprod, 
  String precioprod, 
  String idproveedor,
  String colorprod,
) async {
  await FirebaseFirestore.instance.collection('Product').doc().set({
    'idproducto': idproducto,
    'nombreprod': nombreprod,
    'tipoprod': tipoprod,
    'cantprod': cantprod,
    'precioprod': precioprod,
    'idproveedor': idproveedor,
    'colorprod': colorprod,
  });
}

Future<void> updateProduct(
  String uid,
  String newidproducto,
  String newnombreprod,
  String newtipoprod,
  String newcantprod,
  String newprecioprod,
  String newidproveedor,
  String newcolorprod
) async {
  await db.collection("Product").doc(uid).update({
    "idproducto": newidproducto,
    "nombreprod": newnombreprod,
    "tipoprod": newtipoprod,
    "cantprod": newcantprod,
    "precioprod": newprecioprod,
    "idproveedor": newidproveedor,
    "colorprod": newcolorprod,
  });
}

Future<void> deleteProduct(String uid) async {
  await db.collection("Product").doc(uid).delete();
}