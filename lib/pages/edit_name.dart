import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class EditName extends StatefulWidget {
  const EditName({super.key});

  @override
  State<EditName> createState() => _EditNameState();
}

class _EditNameState extends State<EditName> {
  TextEditingController idproductoController = TextEditingController();
  TextEditingController nombreprodController = TextEditingController();
  TextEditingController tipoprodController = TextEditingController();
  TextEditingController cantprodController = TextEditingController();
  TextEditingController precioprodController = TextEditingController();
  TextEditingController idproveedorController = TextEditingController();
  TextEditingController colorprodController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
   idproductoController.text = arguments['idproducto'];
   nombreprodController.text = arguments['nombreprod'];
   tipoprodController.text = arguments['tipoprod'];
   cantprodController.text = arguments['cantprod'];
   precioprodController.text = arguments['precioprod'];
   idproveedorController.text = arguments['idproveedor'];
   colorprodController.text = arguments['colorprod'];
   
    return Scaffold(
      appBar: AppBar(
        title: Text("EDITAR PRODUCTO", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 158, 124, 155),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: idproductoController,
              decoration: InputDecoration(hintText: "Edite el ID"),
            ),
            TextField(
              controller: nombreprodController,
              decoration: InputDecoration(hintText: "Edite el Nombre"),
            ),
            TextField(
              controller: tipoprodController,
              decoration: InputDecoration(hintText: "Edite el Tipo"),
            ),
            TextField(
              controller: cantprodController,
              decoration: InputDecoration(hintText: "Edite la Cantidad"),
            ),
            TextField(
              controller: precioprodController,
              decoration: InputDecoration(hintText: "Edite el Precio"),
            ),
            TextField(
              controller: idproveedorController,
              decoration: InputDecoration(hintText: "Edite la ID del Proveedor"),
            ),
            TextField(
              controller: colorprodController,
              decoration: InputDecoration(hintText: "Edite el Color"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 237, 187, 244),
                foregroundColor: Colors.white,
              ),
              onPressed: () async {
                final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
                await updateProduct(
                  arguments['uid'],
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
              child: const Text("Actualizar")),
          ],
        ),
      ),
    );
  }
}