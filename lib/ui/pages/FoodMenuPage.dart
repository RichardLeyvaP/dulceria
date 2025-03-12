

import 'package:flutter/material.dart';

class FoodMenuPage extends StatefulWidget {
  @override
  _FoodMenuPageState createState() => _FoodMenuPageState();
}

class _FoodMenuPageState extends State<FoodMenuPage> {
  final List<Map<String, dynamic>> menuItems = [
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'Opción 1',
      'description': 'Descripción del plato 1',
      'price': 30.0,
      'quantity': 0
    },
    {
      'image': 'https://via.placeholder.com/100',
      'title': 'Opción 2',
      'description': 'Descripción del plato 2',
      'price': 25.0,
      'quantity': 0
    },
  ];

  void _updateQuantity(int index, int change) {
    setState(() {
      menuItems[index]['quantity'] =
          (menuItems[index]['quantity'] + change).clamp(0, 99);
    });
  }

  void _showOrderSummary() {
  List<Map<String, dynamic>> selectedItems =
      menuItems.where((item) => item['quantity'] > 0).toList();
  double totalPrice =
      selectedItems.fold(0, (sum, item) => sum + (item['quantity'] * item['price']));
  int totalItems = selectedItems.fold<int>(0, (sum, item) => sum + (item['quantity'] as int));

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Center(
          child: Text(
            'Detalles del Pedido',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Divider(),
              Text(
                'Total a pagar: R\$ ${totalPrice.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.green),
              ),
              SizedBox(height: 8),
              Text(
                'Cantidad total de pedidos: $totalItems',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              ...selectedItems.map((item) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${item['quantity']} x ${item['title']}',
                          style: TextStyle(fontSize: 16),
                        ),
                        Text(
                          'R\$ ${(item['quantity'] * item['price']).toStringAsFixed(2)}',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Número de mesa',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar', style: TextStyle(color: Colors.red)),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            onPressed: () {
              // Aquí puedes manejar el envío de datos a la base de datos
              Navigator.pop(context);
            },
            child: Text('Pagar', style: TextStyle(color: Colors.white)),
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carta')),
      body: ListView.builder(
        itemCount: menuItems.length,
        itemBuilder: (context, index) {
          final item = menuItems[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(item['image']),
                    radius: 30,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(item['title'], style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                        Text(item['description']),
                        Text('R\$ ${item['price'].toStringAsFixed(2)}',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.remove, color: Colors.red),
                        onPressed: () => _updateQuantity(index, -1),
                      ),
                      Text(item['quantity'].toString()),
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.green),
                        onPressed: () => _updateQuantity(index, 1),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _showOrderSummary,
        label: Text('Pedir'),
        icon: Icon(Icons.shopping_cart),
      ),
    );
  }
}
