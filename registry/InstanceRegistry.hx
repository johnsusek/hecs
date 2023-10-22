package registry;

import haxe.ds.*;
import box2D.dynamics.joints.*;
import box2D.dynamics.*;
import util.DataStructures;
import store.InstancesStore;

var nextBodyIdx:Ref<Int> = new Ref(0);
var nextWorldIdx:Ref<Int> = new Ref(0);
var nextFixtureIdx:Ref<Int> = new Ref(0);
var nextJointIdx:Ref<Int> = new Ref(0);
var nextGraphicsIdx:Ref<Int> = new Ref(0);
var freeBodyIndices:Array<Int> = [];
var freeWorldIndices:Array<Int> = [];
var freeFixtureIndices:Array<Int> = [];
var freeJointIndices:Array<Int> = [];
var freeGraphicsIndices:Array<Int> = [];

function addInstance<T>(instance:T, instances:Vector<T>, nextIdx:Ref<Int>, freeIndices:Array<Int>):Int {
	var idx:Int;

	if (freeIndices.length > 0) {
		idx = freeIndices.pop();
	}
	else {
		idx = nextIdx.value++;
	}

	instances[idx] = instance;

	trace('Added instance ${idx} to ${instances}');

	return idx;
}

function removeInstance<T>(id:Int, instances:Vector<T>, freeIndices:Array<Int>):Void {
	trace('Removing instance ${id} from ${instances}');
	instances[id] = null;
	freeIndices.push(id);
}

function addBody(body:B2Body):Int {
	return addInstance(body, bodies, nextBodyIdx, freeBodyIndices);
}

function removeBody(id:Int):Void {
	removeInstance(id, bodies, freeBodyIndices);
}

function addWorld(world:B2World):Int {
	return addInstance(world, worlds, nextWorldIdx, freeWorldIndices);
}

function removeWorld(id:Int):Void {
	removeInstance(id, worlds, freeWorldIndices);
}

function addFixture(fixture:B2Fixture):Int {
	return addInstance(fixture, fixtures, nextFixtureIdx, freeFixtureIndices);
}

function removeFixture(id:Int):Void {
	removeInstance(id, fixtures, freeFixtureIndices);
}

function addJoint(joint:B2Joint):Int {
	return addInstance(joint, joints, nextJointIdx, freeJointIndices);
}

function removeJoint(id:Int):Void {
	removeInstance(id, joints, freeJointIndices);
}

function addGraphics(graphic:h2d.Graphics):Int {
	return addInstance(graphic, graphics, nextGraphicsIdx, freeGraphicsIndices);
}

function removeGraphics(id:Int):Void {
	removeInstance(id, graphics, freeGraphicsIndices);
}
