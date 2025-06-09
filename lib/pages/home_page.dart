import 'package:flutter/material.dart';
import 'package:myapp/services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PRODUCTOS", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 158, 124, 155),
      ),
      body: FutureBuilder(
        future: getProduct(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  onDismissed: (direction) async {
                    await deleteProduct(snapshot.data?[index]['uid']);
                    snapshot.data?.removeAt(index);
                    setState(() {   
                    });
                  },
                  confirmDismiss: (direction) async {
                    bool result = false;
                    result = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Eliminar ${snapshot.data?[index]['nombreprod']}",
                          ),
                          content: Text("¿Estas seguro?"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text("No"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context, true);
                              },
                              child: Text("Si"),
                            ),
                          ],
                        );
                      },
                    );
                    return result;
                  },
                  background: Container(
                    color: Colors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  direction: DismissDirection.endToStart,

                  key: Key(snapshot.data?[index]['uid']),
                  child: ListTile(
                        title: Text(
                          snapshot.data?[index]['idproducto'] ?? '',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color.fromARGB(255, 69, 13, 95)),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 2),
                            Row(
                              children: [
                                Icon(Icons.key, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('ID: ${snapshot.data?[index]['idproducto'] ?? ''}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.sell, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('Nombre: ${snapshot.data?[index]['nombreprod'] ?? ''}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.music_note, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('Tipo: ${snapshot.data?[index]['tipoprod']?.toString() ?? ''}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.category, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('Cantidad: ${snapshot.data?[index]['cantprod']?.toString() ?? ''}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.man_4, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('ID Proveedor: ${snapshot.data?[index]['idproveedor'] ?? ''}'),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.palette, size: 18, color: Color.fromARGB(255, 143, 8, 155)),
                                const SizedBox(width: 6),
                                Text('Color: ${snapshot.data?[index]['colorprod'] ?? ''}'),
                              ],
                            ),
                          ],
                        ),
                    onTap: (() async {
                      await Navigator.pushNamed(context, "/edit", arguments: {
                        'idproducto': snapshot.data?[index]['idproducto'],
                        'nombreprod': snapshot.data?[index]['nombreprod'],
                        'tipoprod': snapshot.data?[index]['tipoprod'],
                        'cantprod': snapshot.data?[index]['cantprod'],
                        'precioprod': snapshot.data?[index]['precioprod'],
                        'idproveedor': snapshot.data?[index]['idproveedor'],
                        'colorprod': snapshot.data?[index]['colorprod'],
                        'uid': snapshot.data?[index]['uid'],
                      },);
                      setState(() {});
                    }),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        backgroundColor: const Color.fromARGB(255, 237, 187, 244),
        foregroundColor: Colors.white,
        child: Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}