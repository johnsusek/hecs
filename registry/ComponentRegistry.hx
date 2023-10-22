package registry;

import haxe.ds.*;
import util.DataStructures;
import components.Box2D;
import components.*;
import store.*;

var nextBodyIdx:Ref<Int> = new Ref(0);
var nextWorldIdx:Ref<Int> = new Ref(0);
var nextFixtureIdx:Ref<Int> = new Ref(0);
var nextJointIdx:Ref<Int> = new Ref(0);
var nextTransformIdx:Ref<Int> = new Ref(0);
var nextGraphicsIdx:Ref<Int> = new Ref(0);
var freeBodyIndices:Array<Int> = [];
var freeWorldIndices:Array<Int> = [];
var freeFixtureIndices:Array<Int> = [];
var freeJointIndices:Array<Int> = [];
var freeTransformIndices:Array<Int> = [];
var freeGraphicsIndices:Array<Int> = [];
var transformToEntityMap:Map<Int, Int> = new Map();

function getEntityByTransformId(transformId:Int):Null<Int> {
	return transformToEntityMap.get(transformId);
}

function add<T>(component:T, globalComponents:Vector<T>, nextIdx:Ref<Int>, freeIndices:Array<Int>):Int {
	var idx:Int;

	if (freeIndices.length > 0) {
		idx = freeIndices.pop();
	}
	else {
		idx = nextIdx.value++;

		if (idx >= globalComponents.length) {
			globalComponents = resizeVector(globalComponents, globalComponents.length * 2);
		}
	}

	globalComponents[idx] = component;

	trace("component idx", idx);

	return idx;
}

function remove<T>(id:Int, globalComponents:Vector<T>, freeIndices:Array<Int>):Void {
	globalComponents[id] = null;
	freeIndices.push(id);
}

function addBody(component:B2BodyComponent):Int {
	return add(component, ComponentsStore.bodies, nextBodyIdx, freeBodyIndices);
}

function addWorld(component:B2WorldComponent):Int {
	return add(component, ComponentsStore.worlds, nextWorldIdx, freeWorldIndices);
}

function addFixture(component:B2FixtureComponent):Int {
	return add(component, ComponentsStore.fixtures, nextFixtureIdx, freeFixtureIndices);
}

function addJoint(component:B2JointComponent):Int {
	return add(component, ComponentsStore.joints, nextJointIdx, freeJointIndices);
}

function addTransform(component:TransformComponent, entityId:Int):Int {
	var idx = add(component, ComponentsStore.transforms, nextTransformIdx, freeTransformIndices);
	transformToEntityMap.set(idx, entityId);
	return idx;
}

function addGraphics(component:GraphicsComponent):Int {
	return add(component, ComponentsStore.graphics, nextGraphicsIdx, freeGraphicsIndices);
}

function removeB2Body(id:Int):Void {
	remove(id, ComponentsStore.bodies, freeBodyIndices);
}

function removeB2World(id:Int):Void {
	remove(id, ComponentsStore.worlds, freeWorldIndices);
}

function removeB2Fixture(id:Int):Void {
	remove(id, ComponentsStore.fixtures, freeFixtureIndices);
}

function removeB2Joint(id:Int):Void {
	remove(id, ComponentsStore.joints, freeJointIndices);
}

function removeTransform(id:Int):Void {
	remove(id, ComponentsStore.transforms, freeTransformIndices);
	transformToEntityMap.remove(id);
}

function removeGraphics(id:Int):Void {
	remove(id, ComponentsStore.graphics, freeGraphicsIndices);
}
