package store;

import haxe.ds.*;
import components.Box2D;
import components.*;

var bodies:Vector<B2BodyComponent> = new Vector(10);
var worlds:Vector<B2WorldComponent> = new Vector(1);
var fixtures:Vector<B2FixtureComponent> = new Vector(10);
var joints:Vector<B2JointComponent> = new Vector(10);
var transforms:Vector<TransformComponent> = new Vector(10);
var graphics:Vector<GraphicsComponent> = new Vector(10);
