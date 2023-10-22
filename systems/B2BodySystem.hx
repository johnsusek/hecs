package systems;

import box2D.common.math.*;
import box2D.dynamics.joints.*;
import box2D.dynamics.*;
import components.Box2D;

function createWorld(worldComp:B2WorldComponent):B2World {
	var gravity = new B2Vec2(worldComp.gravity.x, worldComp.gravity.y);
	var world = new B2World(gravity, worldComp.allowSleep);

	world.setWarmStarting(worldComp.warmStarting);
	world.setContinuousPhysics(worldComp.continuousPhysics);

	return world;
}

function createBody(world:B2World, bodyComp:B2BodyComponent):B2Body {
	var bd = new B2BodyDef();

	bd.position.set(bodyComp.position.x, bodyComp.position.y);
	bd.angle = bodyComp.angle;
	bd.linearVelocity.set(bodyComp.linearVelocity.x, bodyComp.linearVelocity.y);
	bd.angularVelocity = bodyComp.angularVelocity;
	bd.linearDamping = bodyComp.linearDamping;
	bd.angularDamping = bodyComp.angularDamping;
	bd.allowSleep = bodyComp.allowSleep;
	bd.awake = bodyComp.awake;
	bd.fixedRotation = bodyComp.fixedRotation;
	bd.bullet = bodyComp.bullet;
	bd.active = bodyComp.active;
	bd.userData = bodyComp.userData;

	switch (bodyComp.type.type) {
		case 'dynamic':
			bd.type = B2Body.b2_dynamicBody;
		case 'static':
			bd.type = B2Body.b2_staticBody;
		case 'kinematic':
			bd.type = B2Body.b2_kinematicBody;
		default:
			bd.type = B2Body.b2_dynamicBody;
	}

	return world.createBody(bd);
}

function createFixture(body:B2Body, fixtureComp:B2FixtureComponent):B2Fixture {
	var fd = new B2FixtureDef();
	fd.density = fixtureComp.density;
	fd.friction = fixtureComp.friction;
	fd.restitution = fixtureComp.restitution;
	fd.isSensor = fixtureComp.isSensor;
	fd.userData = fixtureComp.userData;

	// TODO: Switch on the shape type and create the corresponding shape
	// E.g. if it's a circle:
	// var circleShape = new B2CircleShape();
	// circleShape.setRadius(fixtureComp.shape.data);
	// fd.shape = circleShape;
	// return body.CreateFixture(fd);

	// STUB
	return null;
}

function createJoint(world:B2World, jointComp:B2JointComponent, bodyMap:Map<Int, B2Body>):B2Joint {
	var jd:B2JointDef;

	// TODO: Switch on the joint type and create the corresponding joint definition
	// E.g. if it's a revolute joint:
	// var rjd = new B2RevoluteJointDef();
	// rjd.Initialize(bodyMap.get(jointComp.bodyA), bodyMap.get(jointComp.bodyB), new B2Vec2(jointComp.anchorA.x, jointComp.anchorA.y));
	// jd = rjd;
	// return world.CreateJoint(jd);

	// STUB
	return null;
}
