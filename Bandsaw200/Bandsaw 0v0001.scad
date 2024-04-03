$fn = 100;

Xsize = 38;
Ysize = 38;
ZSize = 1.8;
CornerRadius = 3;
HoleSize = 5;
XHoleOffset = 5;
YHoleOffset = 7;

SlotWidth = 8;
SlotDepth = 29;
SlotOffset = 15;
BevelWidth = 3;

BevelSize = sqrt(BevelWidth * BevelWidth + ZSize * ZSize);
BevelAngle = atan(ZSize / BevelWidth);

Root2 = 1.4142;

difference()
{
    Rcube2D( [Xsize, Ysize, ZSize], CornerRadius);
    translate( [Xsize/2-XHoleOffset-HoleSize/2, Ysize/2-YHoleOffset-HoleSize/2, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [Xsize/2-XHoleOffset-HoleSize/2, 0, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [Xsize/2-XHoleOffset-HoleSize/2, YHoleOffset+HoleSize/2-Ysize/2, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [XHoleOffset+HoleSize/2-Xsize/2, Ysize/2-YHoleOffset-HoleSize/2, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [XHoleOffset+HoleSize/2-Xsize/2, 0, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [XHoleOffset+HoleSize/2-Xsize/2, YHoleOffset+HoleSize/2-Ysize/2, -1] ) {
        cylinder ( ZSize+2, HoleSize/2, HoleSize/2);
    }
    translate( [SlotOffset-Xsize/2, (Ysize/2-SlotDepth), -1] ) {
        cube( [SlotWidth, SlotDepth + 1, ZSize+2] );
    }
    translate( [-(SlotOffset-Xsize/2), (Ysize/2-SlotDepth), 0  ] ) {
        rotate( [0, -BevelAngle, 0]){     
            translate ([BevelSize / 2, 0, BevelSize / 2]) { 
                cube( [BevelSize, SlotDepth + 1, BevelSize] );
            }
        }
    }
    translate( [-(SlotOffset-Xsize/2), (Ysize/2-SlotDepth), 0  ] ) {
        rotate( [0, -BevelAngle, 0]){ 
                cube( [BevelSize, SlotDepth + 1, BevelSize] );
        }
    }
}

 
module Rcube2D(size = [1, 1, 1], Radius)
{
    width = 0; depth = 1; height = 2.0;

    hull()
    {
        translate([ Radius - size[width] / 2, Radius - size[depth] / 2, size[height] / 2] )
        cylinder(r = Radius, h = size[height], center = true);
        translate([ size[width] / 2 - Radius, Radius - size[depth] / 2, size[height] / 2] )
        cylinder(r = Radius, h = size[height], center = true);
        translate([ Radius - size[width] / 2, size[depth] / 2 - Radius, size[height] / 2] )
        cylinder(r = Radius, h = size[height], center = true);
        translate([ size[width] / 2 - Radius, size[depth] / 2 - Radius, size[height] / 2] )
        cylinder(r = Radius, h = size[height], center = true);
    }
}