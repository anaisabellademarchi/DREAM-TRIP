import 'package:dreamtrip/tela_de_compra/metodos_de_pagamento.dart';
import 'package:dreamtrip/telas_de_login/tela_de_login.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Login(),
                  ),
                );
              },
              icon: const Icon(Icons.login),
            ),
            const SizedBox(
              width: 10,
            )
          ],
          backgroundColor: Colors.transparent,
          title: Center(
            child: SizedBox(
              width: 60,
              child: Image.asset("logo.png"),
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('fundo.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            children: const <Widget>[
              ProductCardItem(
                imagePath: "cachoeirasp.png",
                productName: "Cachoeira do Sagui, Emburá do Alto ",
                productDescription:
                    "A Cachoeira do Sagui é uma opção encantadora para quem busca uma pausa, ainda na na zona sul de São Paulo. ",
              ),
              ProductCardItem(
                imagePath: "museudasartessp.png",
                productName: "Museu de Arte de São Paulo Assis Chateaubriand",
                productDescription:
                    "Com mais de 11 mil obras para conhecer, levar sua familia e muito mais",
              ),
              ProductCardItem(
                imagePath: "olimpia.png",
                productName: "Olímpia",
                productDescription:
                    "Uma ótima opção para ir com a família, principalmente para as crianças, lá tem um parque aquático incrível, com diversas opções de brinquedos e até mesmo uma fazendinha dentro dele.",
              ),
              ProductCardItem(
                imagePath: "camposdojordao.png",
                productName: "Campos do Jordão",
                productDescription:
                    "Com certeza a cidade mais procurada para passeios românticos, ficando lotada no dia dos namorados.",
              ),
              ProductCardItem(
                imagePath: "parqueamantikir.png",
                productName: "Parque Amantikir",
                productDescription:
                    "O Amantikir é um parque todo arborizado e florido, com lagos, labirintos e uma linda vista da Serra da Mantiqueira. É um lugar encantador, onde você vai poder curtir",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductCardItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String productDescription;

  const ProductCardItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.productDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(
              child: Image.asset("logo.png"),
            ),
            title: Text(productName),
            subtitle: const Text("Local"),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.asset(imagePath),
          Container(
            padding: const EdgeInsets.all(10),
            child: Text(productDescription),
          ),
          ButtonTheme(
            child: ButtonBar(
              children: <Widget>[
                ElevatedButton(
                  child: const Text('Comprar'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MetodosDePagamentos(),
                      ),
                    );
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: const Text("Compra realizada"),
                          content: const Text(
                              "O produto foi adicionado ao carrinho."),
                          actions: <Widget>[
                            TextButton(
                              child: const Text("OK"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
