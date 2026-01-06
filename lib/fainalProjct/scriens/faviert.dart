import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/stayle/textStayle.dart';

class Faviert extends StatefulWidget {
  @override
  State<Faviert> createState() => _FaviertState();
}

class _FaviertState extends State<Faviert> {
  List<ModelProduct> getAllList() {
    return [...GearList, ...GamesList, ...UpcomingGamesList];
  }

  cancel(List<ModelProduct> ims, int i) {
    List<ModelProduct> getAllList() {
      return [...GearList, ...GamesList, ...UpcomingGamesList];
    }
  }

  cancelFaviert(
      List<ModelProduct> nameList,
      List<ModelProduct> nameList2,
      int index,
      ) {
    if (nameList[index].isFav == true) {
      setState(() {
        nameList[index] = nameList[index].copyWith(isFav: false);
        return print("");
      });
    }

    if (nameList2[index].isFav == true) {
      setState(() {
        nameList2[index] = nameList2[index].copyWith(isFav: false);
        return print("yass");
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<ModelProduct> isfavert = getAllList()
        .where((e) => e.isFav == true)
        .toList();

    return Scaffold(
      body: isfavert.isNotEmpty
          ? Column(
        children: [
          Expanded(
            child: Container(
              child: ListView.builder(
                itemCount: isfavert.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(isfavert[index].namePrdact),
                      trailing: Image.asset(isfavert[index].photoProdact),
                      leading: InkWell(
                        onTap: () => cancel(isfavert, index),
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
          Text("NO Iteme Favirte", style: Textstayle.textStyle),
        ],
      ),
    );
  }
}