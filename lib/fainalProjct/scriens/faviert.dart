import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';

import 'package:orojct/fainalProjct/stayle/textStayle.dart';

class Faviert extends StatefulWidget {
  @override
  State<Faviert> createState() => _FaviertState();
}

class _FaviertState extends State<Faviert> {
  List<ModelProduct> favList = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  void loadFavorites() {
    setState(() {
      favList = [...GearList, ...GamesList, ...UpcomingGamesList]
          .where((item) => item.isFav)
          .toList();
    });
  }

  void removeFavorite(int index) {
    setState(() {

      final itemToRemove = favList[index];


      for (int i = 0; i < GearList.length; i++) {
        if (GearList[i].namePrdact == itemToRemove.namePrdact) {
          GearList[i] = GearList[i].copyWith(isFav: false);
          break;
        }
      }


      for (int i = 0; i < GamesList.length; i++) {
        if (GamesList[i].namePrdact == itemToRemove.namePrdact) {
          GamesList[i] = GamesList[i].copyWith(isFav: false);
          break;
        }
      }


      for (int i = 0; i < UpcomingGamesList.length; i++) {
        if (UpcomingGamesList[i].namePrdact == itemToRemove.namePrdact) {
          UpcomingGamesList[i] = UpcomingGamesList[i].copyWith(isFav: false);
          break;
        }
      }


      loadFavorites();
    });
  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(
      body: favList.isNotEmpty
          ? Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: favList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(favList[index].namePrdact),
                      trailing: Image.asset(favList[index].photoProdact),
                      leading: InkWell(
                        onTap: () => removeFavorite(index),
                        child: Icon(Icons.favorite),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      )
          : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          LottieBuilder.network(
            "https://lottie.host/feda6d30-9450-4b78-9f01-3a93948365f7/Y5R9QxEdZa.json",
            repeat: true,
          ),
          Text("NO Iteme Favirte", style: Textstayle.textStyle3),
        ],
      ),
    );
  }
}