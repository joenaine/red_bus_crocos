import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:async';

class CustomMarker {
  static Future<BitmapDescriptor> createCustomMarkerWithTitle(
      String svgAsset, String title) async {
    // Load SVG and convert to picture
    final String svgString = await rootBundle.loadString(svgAsset);
    final DrawableRoot svgDrawableRoot =
        await svg.fromSvgString(svgString, svgString);

    // Create an image from the SVG, scaling it to 150x150
    final ui.Picture picture =
        svgDrawableRoot.toPicture(size: const Size(130, 130));
    final ui.Image image = await picture.toImage(130, 130);

    // Convert the image to bytes
    final ByteData? byteData =
        await image.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List imageBytes = byteData!.buffer.asUint8List();

    // Create a canvas to draw the image and text
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);
    final Paint paint = Paint()..color = Colors.white;
    const double textOffset = 10.0;

    // Draw the image
    final ui.Image markerImage = await decodeImageFromList(imageBytes);
    final double imageWidth = markerImage.width.toDouble();
    final double imageHeight = markerImage.height.toDouble();

    // Draw the title text
    final TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      text: TextSpan(
        text: title,
        style: const TextStyle(
            fontSize: 40.0, color: Colors.black), // Adjust text size as needed
      ),
    );
    textPainter.layout();
    final double textWidth = textPainter.width;
    final double textHeight = textPainter.height;

    // Calculate total width and height
    final double totalWidth = imageWidth > textWidth ? imageWidth : textWidth;
    final double totalHeight = imageHeight + textHeight + textOffset;

    // Draw the image centered horizontally
    final double imageLeft = (totalWidth - imageWidth) / 2;
    canvas.drawImage(markerImage, Offset(imageLeft, 0), paint);

    // Draw the text below the image and centered
    final double textLeft = (totalWidth - textWidth) / 2;
    textPainter.paint(canvas, Offset(textLeft, imageHeight + textOffset));

    // End the recording and create a new image
    final ui.Image finalImage = await pictureRecorder.endRecording().toImage(
          totalWidth.toInt(),
          totalHeight.toInt(),
        );

    // Convert the final image to bytes
    final ByteData? finalByteData =
        await finalImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List finalImageBytes = finalByteData!.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(finalImageBytes);
  }
}
