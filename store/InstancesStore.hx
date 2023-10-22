package store;

import haxe.ds.*;
import box2D.dynamics.joints.*;
import box2D.dynamics.*;

var bodies:Vector<B2Body> = new Vector(100);
var worlds:Vector<B2World> = new Vector(100);
var fixtures:Vector<B2Fixture> = new Vector(100);
var joints:Vector<B2Joint> = new Vector(100);
var graphics:Vector<h2d.Graphics> = new Vector(100);
