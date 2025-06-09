import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class AddName extends StatefulWidget {
  const AddName({super.key});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  TextEditingController idproductoController = TextEditingController();
  TextEditingController nombreprodController = TextEditingController();
  TextEditingController tipoprodController = TextEditingController();
  TextEditingController cantprodController = TextEditingController();
  TextEditingController precioprodController = TextEditingController();
  TextEditingController idproveedorController = TextEditingController();
  TextEditingController colorprodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AGREGAR PRODUCTO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 158, 124, 155),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: idproductoController,
              decoration: InputDecoration(hintText: "Ingrese Id del Producto"),
            ),
            TextField(
              controller: nombreprodController,
              decoration: InputDecoration(hintText: "Ingrese Nombre del Producto"),
            ),
            TextField(
              controller: tipoprodController,
              decoration: InputDecoration(hintText: "Ingrese Tipo de Producto"),
            ),
            TextField(
              controller: cantprodController,
              decoration: InputDecoration(hintText: "Ingrese Cantidad de Producto"),
            ),
            TextField(
              controller: precioprodController,
              decoration: InputDecoration(hintText: "Ingrese Precio del Producto"),
            ),
            TextField(
              controller: idproveedorController,
              decoration: InputDecoration(hintText: "Ingrese ID del Proveedor"),
            ),
            TextField(
              controller: colorprodController,
              decoration: InputDecoration(hintText: "Ingrese Color del Producto"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 237, 187, 244),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                await addProduct(
                  idproductoController.text,
                  nombreprodController.text,
                  tipoprodController.text,
                  cantprodController.text,
                  precioprodController.text,
                  idproveedorController.text,
                  colorprodController.text,
                );
                Navigator.pop(context);
              },
              child: const Text("Guardar"),
            ),
          ],
        ),
      ),
    );
  }
}