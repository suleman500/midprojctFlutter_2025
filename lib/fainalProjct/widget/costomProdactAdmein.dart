import 'package:flutter/material.dart';
import 'package:orojct/fainalProjct/models/dataLoginAndSingUp.dart';
import 'package:orojct/fainalProjct/models/prodactAll.dart';
import 'package:orojct/fainalProjct/widget/costom_discrbionGames.dart';
import 'package:orojct/orderDetalisPag.dart';
import 'package:page_transition/page_transition.dart';

class Costomprodactadmein extends StatefulWidget {
  ModelProduct games;
  VoidCallback? onTa7p;
  bool? ifvi;
  IconData? actionIcon;
  Color? iconColor;
  VoidCallback? onIconTap;

  Costomprodactadmein({
    required this.games,
    this.onTa7p,
    this.ifvi,
    this.actionIcon,
    this.iconColor,
    this.onIconTap,
  });

  @override
  State<Costomprodactadmein> createState() => _CostomprodactadmeinState();
}

class _CostomprodactadmeinState extends State<Costomprodactadmein> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.28,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
                InkWell(
                  onTap: widget.onIconTap,
                  child: Container(
                    child: Icon(
                      widget.actionIcon,
                      size: 26,
                      color: widget.iconColor ?? Colors.red,
                    ),
                  ),
                ),
              Expanded(
                child: Image.asset(
                  widget.games.photoProdact,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                widget.games.namePrdact,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.03,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 8),
                ],
              ),
              const SizedBox(height: 5),
              Text(
                "${widget.games.price.toString()}\$",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}