import 'package:flutter/material.dart';
import 'package:vector_graphics/vector_graphics.dart';

class AssetIcon extends StatelessWidget {
  final String assetName;
  final double?  width;
  final double?  height;
  const AssetIcon({super.key, required this.assetName, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width:width ,
      height: height,
      child: VectorGraphic(
        loader: AssetBytesLoader(assetName),
      ),
    );
  }
}
