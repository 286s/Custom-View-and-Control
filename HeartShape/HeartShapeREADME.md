HeartShape
============

This is a custom layer could be used to mask custom view by using UIBezierPath.

[Blog Link]

Directory
----------

* HeartView.[mh]: The custom view demos how to use HeartShapeLayer as the mask.
* HeartShapeLayer.[mh]: The custom defined CAShapeLayer draw out a heart shape.
* UIBezierPath+HeartPath.[mh]: The category class of UIBezierPath give Class Method to return the path of heart shape based on the given size and postion. The color could be customized further.

Version
-------

1.0

To Use This
----------

Copy HeartShapeLayer.[hm] and UIBezierPath+HeartPath.[hm] files to your project, then set corresponding UIView's mask to the HeartShapeLayer. This layer could even be used by adding it to your view as a subLayer.

Reference
---------

* [Apple Doc: CAShape] - The reference file of CAShapeLayer.

[Apple Doc: CAShape]:https://developer.apple.com/library/ios/documentation/GraphicsImaging/Reference/CAShapeLayer_class/Reference/Reference.html
