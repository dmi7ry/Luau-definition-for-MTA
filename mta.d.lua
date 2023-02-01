declare class Vector2
end

declare class Vector3
	create: (x: number?, y: number?, z: number?) -> Vector3
	cross: (vector: Vector3) -> Vector3
	dot: (vector: Vector3) -> number
	normalize: () -> boolean
	getX: () -> number
	getY: () -> number
	getZ: () -> number
	setX: (x: number) -> boolean
	setY: (y: number) -> boolean
	setZ: (z: number) -> boolean
	getNormalized: () -> Vector3
	getSquaredLength: () -> Vector3
	getLength: () -> any
	intersectsSegmentTriangle: (segmentDir: Vector3, triVert0: Vector3, triVert1: Vector3, triVert2: Vector3) -> Vector3
	intersectsSegmentTriangle: (origin: Vector3, segmentDir: Vector3, triVert1: Vector3, triVert2: Vector3) -> Vector3
end

declare class Vector4
end

declare class ACL
	name: string

	__call: () -> ACL
	get: (aclName: string) -> ACL
	list: () -> { [number]: ACL }

	function destroy(self): boolean
	function getName(self): string
	function getRight(self, rightName: string): string
	function setRight(self, rightName: string, hasAccess: boolean): boolean
	function listRights(self, allowedType: string): { [number]: string }
	function removeRight(self, rightName: string): boolean
end
declare ACL: ACL

declare class ACLGroup
	name: string
	objects: { [any]: any }
	aclList: { [any]: any }

	__call: () -> ACLGroup
	get: (groupName: string) -> ACLGroup
	list: () -> { [number]: ACL }


	function destroy(self): boolean
	function addACL(self, acl: ACL): boolean
	function addObject(self, theObjectName: string): boolean
	function getName(self): string
	function listACL(self): { [any]: any }
	function listObjects(self): { [any]: any }
	function removeACL(self, acl: ACL): boolean
	function removeObject(self, theObjectString: string): boolean
	function doesContainObject(self, theGroup: ACLGroup): boolean
end
declare ACLGroup: ACLGroup

declare class Element
	alpha: number
	angularVelocity: Vector3
	attached: boolean
	collisions: boolean
	colShape: ColShape
	dimension: number
	distanceFromCentreOfMassToBaseOfModel: number
	doubleSided: boolean
	elementsWithin: { [number]: Element }
	frozen: boolean
	health: number
	id: string
	interior: number
	inWater: boolean
	lighting: number
	localElement: boolean
	lowLOD: Element
	matrix: { [number]: { [number]: number } }
	model: number
	onScreen: boolean
	parent: Element
	position: Vector3
	radius: number
	rotation: Vector3
	streamable: boolean
	syncedByLocalPlayer: boolean
	type: string
	velocity: Vector3
	waitingForGroundToLoad: boolean

	__call: (elementType: string, elementID: string?) -> Element
	getByID: (id: string, index: number?) -> Element | boolean
	getAllByType: (type: string, startat: Element?) -> { [number]: Element }
	getAllByType: (type: string, startat: Element?, streamedIn: boolean?) -> { [number]: Element }
	getByIndex: (type: string, index: number) -> Element

	function addDataSubscriber(self, element: Element, key: string, player: Player): boolean
	function attach(self, theAttachToElement: Element, xPosOffset: number?, yPosOffset: number?, zPosOffset: number?, xRotOffset: number?, yRotOffset: number?, zRotOffset: number?): boolean
	function clearVisibility(self): boolean
	function clone(self, element: Element, xPos: number?, yPos: number?, zPos: number?, cloneChildren: boolean?): Element
	function destroy(self): boolean
	function detach(self, theAttachToElement: Element): boolean
	function getAllData(self): { [string]: any }
	function getAlpha(self): number
	function getAngularVelocity(self): (number, number, number)
	function getAttachedElements(self): { [number]: Element }
	function getAttachedOffsets(self): (number, number, number, number, number, number)
	function getAttachedTo(self): Element
	function getBoundingBox(self): (number, number, number, number, number, number)
	function getChild(self, index: number): Element | boolean
	function getChildren(self, type: string?): { [number]: Element }
	function getChildrenCount(self): number
	function getCollisionsEnabled(self): boolean
	function getColShape(self): ColShape
	function getData(self, key: string, inherit: boolean?): any
	function getDimension(self): number
	function getDistanceFromCentreOfMassToBaseOfModel(self): number
	function getElementLighting(self): number
	function getElementsWithin(self, elemType: string?): { [number]: Element }
	function getHealth(self): number
	function getID(self): string
	function getInterior(self): number
	function getLowLOD(self): Element
	function getMatrix(self): { [number]: { [number]: number } }
	function getModel(self): number
	function getParent(self): Element
	function getPosition(self): (number, number, number)
	function getRadius(self): number
	function getRotation(self): (number, number, number)
	function getSyncer(self): Element
	function getType(self): string
	function getVelocity(self): (number, number, number)
	function getWithinRange(self, x: number, y: number, z: number, range: number, elemType: string?, interior: number?, dimension: number?): { [number]: Element }
	function getZoneName(self, citiesonly: boolean): string
	function hasDataSubscriber(self, element: Element, key: string, player: Player): boolean
	function isAttached(self): boolean
	function isCallPropagationEnabled(self): boolean
	function isCollidableWith(self, withElement: Element): boolean
	function isDoubleSided(self): boolean
	function isFrozen(self): boolean
	function isInWater(self): boolean
	function isLocal(self): boolean
	function isLowLOD(self): boolean
	function isOnScreen(self): boolean
	function isStreamable(self): boolean
	function isSyncer(self): boolean
	function isVisibleTo(self, element: Element, visibleTo: Element): boolean
	function isWaitingForGroundToLoad(self): boolean
	function isWithinColShape(self, colshape: ColShape): boolean
	function removeData(self, key: string): boolean
	function removeDataSubscriber(self, element: Element, key: string, player: Player): boolean
	function setAlpha(self, alpha: number): boolean
	function setAngularVelocity(self, rx: number, ry: number, rz: number): boolean
	function setAttachedOffsets(self, xPosOffset: number?, yPosOffset: number?, zPosOffset: number?, xRotOffset: number?, yRotOffset: number?, zRotOffset: number?): boolean
	function setCallPropagationEnabled(self, enabled: boolean): boolean
	function setCollidableWith(self, withElement: Element, enabled: boolean): boolean
	function setCollisionsEnabled(self, enabled: boolean): boolean
	function setData(self, key: string, value: any, synchronize: boolean): boolean
	function setDimension(self, dimension: number): boolean
	function setDoubleSided(self, enable: boolean): boolean
	function setFrozen(self, freezeStatus: boolean): boolean
	function setHealth(self, newHealth: number): boolean
	function setID(self, name: string): boolean
	function setInterior(self, interior: number, x: number?, y: number?, z: number?): boolean
	function setLowLOD(self, lowLODElement: Element): boolean
	function setMatrix(self, matrix: { [number]: { [number]: number } }): boolean
	function setModel(self, model: number): boolean
	function setParent(self, parent: Element): boolean
	function setPosition(self, x: number, y: number, z: number, warp: boolean?): boolean
	function setRotation(self, rotX: number, rotY: number, rotZ: number, rotOrder: string?, conformPedRotation: boolean?): boolean
	function setStreamable(self, streamable: boolean): boolean
	function setSyncer(self, player: Player): boolean
	function setVelocity(self, speedX: number, speedY: number, speedZ: number): boolean
	function setVisibleTo(self, visibleTo: Element, visible: boolean): boolean

end
declare Element: Element

declare class Team extends Element
end

declare class ColShape extends Element
	shapeType: number
	elementsWithin: { [number]: Element }

	Circle: (x: number, y: number, index: number) -> ColShape
	Cuboid: (x: number, y: number, z: number, width: number, depth: number, height: number) -> ColShape
	Polygon: (centerX: number, centerY: number, x1: number, y1: number, x2: number, y2: number, x3: number, y3: number, ...number) -> ColShape
	Rectangle: (x: number, y: number, width: number, height: number) -> ColShape
	Sphere: (x: number, y: number, radius: number) -> ColShape
	Tube: (x: number, y: number, radius: number, height: number) -> ColShape

	function addPoint(self, x: number, y: number, index: number?): boolean
	function getHeight(self): number
	function getPoints(self): { [number]: number }
	function getPointPosition(self, index: number): (number, number)
	function getShapeType(self): number
	function getRadius(self): number
	function getSize(self): (number, number, number)
	function getElementsWithin(self): { [number]: Element }
	function isInside(self, x: number, y: number, z: number): boolean
	function removePoint(self, index: number): boolean
	function setHeight(self, floor: number, ceil: number): boolean
	function setPointPosition(self, index: number, x: number, y: number): boolean
	function setRadius(self, radius: number): boolean
	function setSize(self, width: number, depth: number, height: number): boolean
end
declare ColShape: ColShape

declare class Player extends Element
	blurLevel: number
	mapForced: boolean
	money: number
	name: string
	nametagShowing: boolean
	nametagText: string
	ping: number
	team: Team
	wantedLevel: number
	account: Player

	function ban(self, IP: boolean?, Username: boolean?, Serial: boolean?, responsiblePlayer: Player? | string?, reason: string?, seconds: number?): Ban
	function forceMap(self, forceOn: boolean): boolean
	function getBlurLevel(self): number
	function getMapOpacity(self): number
	function getMoney(self): number
	function getName(self): string
	function getNametagColor(self): (number, number, number)
	function getNametagText(self): string
	function getPing(self): number
	function getTeam(self): Team
	function getWantedLevel(self): number
	function giveMoney(self, amount: number): boolean
	function isMapForced(self): boolean
	function isNametagShowing(self): boolean
	function isVoiceEnabled(self): boolean
	function setBlurLevel(self): boolean
	function setHudComponentVisible(self, component: string, show: boolean): boolean
	function setMoney(self, amount: number, instant: boolean?): boolean
	function setNametagColor(self, state: boolean): boolean
	function setNametagColor(self, red: number, green: number, blue: number): boolean
	function setNametagShowing(self, showing: boolean): boolean
	function setNametagText(self, text: string): boolean
	function takeMoney(self, amount: number): boolean
	function getAccount(self): Player
	function logIn(self): boolean
	function logOut(self): boolean
end

declare class Account
	data: { [string]: number|string|boolean }
	guest: boolean
	id: number
	ip: string
	name: string
	password: string
	player: Player
	serial: string

	add: (name: string, password: string, allowCaseVariations: boolean?) -> Account
	getAll: () -> { [number]: Account }
	getAllByData: (dataName: string, value: string) -> { [number]: Account } | boolean
	getAllByIP: (ip: string) -> { [number]: Account } | boolean
	getAllBySerial: () -> { [number]: Account } | boolean

	function copyDataTo(self, fromAccount: Account): boolean
	function getAllData(self): { [string]: number|string|boolean }
	function getData(self, key: string): string
	function getID(self): number
	function getIP(self): string
	function getName(self): string
	function getPlayer(self): Player
	function getSerial(self): string
	function isGuest(self): boolean
	function remove(self): boolean
	function setData(self, key: string, value: number|string|boolean): boolean
	function setName(self, name: string, allowCaseVariations: boolean): boolean
	function setPassword(self, password: string): boolean
end
declare Account: Account

declare class Ban
	admin: string
	ip: string
	reason: string
	serial: string
	time: number

	__call: (IP: string?, Username: string?, Serial: string?, responsibleElement: Player?, reason: string?, seconds: number?) -> Ban
	getList: () -> { [number]: Ban }

	function ban(self, bannedPlayer: Player, IP: boolean?, Username: boolean?, Serial: boolean?, responsiblePlayer: Player? | string?, reason: string?, seconds: number?): Ban
	function getAdmin(self): string
	function getIP(self): string
	function getReason(self): string
	function getSerial(self): string
	function getTime(self): number
	function setAdmin(self, admin: string): boolean
	function setReason(self, reason: string): boolean
	function setUnbanTime(self, time: number): boolean
	function remove(self, responsibleElement: Player): boolean
end

declare class Vehicle extends Element
	blown: boolean
	compatibleUpgrades: { [number]: any }
	controller: Player
	damageProof: boolean
	derailable: boolean
	derailed: boolean
	direction: boolean
	engineState: boolean
	handling: { [string]: any }
	idleRespawnDelay: number
	landingGearDown: boolean
	locked: boolean
	maxPassengers: number
	name: string
	occupants: { [number]: Player }
	onGround: boolean
	overrideLights: number
	paintjob: number
	plateText: string
	respawnDelay: number
	respawnPosition: Vector3
	respawnRotation: Vector3
	sirenParams: { [any]: any }
	sirens: { [any]: any }
	sirensOn: boolean
	taxiLightOn: boolean
	towedByVehicle: Vehicle
	towingVehicle: Vehicle
	trainPosition: number
	trainSpeed: number
	turnVelocity: Vector3
	turretPosition: Vector2
	upgrades: { [number]: number }
	vehicleType: string

	__call: (model: number, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?, numberplate: string?, bDirection: boolean?, variant1: number?, variant2: number?) -> Vehicle
	getAllOfType: (model: number) -> { [number]: Vehicle }

	function addSirens(self, sirenCount: number, sirenType: number, flag360: boolean?, checkLosFlag: boolean?, useRandomiser: boolean?, silentFlag: boolean?): boolean
	function addUpgrade(self, upgrade: string | number): boolean
	function attachTrailer(self, trailer: Vehicle): boolean
	function blow(self, explode: boolean): boolean
	function detachTrailer(self, trailer: Vehicle?): boolean
	function fix(self): boolean
	function getDirection(self): boolean
	function getTrainPosition(self): number
	function getColor(self, is_rgb: boolean): ...number
	function getCompatibleUpgrades(self, slot: number?): { [number]: any }
	function getController(self): Player | boolean
	function getDoorOpenRatio(self, door: number): number
	function getDoorState(self, door: number): number
	function getEngineState(self): boolean
	function getHandling(self): { [any]: any }
	function getHeadLightColor(self): (number, number, number)
	function getLangingGearDown(self): boolean
	function getLightState(self, light: number): number
	function getMaxPassengers(self): number
	function getModelFromName(self, name: string): number
	function getName(self): string
	function getNameFromModel(self, model: number): string
	function getOccupant(self, seat: number?): Player | boolean
	function getOccupants(self): { [number]: Player }
	function getOverrideLights(self): number
	function getPaintjob(self): number
	function getPanelState(self, panel: number): number
	function getPlateText(self): string
	function getRespawnPosition(self): (number, number, number)
	function getRespawnRotation(self): (number, number, number)
	function getSirenParams(self): { [any]: any }
	function getSirens(self): { [any]: any }
	function areSirensOn(self): boolean
	function getTowedByVehicle(self): Vehicle
	function getTowingVehicle(self): Vehicle
	function getTurnVelocity(self): (number, number, number)
	function getTurretPosition(self): (number, number)
	function getVehicleType(self): string
	function getUpgradeOnSlot(self, slot: number): number
	function getUpgrades(self): { [number]: number }
	function getVariant(self): (number, number)
	function getWheelStates(self): (number, number, number, number)
	function isDerailable(self): boolean
	function isDerailed(self): boolean
	function isBlown(self): boolean
	function isDamageProof(self): boolean
	function isLocked(self): boolean
	function isOnGround(self): boolean
	function isTaxiLightOn(self): boolean
	function respawn(self): boolean
	function setDerailable(self, derailable: boolean): boolean
	function setDerailed(self, derailed: boolean): boolean
	function setDirection(self, clockwise: boolean): boolean
	function setTrainPosition(self, position: number): boolean
	function setSpeed(self, speed: number): boolean
	function setColor(self, id1: number, id2: number, id3: number, id4: number): boolean
	function setColor(self, r1: number, g1: number, b1: number, r2: number?, g2: number?, b2: number?, r3: number?, g3: number?, b3: number?, r4: number?, g4: number?, b4: number?): boolean
	function setDamageProof(self, damageProof: number): boolean
	function setDoorOpenRatio(self, door: number, ratio: number, time: number?): boolean
	function setDoorState(self, door: number, state: number): boolean
	function setDoorsUndamageable(self, state: boolean): boolean
	function setEngineState(self, engineState: boolean): boolean
	function setFuelTankExplodable(self, explodable: boolean): boolean
	function setHeadLightColor(self, red: number, green: number, blue: number): boolean
	function setIdleRespawnDelay(self, timeDelay: number): boolean
	function setLightState(self, light: number, state: number): boolean
	function setLocked(self, locked: boolean): boolean
	function setOverrideLights(self, value: number)
	function setPanelState(self, panelID: number, state: number): boolean
	function setPlateText(self, numberplate: string): boolean
	function setRespawnDelay(self, timeDelay: number): boolean
	function setRespawnPosition(self, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?): boolean
	function setRespawnRotation(self, rx: number, ry: number, rz: number): boolean
	function setSirens(self, sirenPoint: number, posX: number, posY: number, posZ: number, red: number, green: number, blue: number, alpha: number?, minAlpha: number?): boolean
	function setSirensOn(self, sirensOn: number): boolean
	function setTaxiLightOn(self, LightState: number): boolean
	function setTurnVelocity(self, rx: number, ry: number, rz: number): boolean
	function setTurretPosition(self, positionX: number, positionY: number): boolean
	function setVariant(self, variant1: number?, variant2: number?): boolean
	function setWheelStates(self, frontLeft: number, rearLeft: number?, frontRight: number?, rearRight: number?): boolean
	function spawn(self, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?): boolean
	function toggleRespawn(self, respawn: boolean): boolean
end
declare Vehicle: Vehicle

declare class Ped extends Element
	ammoInClip: number
	armor: number
	contactElement: Element
	fightingStyle: number
	gravity: number
	vehicle: Vehicle
	vehicleSeat: number
	walkingStyle: number
	weaponSlot: number
	choking: boolean
	dead: boolean
	doingGangDriveby: boolean
	ducked: boolean
	inVehicle: boolean
	onFire: boolean
	onGround: boolean
	jetpack: boolean

	function addClothes(self, clothesTexture: string, clothesModel: string, clothesType: number): boolean
	function getAmmoInClip(self, weaponSlot: number?): number
	function getArmor(self): number
	function getClothes(self, clothesType: number): (string, string)
	function getContactElement(self): Element
	function getFightingStyle(self): number
	function getGravity(self): number
	function getOccupiedVehicle(self): Vehicle
	function getOccupiedVehicleSeat(self): number
	function getStat(self, stat: number): number
	function getTarget(self): Element
	function getTotalAmmo(self, weaponSlot: number?): number
	function getWalkingStyle(self): number
	function getWeapon(self, weaponSlot: number?): number
	function getWeaponSlot(self): number
	function isChoking(self): boolean
	function isDead(self): boolean
	function isDoingGangDriveby(self): boolean
	function isDucked(self): boolean
	function isInVehicle(self): boolean
	function isOnFire(self): boolean
	function isOnGround(self): boolean
	function isWearingJetpack(self): boolean
	function kill(self, theKiller: Ped?, weapon: number?, bodyPart: number?, stealth: boolean?): boolean
	function reloadWeapon(self): boolean
	function removeClothes(self, clothesType: number, clothesTexture: string?, clothesModel: string?): boolean
	function removeFromVehicle(self): boolean
	function setAnimation(self, block: string?, anim: string?, time: number?, loop: boolean?, updatePosition: boolean?, interruptable: boolean?, freezeLastFrame: boolean?, blendTime: number?, retainPedState: boolean?): boolean
	function setAnimationProgress(self, anim: string?, progress: number?): boolean
	function setAnimationSpeed(self, anim: string?, speed: number?): boolean
	function setArmor(self, armor: number): boolean
	function setChoking(self, choking: boolean): boolean
	function setGravity(self, gravity: number): boolean
	function setHeadless(self, headState: boolean): boolean
	function setOnFire(self, isOnFire: boolean): boolean
	function setWalkingStyle(self, style: number): boolean
	function setWeaponSlot(self, weaponSlot: number): boolean
	function setWearingJetpack(self, state: boolean): boolean
	function warpIntoVehicle(self, vehicle: Vehicle, seat: number?): boolean
end

declare class Object extends Element
end

declare class Pickup extends Element
end

declare class Marker extends Element
	icon: string
	size: number
	target: Vector3
	markerType: string

	function getColor(self): (number, number, number, number)
	function getIcon(self): string
	function getSize(self): number
	function getTarget(self): (number, number, number)
	function getMarkerType(self): string
	function setColor(self, r: number, g: number, b: number, a: number): boolean
	function setIcon(self, icon: string): boolean
	function setSize(self, size: number): boolean
	function setTarget(self, x: number, y: number, z: number): boolean
	function setMarkerType(self, markerType: string): boolean
end

declare class Blip extends Element
	icon: number
	ordering: number
	size: number
	visibleDistance: number

	__call: (x: number, y: number, z: number, icon: number?, size: number?, r: number?, g: number?, b: number?, ordering: number?, visibleDistance: number?) -> Blip
	__call: (x: number, y: number, z: number, icon: number?, size: number?, r: number?, g: number?, b: number?, ordering: number?, visibleDistance: number?, visibleTo: Element?) -> Blip

	createAttachedTo: (elementToAttachTo: Element, icon: number?, size: number?, r: number?, g: number?, b: number?, ordering: number?, visibleDistance: number?) -> Blip
	createAttachedTo: (elementToAttachTo: Element, icon: number?, size: number?, r: number?, g: number?, b: number?, ordering: number?, visibleDistance: number?, visibleTo: Element?) -> Blip

	function getColor(self): (number, number, number, number)
	function getIcon(self): number
	function getOrdering(self): number
	function getSize(self): number
	function getVisibleDistance(self): number
	function setColor(self, r: number, g: number, b: number, a: number): boolean
	function setIcon(self, icon: number): boolean
	function setOrdering(self, ordering: number): boolean
	function setSize(self, iconSize: number): boolean
	function etVisibleDistance(self, theDistance: number): boolean
end
declare Blip: Blip

declare class RadarArea extends Element
	flashing: number

	__call: (x: number, y: number, width: number, height: number, r: number?, g: number?, b: number?, a: number?, visibleTo: Element?) -> RadarArea

	function getColor(self): (number, number, number, number)
	function getSize(self): (number, number)
	function isInside(self, x: number, y: number): boolean
	function isFlashing(self): boolean
	function setColor(self, r: number, g: number, b: number, a: number): boolean
	function setFlashing(self, flash: boolean): boolean
	function setSize(self, x: number, y: number)
end
declare RadarArea: RadarArea

declare class Projectile extends Element
	counter: number
	creator: Element
	force: number
	target: Element
	type: number

	__call: (creator: Element, weaponType: number, x: number?, y: number?, z: number?, force: number?, target: Element?, rotX: number?, rotY: number?, rotZ: number?, velX: number?, velY: number?, velZ: number?, model: number?) -> Projectile

	function getCounter(self): number
	function getCreator(self): Element
	function getForce(self): number
	function getTarget(self): Element
	function getType(self): number
	function setCounter(self, timeToDetonate: number)
end
declare Projectile: Projectile

declare class Button extends Element
end

declare class Checkbox extends Element
end

declare class Combobox extends Element
end

declare class Edit extends Element
end

declare class Gridlist extends Element
end

declare class Memo extends Element
end

declare class ProgressBar extends Element
end

declare class RadioButton extends Element
end

declare class Scrollbar extends Element
end

declare class Scrollpane extends Element
end

declare class Image extends Element
end

declare class TabPanel extends Element
end

declare class Tab extends Element
end

declare class Label extends Element
end

declare class Window extends Element
end

declare class TXD extends Element
end

declare class EngineTXD extends Element
	__call: (txd_file: string, filteringEnabled: boolean? ) -> TXD
	__call: (raw_data: string, filteringEnabled: boolean? ) -> TXD

	function import(self, model_id: number): boolean
end
declare EngineTXD: EngineTXD

declare class Engine extends Element
	getModelIDFromName: (modelName: string) -> number
	getModelLODDistance: (modelID: number) -> number
	getModelNameFromID: (modelID: number) -> string
	getModelTextureNames: (modelNameOrID: string) -> { [number]: string }
	getVisibleTextureNames: (nameFilter: string?, modelId: string?) -> { [number]: string }
	resetModelLODDistance: (modelID: number) -> boolean
	restoreCOL: (modelID: number) -> boolean
	restoreModel: (modelID: number) -> boolean
	setAsynchronousLoading: (enable: boolean, force: boolean) -> boolean
	setModelLODDistance: (modelID: number, distance: number) -> boolean
end
declare Engine: Engine

declare class DFF extends Element
	function replace(self, modelID: number, alphaTransparency: boolean?): boolean
end

declare class EngineDFF extends Element
	__call: (dff_file: string) -> DFF
	__call: (raw_data: string) -> DFF
end
declare EngineDFF: EngineDFF

declare class COL extends Element
	function replace(self, modelID: number): boolean
end

declare class EngineCOL extends Element
	__call: (col_file: string) -> COL
	__call: (raw_data: string) -> COL
end
declare EngineCOL: EngineCOL

declare class Sound extends Element
end

declare class Material extends Element
end

declare class Texture extends Material
end

declare class Shader extends Material
	function applyToWorldTexture(self, shader: Element, textureName: string, targetElement: Element?, appendLayers: boolean?): boolean
	function removeFromWorldTexture(self, textureName: string, targetElement: Element?): boolean
end

declare class DXFont extends Element
end

declare class GUIFont extends Element
end

declare class Weapon extends Element
end

declare class Camera extends Element
end

declare class Effect extends Element
end

declare class Browser extends Element
end

declare class Light extends Element
end

declare class Searchlight extends Element
end

declare class Water extends Element
end

declare class Resource
end

declare class TextDisplay
end

declare class TextItem
end

declare class Timer
end

declare class XMLNode
end

declare class Connection
end

declare abortRemoteRequest: (theRequest: any) -> boolean
declare aclCreate: (aclName: string) -> ACL
declare aclCreateGroup: (groupName: string) -> ACLGroup
declare aclDestroy: (theACL: ACL) -> boolean
declare aclDestroyGroup: (aclGroup: ACLGroup) -> boolean
declare aclGet: (aclName: string) -> ACL
declare aclGetGroup: (groupName: string) -> ACLGroup
declare aclGetName: (theAcl: ACL) -> string
declare aclGetRight: (theAcl: ACL, rightName: string) -> boolean
declare aclGroupAddACL: (theGroup: ACLGroup, theACL: ACL) -> boolean
declare aclGroupAddObject: (theGroup: ACLGroup, theObjectName: string) -> boolean
declare aclGroupGetName: (aclGroup: ACLGroup) -> string
declare aclGroupList: () -> any
declare aclGroupListACL: (theGroup: ACLGroup) -> any
declare aclGroupListObjects: (theGroup: ACLGroup) -> any
declare aclGroupRemoveACL: (theGroup: ACLGroup, theACL: ACL) -> boolean
declare aclGroupRemoveObject: (theGroup: ACLGroup, theObjectString: string) -> boolean
declare aclList: () -> any
declare aclListRights: (theACL: ACL, allowedType: string) -> any
declare aclReload: () -> boolean
declare aclRemoveRight: (theAcl: ACL, rightName: string) -> boolean
declare aclSave: () -> boolean
declare aclSetRight: (theAcl: ACL, rightName: string, hasAccess: boolean) -> boolean
declare addAccount: (name: string, pass: string, allowCaseVariations: boolean?) -> Account
declare addBan: (IP: string?, Username: string?, Serial: string?, responsibleElement: Player?, reason: string?, seconds: number?) -> Ban
declare addColPolygonPoint: (shape: ColShape, fX: number, fY: number, index: number?) -> boolean
declare addCommandHandler: (commandName: string, handlerFunction: any, restricted: boolean?, caseSensitive: boolean?) -> boolean
declare addDebugHook: (hookType: string, callbackFunction: any, nameList: any?) -> boolean
declare addElementDataSubscriber: (theElement: Element, key: string, thePlayer: Player) -> boolean
declare addEvent: (eventName: string, allowRemoteTrigger: boolean?) -> boolean
declare addEventHandler: (eventName: string, attachedTo: Element, handlerFunction: any, propagate: boolean?, priority: string?) -> boolean
declare addPedClothes: (thePed: Ped, clothesTexture: string, clothesModel: string, clothesType: number) -> boolean
declare addResourceConfig: (filePath: string, filetype: string?) -> XMLNode
declare addResourceMap: (filePath: string, dimension: number?) -> XMLNode
declare addVehicleSirens: (theVehicle: Vehicle, sirenCount: number, sirenType: number, flag360: boolean?, checkLosFlag: boolean?, useRandomiser: boolean?, silentFlag: boolean?) -> boolean
declare areTrafficLightsLocked: () -> boolean
declare areVehicleLightsOn: (theVehicle: Vehicle) -> boolean
declare attachElements: (theElement: Element, theAttachToElement: Element, xPosOffset: number?, yPosOffset: number?, zPosOffset: number?, xRotOffset: number?, yRotOffset: number?, zRotOffset: number?) -> boolean
declare attachTrailerToVehicle: (theVehicle: Vehicle, theTrailer: Vehicle) -> boolean
declare base64Decode: (data: string) -> string
declare base64Encode: (data: string) -> string
declare bindKey: (thePlayer: Player, key: string, keyState: string, handlerFunction: any, arguments: any?, ...any?) -> boolean
declare bitAnd: (var1: number, var2: number, ...any) -> number
declare bitArShift: (value: number, n: number) -> number
declare bitExtract: (var: number, field: number, width: number?) -> number
declare bitLRotate: (value: number, n: number) -> number
declare bitLShift: (value: number, n: number) -> number
declare bitNot: (var: number) -> number
declare bitOr: (var1: number, var2: number, ...any) -> number
declare bitRRotate: (value: number, n: number) -> number
declare bitRShift: (value: number, n: number) -> number
declare bitReplace: (var: number, replaceValue: number, field: number, width: number?) -> number
declare bitTest: (var1: number, var2: number, ...any) -> boolean
declare bitXor: (var1: number, var2: number, ...any) -> number
declare breakObject: (theObject: Object) -> boolean
declare canBrowserNavigateBack: (webBrowser: Browser) -> boolean
declare canBrowserNavigateForward: (webBrowser: Browser) -> boolean
declare canPedBeKnockedOffBike: (thePed: Ped) -> boolean
declare cancelEvent: (cancel: boolean?, reason: string?) -> boolean
declare cancelLatentEvent: (thePlayer: Player, handle: number) -> boolean
declare clearChatBox: () -> boolean
declare clearDebugBox: () -> boolean
declare clearElementVisibleTo: (theElement: Element) -> boolean
declare cloneElement: (theElement: Element, xPos: number?, yPos: number?, zPos: number?, cloneChildren: boolean?) -> Element
declare copyAccountData: (theAccount: Account, fromAccount: Account) -> boolean
declare copyResource: (theResource: Resource, newResourceName: string, organizationalDir: string?) -> Resource
declare countPlayersInTeam: (theTeam: Team) -> number
declare createBlip: (x: number, y: number, z: number, icon: number?, size: number?, r: number?, g: number?, b: number?, a: number?, ordering: number?, visibleDistance: number?, visibleTo: Element?) -> Blip
declare createBlipAttachedTo: (elementToAttachTo: Element, icon: number?, size: number?, r: number?, g: number?, b: number?, a: number?, ordering: number?, visibleDistance: number?, visibleTo: Element?) -> Blip
declare createBrowser: (width: number, height: number, isLocal: boolean, transparent: boolean?) -> Element
declare createColCircle: (fX: number, fY: number, radius: number) -> ColShape
declare createColCuboid: (fX: number, fY: number, fZ: number, fWidth: number, fDepth: number, fHeight: number) -> ColShape
declare createColPolygon: (fCenterX: number, fCenterY: number, fX1: number, fY1: number, fX2: number, fY2: number, fX3: number, fY3: number, ...any) -> ColShape
declare createColRectangle: (fX: number, fY: number, fWidth: number, fHeight: number) -> ColShape
declare createColSphere: (fX: number, fY: number, fZ: number, fRadius: number) -> ColShape
declare createColTube: (fX: number, fY: number, fZ: number, fRadius: number, fHeight: number) -> ColShape
declare createEffect: (name: string, x: number, y: number, z: number, rX: number?, rY: number?, rZ: number?, drawDistance: number?, soundEnable: boolean?) -> Effect
declare createElement: (elementType: string, elementID: string?) -> Element
declare createExplosion: (x: number, y: number, z: number, theType: number, creator: Player?) -> boolean
declare createFire: (x: number, y: number, z: number, size: number?) -> boolean
declare createLight: (lightType: number, posX: number, posY: number, posZ: number, radius: number?, r: number?, g: number?, b: number?, dirX: number?, dirY: number?, dirZ: number?, createsShadow: boolean?) -> Light
declare createMarker: (x: number, y: number, z: number, theType: string?, size: number?, r: number?, g: number?, b: number?, a: number?, visibleTo: Element?) -> Marker
declare createObject: (modelId: number, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?, isLowLOD: boolean?) -> Object
declare createPed: (modelid: number, x: number, y: number, z: number, rot: number?, synced: boolean?) -> Ped
declare createProjectile: (creator: Element, weaponType: number, posX: number?, posY: number?, posZ: number?, force: number?, target: Element?, rotX: number?, rotY: number?, rotZ: number?, velX: number?, velY: number?, velZ: number?, model: number?) -> Projectile
declare createRadarArea: (startPosX: number, startPosY: number, sizeX: number, sizeY: number, r: number?, g: number?, b: number?, a: number?, visibleTo: Element?) -> RadarArea
declare createResource: (resourceName: string, organizationalDir: string?) -> Resource
declare createSWATRope: (fx: number, fy: number, fZ: number, duration: number) -> boolean
declare createSearchLight: (startX: number, startY: number, startZ: number, endX: number, endY: number, endZ: number, startRadius: number, endRadius: number, renderSpot: boolean?) -> Searchlight
declare createTeam: (teamName: string, colorR: number?, colorG: number?, colorB: number?) -> Team
declare createTrayNotification: (notificationText: string, iconType: string?, useSound: boolean?) -> boolean
declare createVehicle: (model: number, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?, numberplate: string?, bDirection: boolean?, variant1: number?, variant2: number?) -> Vehicle
declare createWeapon: (theType: string, x: number, y: number, z: number) -> Weapon
declare dbConnect: (databaseType: string, host: string, username: string?, password: string?, options: string?) -> Element
declare dbFree: (queryHandle: any) -> boolean
declare dbPoll: (queryHandle: any, timeout: number, multipleResults: boolean?) -> any
declare debugSleep: (sleep: number) -> boolean
declare decodeString: (algorithm: string, input: string, options: any, callback: any?) -> string
declare deleteResource: (resourceName: string) -> boolean
declare deref: (reference: number) -> any
declare destroyElement: (elementToDestroy: Element) -> boolean
declare detachElements: (theElement: Element, theAttachToElement: Element?) -> boolean
declare detachTrailerFromVehicle: (theVehicle: Vehicle, theTrailer: Vehicle?) -> boolean
declare detonateSatchels: () -> boolean
declare doesPedHaveJetPack: (thePed: Ped) -> boolean
declare downloadFile: (fileName: string) -> boolean
declare dxConvertPixels: (pixels: string, newFormat: string, quality: number?) -> string
declare dxCreateRenderTarget: (width: number, height: number, withAlpha: boolean?) -> Element
declare dxCreateScreenSource: (width: number, height: number) -> Element
declare dxDrawCircle: (posX: number, posY: number, radius: number, startAngle: number?, stopAngle: number?, theColor: number?, theCenterColor: number?, segments: number?, ratio: number?, postGUI: boolean?) -> boolean
declare dxDrawImageSection: (posX: number, posY: number, width: number, height: number, u: number, v: number, usize: number, vsize: number, image: any, rotation: number?, rotationCenterOffsetX: number?, rotationCenterOffsetY: number?, color: number?, postGUI: boolean?) -> boolean
declare dxDrawLine: (startX: number, startY: number, endX: number, endY: number, color: number, width: number?, postGUI: boolean?) -> boolean
declare dxDrawLine3D: (startX: number, startY: number, startZ: number, endX: number, endY: number, endZ: number, color: number?, width: number?, postGUI: boolean?) -> boolean
declare dxDrawMaterialPrimitive: (pType: any, material: any, postGUI: boolean, vertice1: any, vertice2: any?, ...any?) -> boolean
declare dxDrawMaterialPrimitive3D: (pType: any, material: any, postGUI: boolean, vertice1: any, vertice2: any?, ...any?) -> boolean
declare dxDrawPrimitive: (pType: string, postGUI: boolean, vertice1: any, vertice2: any?, ...any?) -> boolean
declare dxDrawPrimitive3D: (primitiveType: string, postGUI: boolean, vertex1: any, vertex2: any, vertex3: any, vertex4: any?, ...any?) -> boolean
declare dxDrawRectangle: (startX: number, startY: number, width: number, height: number, color: number?, postGUI: boolean?, subPixelPositioning: boolean?) -> boolean
declare dxDrawWiredSphere: (x: number, y: number, z: number, radius: number, theColor: number, fLineWidth: number, iterations: number) -> boolean
declare dxGetBlendMode: () -> string
declare dxGetPixelColor: (pixels: string, x: number, y: number) -> (number, number, number, number)
declare dxGetPixelsFormat: (pixels: string) -> string
declare dxGetPixelsSize: (pixels: string) -> (number, number)
declare dxGetStatus: () -> any
declare dxIsAspectRatioAdjustmentEnabled: () -> (boolean, number)
declare dxSetBlendMode: (blendMode: string) -> boolean
declare dxSetPixelColor: (pixels: string, x: number, y: number, r: number, g: number, b: number, a: number?) -> boolean
declare dxSetRenderTarget: (renderTarget: Element?, clear: boolean?) -> boolean
declare dxSetShaderTessellation: (theShader: Element, tessellationX: number, tessellationY: number) -> boolean
declare dxSetShaderTransform: (theShader: Element, rotationX: number, rotationY: number, rotationZ: number, rotationCenterOffsetX: number?, rotationCenterOffsetY: number?, rotationCenterOffsetZ: number?, bRotationCenterOffsetOriginIsScreen: boolean?, perspectiveCenterOffsetX: number?, perspectiveCenterOffsetY: number?, bPerspectiveCenterOffsetOriginIsScreen: boolean?) -> boolean
declare dxSetShaderValue: (theShader: Element, parameterName: string, value: any) -> boolean
declare dxSetTestMode: (testMode: string) -> boolean
declare dxSetTextureEdge: (theTexture: Texture, textureEdge: string, border_color: number?) -> boolean
declare dxUpdateScreenSource: (screenSource: Element, resampleNow: boolean?) -> boolean
declare encodeString: (algorithm: string, input: string, options: any, callback: any?) -> string
declare engineApplyShaderToWorldTexture: (shader: Element, textureName: string, targetElement: Element?, appendLayers: boolean?) -> boolean
declare engineFreeModel: (modelID: number) -> boolean
declare engineGetModelIDFromName: (modelName: string) -> number
declare engineGetModelLODDistance: (model: number) -> number
declare engineGetModelNameFromID: (modelID: number) -> string
declare engineGetModelPhysicalPropertiesGroup: (modelID: number) -> number
declare engineGetModelTextureNames: (modelId: string?) -> any
declare engineGetModelVisibleTime: (modelId: number) -> (number, number)
declare engineGetObjectGroupPhysicalProperty: (groupID: number, property: any) -> any
declare engineGetSurfaceProperties: (surfaceID: number, property: string) -> any
declare engineGetVisibleTextureNames: (nameFilter: string?, modelId: string?) -> any
declare engineImportTXD: (texture: TXD, model_id: number) -> boolean
declare engineRemoveShaderFromWorldTexture: (shader: Element, textureName: string, targetElement: Element?) -> boolean
declare engineReplaceAnimation: (thePed: Ped, InternalBlockName: string, InternalAnimName: string, CustomBlockName: string, CustomAnimName: string) -> boolean
declare engineReplaceCOL: (theCol: COL, modelID: number) -> boolean
declare engineReplaceModel: (theModel: DFF, modelID: number, alphaTransparency: boolean?) -> boolean
declare engineRequestModel: (elementType: string, parentID: number?) -> number
declare engineResetModelLODDistance: (model: number) -> boolean
declare engineResetSurfaceProperties: (surfaceID: number?) -> any
declare engineRestoreAnimation: (thePed: Ped, InternalBlockName: string?, InternalAnimName: string?) -> boolean
declare engineRestoreCOL: (modelID: number) -> boolean
declare engineRestoreModel: (modelID: number) -> boolean
declare engineRestoreModelPhysicalPropertiesGroup: (modelID: number) -> boolean
declare engineRestoreObjectGroupPhysicalProperties: (groupID: number, property: any) -> boolean
declare engineRestreamWorld: () -> boolean
declare engineSetAsynchronousLoading: (enable: boolean, force: boolean) -> boolean
declare engineSetModelLODDistance: (model: number, distance: number) -> boolean
declare engineSetModelPhysicalPropertiesGroup: (modelID: number, groupID: number) -> boolean
declare engineSetModelVisibleTime: (modelID: number, timeOn: number, timeOff: number) -> boolean
declare engineSetObjectGroupPhysicalProperty: (groupID: number, property: any, newValue: any) -> boolean
declare engineSetSurfaceProperties: (surfaceID: number, property: string, value: any) -> boolean
declare engineStreamingFreeUpMemory: (bytes: number) -> boolean
declare engineStreamingGetUsedMemory: () -> number
declare executeBrowserJavascript: (webBrowser: Browser, jsCode: string) -> boolean
declare executeCommandHandler: (commandName: string, thePlayer: Player, args: string?) -> boolean
declare fadeCamera: (thePlayer: Player, fadeIn: boolean, timeToFade: number?, red: number?, green: number?, blue: number?) -> boolean
declare fileClose: (theFile: any) -> boolean
declare fileCopy: (filePath: string, copyToFilePath: string, overwrite: boolean?) -> boolean
declare fileCreate: (filePath: string) -> any
declare fileDelete: (filePath: string) -> boolean
declare fileExists: (filePath: string) -> boolean
declare fileFlush: (theFile: any) -> boolean
declare fileGetPath: (theFile: any) -> string
declare fileGetPos: (theFile: any) -> number
declare fileGetSize: (theFile: any) -> number
declare fileIsEOF: (theFile: any) -> boolean
declare fileOpen: (filePath: string, readOnly: boolean?) -> any
declare fileRead: (theFile: any, count: number) -> string
declare fileRename: (filePath: string, newFilePath: string) -> boolean
declare fileSetPos: (theFile: any, offset: number) -> number
declare fileWrite: (theFile: any, string1: string, string2: string?, string3: string?) -> number
declare fireWeapon: (theWeapon: Weapon) -> boolean
declare fixVehicle: (theVehicle: Vehicle) -> boolean
declare focusBrowser: (webBrowser: Browser) -> boolean
declare forcePlayerMap: (thePlayer: Player, forceOn: boolean) -> boolean
declare fromJSON: (json: string) -> any
declare fxAddBlood: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number, count: number?, brightness: number?) -> boolean
declare fxAddBulletImpact: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number, smokeSize: number?, sparkCount: number?, smokeIntensity: number?) -> boolean
declare fxAddBulletSplash: (posX: number, posY: number, posZ: number) -> boolean
declare fxAddDebris: (posX: number, posY: number, posZ: number, colorR: number?, colorG: number?, colorB: number?, colorA: number?, scale: number?, count: number?) -> boolean
declare fxAddFootSplash: (posX: number, posY: number, posZ: number) -> boolean
declare fxAddGlass: (posX: number, posY: number, posZ: number, colorR: number?, colorG: number?, colorB: number?, colorA: number?, scale: number?, count: number?) -> boolean
declare fxAddGunshot: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number, includeSparks: boolean?) -> boolean
declare fxAddPunchImpact: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number) -> boolean
declare fxAddSparks: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number, force: number?, count: number?, acrossLineX: number?, acrossLineY: number?, acrossLineZ: number?, blur: boolean?, spread: number?, life: number?) -> boolean
declare fxAddTankFire: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number) -> boolean
declare fxAddTyreBurst: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number) -> boolean
declare fxAddWaterHydrant: (posX: number, posY: number, posZ: number) -> boolean
declare fxAddWaterSplash: (posX: number, posY: number, posZ: number) -> boolean
declare fxAddWood: (posX: number, posY: number, posZ: number, dirX: number, dirY: number, dirZ: number, count: number?, brightness: number?) -> boolean
declare generateKeyPair: (algorithm: string, options: any, callback: any?) -> (string, string)
declare get: (settingName: string) -> any
declare getAccount: (username: string, password: string?, caseSensitive: boolean?) -> Account
declare getAccountByID: (id: number) -> Account
declare getAccountData: (theAccount: Account, key: string) -> string
declare getAccountID: (theAccount: Account) -> number
declare getAccountIP: (theAccount: Account) -> string
declare getAccountName: (theAccount: Account) -> string
declare getAccountPlayer: (theAccount: Account) -> Player
declare getAccountSerial: (theAccount: Account) -> string
declare getAccounts: () -> any
declare getAccountsByData: (dataName: string, value: string) -> any
declare getAccountsByIP: (ip: string) -> any
declare getAccountsBySerial: (serial: string) -> any
declare getAircraftMaxHeight: () -> number
declare getAircraftMaxVelocity: () -> number
declare getAlivePlayers: () -> any
declare getAllAccountData: (theAccount: Account) -> any
declare getAllElementData: (theElement: Element) -> any
declare getAnalogControlState: (control: string, rawValue: boolean?) -> number
declare getAttachedElements: (theElement: Element) -> any
declare getBanAdmin: (theBan: Ban) -> string
declare getBanIP: (theBan: Ban) -> string
declare getBanNick: (theBan: Ban) -> string
declare getBanReason: (theBan: Ban) -> string
declare getBanSerial: (theBan: Ban) -> string
declare getBanTime: (theBan: Ban) -> number
declare getBanUsername: (theBan: Ban) -> string
declare getBans: () -> any
declare getBirdsEnabled: () -> boolean
declare getBlipColor: (theBlip: Blip) -> (number, number, number, number)
declare getBlipIcon: (theBlip: Blip) -> number
declare getBlipOrdering: (theBlip: Blip) -> number
declare getBlipSize: (theBlip: Blip) -> number
declare getBlipVisibleDistance: (theBlip: Blip) -> number
declare getBodyPartName: (bodyPartID: number) -> string
declare getBrowserProperty: (theBrowser: Browser, key: string) -> boolean
declare getBrowserSettings: () -> any
declare getBrowserSource: (webBrowser: Browser, callback: any) -> boolean
declare getBrowserTitle: (webBrowser: Browser) -> string
declare getBrowserURL: (webBrowser: Browser) -> string
declare getCamera: () -> Element
declare getCameraClip: () -> (boolean, boolean)
declare getCameraFieldOfView: (cameraMode: string) -> number
declare getCameraGoggleEffect: () -> string
declare getCameraInterior: (thePlayer: Player) -> number
declare getCameraInterior: () -> number
declare getCameraMatrix: (thePlayer: Player) -> (number, number, number, number, number, number, number, number)
declare getCameraShakeLevel: () -> number
declare getCameraTarget: (thePlayer: Player) -> Element
declare getCameraViewMode: () -> (number, number)
declare getCancelReason: () -> string
declare getChatboxLayout: (CVar: string?) -> any
declare getClothesByTypeIndex: (clothesType: number, clothesIndex: number) -> (string, string)
declare getClothesTypeName: (clothesType: number) -> string
declare getCloudsEnabled: () -> boolean
declare getColPolygonHeight: (shape: ColShape) -> (number, number)
declare getColPolygonPointPosition: (shape: ColShape, index: number) -> (number, number)
declare getColPolygonPoints: (shape: ColShape) -> any
declare getColShapeRadius: (shape: ColShape) -> number
declare getColShapeSize: (shape: ColShape) -> (number, number, number)
declare getColShapeType: (shape: ColShape) -> number
declare getColorFromString: (theColor: string) -> (number, number, number, number)
declare getCommandHandlers: (theResource: Resource?) -> any
declare getCommandsBoundToKey: (theKey: string, keyState: string) -> any
declare getControlState: (thePlayer: Player, controlName: string) -> boolean
declare getCoronaReflectionsEnabled: () -> number
declare getCursorAlpha: () -> number
declare getCursorPosition: () -> (number, number, number, number, number)
declare getDeadPlayers: () -> any
declare getDevelopmentMode: () -> boolean
declare getDistanceBetweenPoints2D: (x1: number, y1: number, x2: number, y2: number) -> number
declare getDistanceBetweenPoints3D: (x1: number, y1: number, z1: number, x2: number, y2: number, z2: number) -> number
declare getEasingValue: (fProgress: number, strEasingType: string, fEasingPeriod: number?, fEasingAmplitude: number?, fEasingOvershoot: number?) -> number
declare getEffectDensity: (theEffect: Effect) -> number
declare getEffectSpeed: (theEffect: Effect) -> number
declare getElementAlpha: (theElement: Element) -> number
declare getElementAngularVelocity: (theElement: Element) -> (number, number, number)
declare getElementAttachedOffsets: (theElement: Element) -> (number, number, number, number, number, number)
declare getElementAttachedTo: (theElement: Element) -> Element
declare getElementBoneMatrix: (theElement: Element, boneId: number) -> any
declare getElementBonePosition: (theElement: Element, boneId: number) -> (number, number, number)
declare getElementBoneRotation: (theElement: Element, boneId: number) -> (number, number, number)
declare getElementBoundingBox: (theElement: Element) -> (number, number, number, number, number, number)
declare getElementByID: (id: string, index: number?) -> Element
declare getElementByIndex: (theType: string, index: number) -> Element
declare getElementChild: (parent: Element, index: number) -> Element
declare getElementChildren: (parent: Element, theType: string?) -> any
declare getElementChildrenCount: (parent: Element) -> number
declare getElementColShape: (theElement: Element) -> ColShape
declare getElementCollisionsEnabled: (theElement: Element) -> boolean
declare getElementData: (theElement: Element, key: string, inherit: boolean?) -> any
declare getElementDimension: (theElement: Element) -> number
declare getElementDistanceFromCentreOfMassToBaseOfModel: (theElement: Element) -> number
declare getElementHealth: (theElement: Element) -> number
declare getElementID: (theElement: Element) -> string
declare getElementInterior: (theElement: Element) -> number
declare getElementLighting: (theElement: Element) -> number
declare getElementMatrix: (theElement: Element, legacy: boolean?) -> any
declare getElementModel: (theElement: Element) -> number
declare getElementParent: (theElement: Element) -> Element
declare getElementPosition: (theElement: Element) -> (number, number, number)
declare getElementRadius: (theElement: Element) -> number
declare getElementRotation: (theElement: Element, rotOrder: string?) -> (number, number, number)
declare getElementSyncer: (theElement: Element) -> Element
declare getElementType: (theElement: Element) -> string
declare getElementVelocity: (theElement: Element) -> (number, number, number)
declare getElementsWithinColShape: (theShape: ColShape, elemType: string?) -> any
declare getElementsWithinRange: (x: number, y: number, z: number, range: number, elemType: string?, interior: number?, dimension: number?) -> any
declare getEventHandlers: (eventName: string, attachedTo: Element) -> any
declare getFPSLimit: () -> number
declare getFarClipDistance: () -> number
declare getFogDistance: () -> number
declare getFunctionsBoundToKey: (thePlayer: Player, key: string, keyState: string) -> any
declare getGameSpeed: () -> number
declare getGameType: () -> string
declare getGarageBoundingBox: (garageID: number) -> (number, number, number, number)
declare getGaragePosition: (garageID: number) -> (number, number, number)
declare getGarageSize: (garageID: number) -> (number, number, number)
declare getGravity: () -> number
declare getGroundPosition: (x: number, y: number, z: number) -> number
declare getHeatHaze: () -> (number, number, number, number, number, number, number, number, boolean)
declare getHeliBladeCollisionsEnabled: (theVehicle: Vehicle) -> boolean
declare getHelicopterRotorSpeed: (heli: Vehicle) -> number
declare getInteriorFurnitureEnabled: (roomID: number) -> boolean
declare getInteriorSoundsEnabled: () -> boolean
declare getJetpackMaxHeight: () -> number
declare getJetpackWeaponEnabled: (weapon: string) -> boolean
declare getKeyBoundToCommand: (command: string) -> string
declare getKeyBoundToFunction: (thePlayer: Player, theFunction: any) -> string
declare getKeyState: (keyName: string) -> boolean
declare getKeyboardLayout: () -> any
declare getLatentEventHandles: (thePlayer: Player) -> any
declare getLatentEventStatus: (thePlayer: Player, handle: number) -> any
declare getLightColor: (theLight: Light) -> (number, number, number)
declare getLightDirection: (theLight: Light) -> (number, number, number)
declare getLightRadius: (theLight: Light) -> number
declare getLightType: (theLight: Light) -> number
declare getLoadedModules: () -> any
declare getLocalPlayer: () -> Player
declare getLocalization: () -> any
declare getLowLODElement: (theElement: Element) -> Element
declare getMapName: () -> string
declare getMarkerColor: (theMarker: Marker) -> (number, number, number, number)
declare getMarkerCount: () -> number
declare getMarkerIcon: (theMarker: Marker) -> string
declare getMarkerSize: (myMarker: Marker) -> number
declare getMarkerTarget: (theMarker: Marker) -> (number, number, number)
declare getMarkerType: (theMarker: Marker) -> string
declare getMaxPlayers: () -> number
declare getMinuteDuration: () -> number
declare getModelHandling: (modelId: number) -> any
declare getModuleInfo: (moduleName: string) -> any
declare getMoonSize: () -> number
declare getNearClipDistance: () -> number
declare getNetworkStats: () -> any
declare getNetworkUsageData: () -> any
declare getObjectMass: (theObject: Object) -> number
declare getObjectProperty: (theObject: Object, property: string) -> any
declare getObjectScale: (theObject: Object) -> (number, number, number)
declare getOcclusionsEnabled: () -> boolean
declare getOriginalHandling: (modelID: number) -> any
declare getPedAmmoInClip: (thePed: Ped, weaponSlot: number?) -> number
declare getPedAnalogControlState: (thePed: Ped, controlName: string, rawValue: boolean?) -> number
declare getPedAnimation: (thePed: Ped) -> (string, string)
declare getPedArmor: (thePed: Ped) -> number
declare getPedBonePosition: (thePed: Ped, bone: number) -> (number, number, number)
declare getPedCameraRotation: (thePed: Ped) -> number
declare getPedClothes: (thePed: Ped, clothesType: number) -> (string, string)
declare getPedContactElement: (thePed: Ped) -> Element
declare getPedControlState: (thePed: Ped, control: string) -> boolean
declare getPedFightingStyle: (thePed: Ped) -> number
declare getPedGravity: (thePed: Ped) -> number
declare getPedMoveState: (thePed: Ped) -> string
declare getPedOccupiedVehicle: (thePed: Ped) -> Vehicle
declare getPedOccupiedVehicleSeat: (thePed: Ped) -> number
declare getPedOxygenLevel: (thePed: Ped) -> number
declare getPedSimplestTask: (thePed: Ped) -> string
declare getPedStat: (thePed: Ped, stat: number) -> number
declare getPedTarget: (thePed: Ped) -> Element
declare getPedTargetCollision: (targetingPed: Ped) -> (number, number, number)
declare getPedTargetEnd: (targetingPed: Ped) -> (number, number, number)
declare getPedTargetStart: (targetingPed: Ped) -> (number, number, number)
declare getPedTask: (thePed: Ped, priority: string, taskType: number) -> (string, string, string, string)
declare getPedTotalAmmo: (thePed: Ped, weaponSlot: number?) -> number
declare getPedVoice: (thePed: Ped) -> (string, string)
declare getPedWalkingStyle: (thePed: Ped) -> number
declare getPedWeapon: (thePed: Ped, weaponSlot: number?) -> number
declare getPedWeaponMuzzlePosition: (thePed: Ped) -> (number, number, number)
declare getPedWeaponSlot: (thePed: Ped) -> number
declare getPedsLODDistance: () -> number
declare getPerformanceStats: (category: string, options: string?, filter: string?) -> (any, any)
declare getPickupAmmo: (thePickup: Pickup) -> number
declare getPickupAmount: (thePickup: Pickup) -> number
declare getPickupRespawnInterval: (thePickup: Pickup) -> number
declare getPickupType: (thePickup: Pickup) -> number
declare getPickupWeapon: (thePickup: Pickup) -> number
declare getPlayerACInfo: (thePlayer: Element) -> any
declare getPlayerAccount: (thePlayer: Player) -> Account
declare getPlayerAnnounceValue: (thePlayer: Element, key: string) -> string
declare getPlayerBlurLevel: (thePlayer: Player) -> number
declare getPlayerCount: () -> number
declare getPlayerFromName: (playerName: string) -> Player
declare getPlayerIP: (thePlayer: Player) -> string
declare getPlayerIdleTime: (thePlayer: Player) -> number
declare getPlayerMapBoundingBox: () -> (number, number, number, number)
declare getPlayerMapOpacity: () -> number
declare getPlayerMoney: (thePlayer: Player) -> number
declare getPlayerName: (thePlayer: Player) -> string
declare getPlayerNametagColor: (thePlayer: Player) -> (number, number, number)
declare getPlayerNametagText: (thePlayer: Player) -> string
declare getPlayerPing: (thePlayer: Player) -> number
declare getPlayerScriptDebugLevel: (thePlayer: Player) -> number
declare getPlayerSerial: (thePlayer: Player) -> string
declare getPlayerTeam: (thePlayer: Player) -> Team
declare getPlayerVersion: (thePlayer: Player) -> string
declare getPlayerWantedLevel: (thePlayer: Player) -> number
declare getPlayersInTeam: (theTeam: Team) -> any
declare getProcessMemoryStats: () -> any
declare getProjectileCounter: (projectile: Projectile) -> number
declare getProjectileCreator: (theProjectile: Projectile) -> Element
declare getProjectileForce: (theProjectile: Projectile) -> number
declare getProjectileTarget: (theProjectile: Projectile) -> Element
declare getProjectileType: (theProjectile: Projectile) -> number
declare getRadarAreaColor: (theRadararea: RadarArea) -> (number, number, number, number)
declare getRadarAreaSize: (theRadararea: RadarArea) -> (number, number)
declare getRadioChannel: () -> number
declare getRadioChannelName: (id: number) -> string
declare getRainLevel: () -> number
declare getRandomPlayer: () -> Player
declare getRealTime: (seconds: number?, localTime: boolean?) -> any
declare getRemoteRequests: (theResource: Resource?) -> any
declare getResourceACLRequests: (theResource: Resource) -> any
declare getResourceConfig: (filePath: string) -> XMLNode
declare getResourceDynamicElementRoot: (theResource: Resource) -> Element
declare getResourceExportedFunctions: (theResource: Resource?) -> any
declare getResourceFromName: (resourceName: string) -> Resource
declare getResourceGUIElement: (theResource: Resource?) -> Element
declare getResourceInfo: (theResource: Resource, attribute: string) -> string
declare getResourceLastStartTime: (theResource: Resource) -> number
declare getResourceLoadFailureReason: (theResource: Resource) -> string
declare getResourceLoadTime: (res: Resource) -> number
declare getResourceMapRootElement: (theResource: Resource, mapName: string) -> Element
declare getResourceName: (res: Resource) -> string
declare getResourceOrganizationalPath: (theResource: Resource) -> string
declare getResourceState: (theResource: Resource) -> string
declare getResources: () -> any
declare getRoofPosition: (x: number, y: number, z: number) -> number
declare getRootElement: () -> Element
declare getRuleValue: (key: string) -> string
declare getSFXStatus: (audioContainer: string) -> boolean
declare getScreenFromWorldPosition: (x: number, y: number, z: number, edgeTolerance: number?, relative: boolean?) -> (number, number, number)
declare getSearchLightEndPosition: (theSearchLight: Searchlight) -> (number, number, number)
declare getSearchLightEndRadius: (theSearchLight: Searchlight) -> number
declare getSearchLightStartPosition: (theSearchLight: Searchlight) -> (number, number, number)
declare getSearchLightStartRadius: (theSearchLight: Searchlight) -> number
declare getServerConfigSetting: (name: string) -> string
declare getServerHttpPort: () -> number
declare getServerName: () -> string
declare getServerPassword: () -> string
declare getServerPort: () -> number
declare getSkyGradient: () -> (number, number, number, number, number, number)
declare getSlotFromWeapon: (weaponid: number) -> number
declare getSoundBPM: (sound: Element) -> number
declare getSoundBufferLength: (theSound: Element) -> number
declare getSoundEffectParameters: (sound: Element, effectName: string) -> any
declare getSoundEffects: (sound: Element) -> any
declare getSoundFFTData: (sound: Element, iSamples: number, iBands: number?) -> any
declare getSoundLength: (theSound: Element) -> number
declare getSoundLevelData: (theSound: Element) -> (number, number)
declare getSoundMaxDistance: (sound: Element) -> number
declare getSoundMetaTags: (sound: Element, format: string?) -> any
declare getSoundMinDistance: (sound: Element) -> number
declare getSoundPan: (theSound: Element) -> number
declare getSoundPosition: (theSound: Element) -> number
declare getSoundProperties: (sound: Element) -> (number, number, number, boolean)
declare getSoundSpeed: (theSound: Element) -> number
declare getSoundVolume: (theSound: Element) -> number
declare getSoundWaveData: (sound: Element, iSamples: number) -> any
declare getSunColor: () -> (number, number, number, number, number, number)
declare getSunSize: () -> number
declare getTeamColor: (theTeam: Team) -> (number, number, number)
declare getTeamFriendlyFire: (theTeam: Team) -> boolean
declare getTeamFromName: (teamName: string) -> Team
declare getTeamName: (theTeam: Team) -> string
declare getThisResource: () -> Resource
declare getTickCount: () -> number
declare getTime: () -> (number, number)
declare getTimerDetails: (theTimer: Timer) -> (number, number, number)
declare getTimers: (theTime: number?) -> any
declare getTrafficLightState: () -> number
declare getTrainDirection: (train: Vehicle) -> boolean
declare getTrainPosition: (train: Vehicle) -> number
declare getTrainSpeed: (train: Vehicle) -> number
declare getTrainTrack: (train: Vehicle) -> number
declare getTypeIndexFromClothes: (clothesTexture: string, clothesModel: string) -> (number, number)
declare getUnbanTime: (theBan: Ban) -> number
declare getUserdataType: (value: any) -> string
declare getValidPedModels: () -> any
declare getVehicleAdjustableProperty: (theVehicle: Vehicle) -> number
declare getVehicleColor: (theVehicle: Vehicle, bRGB: boolean) -> (number, number, number, number, number, number, number, number, number, number, number, number)
declare getVehicleCompatibleUpgrades: (theVehicle: Vehicle, slot: number?) -> any
declare getVehicleComponentPosition: (theVehicle: Vehicle, theComponent: string, base: string?) -> (number, number, number)
declare getVehicleComponentRotation: (theVehicle: Vehicle, theComponent: string, base: string?) -> (number, number, number)
declare getVehicleComponentScale: (theVehicle: Vehicle, theComponent: string, base: string?) -> (number, number, number)
declare getVehicleComponentVisible: (theVehicle: Vehicle, theComponent: string) -> boolean
declare getVehicleComponents: (theVehicle: Vehicle) -> any
declare getVehicleController: (theVehicle: Vehicle) -> Player
declare getVehicleCurrentGear: (theVehicle: Vehicle) -> number
declare getVehicleDoorOpenRatio: (theVehicle: Vehicle, door: number) -> number
declare getVehicleDoorState: (theVehicle: Vehicle, door: number) -> number
declare getVehicleDummyPosition: (theVehicle: Vehicle, dummy: string) -> (number, number, number)
declare getVehicleEngineState: (theVehicle: Vehicle) -> boolean
declare getVehicleGravity: (theVehicle: Vehicle) -> (number, number, number)
declare getVehicleHandling: (theVehicle: Element) -> any
declare getVehicleHeadLightColor: (theVehicle: Vehicle) -> (number, number, number)
declare getVehicleLandingGearDown: (theVehicle: Vehicle) -> boolean
declare getVehicleLightState: (theVehicle: Vehicle, light: number) -> number
declare getVehicleModelDummyDefaultPosition: (modelId: number, dummy: string) -> (number, number, number)
declare getVehicleModelDummyPosition: (modelID: number, dummy: string) -> (number, number, number)
declare getVehicleModelExhaustFumesPosition: (modelID: number) -> (number, number, number)
declare getVehicleModelFromName: (name: string) -> number
declare getVehicleModelWheelSize: (vehicleModel: number, wheelGroup: string?) -> any
declare getVehicleName: (theVehicle: Vehicle) -> string
declare getVehicleNameFromModel: (model: number) -> string
declare getVehicleNitroCount: (theVehicle: Vehicle) -> number
declare getVehicleNitroLevel: (theVehicle: Vehicle) -> number
declare getVehicleOccupants: (theVehicle: Vehicle) -> any
declare getVehicleOverrideLights: (theVehicle: Vehicle) -> number
declare getVehiclePaintjob: (theVehicle: Vehicle) -> number
declare getVehiclePanelState: (theVehicle: Vehicle, panel: number) -> number
declare getVehiclePlateText: (theVehicle: Vehicle) -> string
declare getVehicleRespawnPosition: (theVehicle: Element) -> (number, number, number)
declare getVehicleRespawnRotation: (theVehicle: Element) -> (number, number, number)
declare getVehicleSirenParams: (theVehicle: Vehicle) -> any
declare getVehicleSirens: (theVehicle: Vehicle) -> any
declare getVehicleSirensOn: (theVehicle: Vehicle) -> boolean
declare getVehicleTowedByVehicle: (theVehicle: Vehicle) -> Vehicle
declare getVehicleTowingVehicle: (theVehicle: Vehicle) -> Vehicle
declare getVehicleTurnVelocity: (theVehicle: Vehicle) -> (number, number, number)
declare getVehicleTurretPosition: (turretVehicle: Vehicle) -> (number, number)
declare getVehicleType: (theVehicle: Vehicle) -> string
declare getVehicleUpgradeOnSlot: (theVehicle: Vehicle, slot: number) -> number
declare getVehicleUpgrades: (theVehicle: Vehicle) -> any
declare getVehicleVariant: (theVehicle: Vehicle) -> (number, number)
declare getVehicleWheelFrictionState: (theVehicle: Vehicle, wheel: number) -> number
declare getVehicleWheelScale: (theVehicle: Vehicle) -> number
declare getVehicleWheelStates: (theVehicle: Vehicle) -> (number, number, number, number)
declare getVehiclesLODDistance: () -> (number, number)
declare getVehiclesOfType: (model: number) -> any
declare getVersion: () -> any
declare getWaterColor: () -> (number, number, number, number)
declare getWaterLevel: (posX: number, posY: number, posZ: number?, ignoreDistanceToWaterThreshold: boolean?) -> number
declare getWaterVertexPosition: (theWater: Water, vertexIndex: number) -> (number, number, number)
declare getWaveHeight: () -> number
declare getWeaponAmmo: (theWeapon: Weapon) -> number
declare getWeaponClipAmmo: (theWeapon: Weapon) -> number
declare getWeaponFiringRate: (theWeapon: Weapon) -> number
declare getWeaponFlags: (theWeapon: Weapon, theFlag: string) -> boolean
declare getWeaponIDFromName: (name: string) -> number
declare getWeaponNameFromID: (id: number) -> string
declare getWeaponOwner: (theWeapon: Weapon) -> boolean
declare getWeaponState: (theWeapon: Weapon) -> string
declare getWeather: () -> (number, number)
declare getWindVelocity: () -> (number, number, number)
declare getWorldFromScreenPosition: (x: number, y: number, depth: number) -> (number, number, number)
declare givePlayerMoney: (thePlayer: Player, amount: number) -> boolean
declare guiBlur: (guiElement: Element) -> boolean
declare guiBringToFront: (guiElement: Element) -> boolean
declare guiCheckBoxGetSelected: (theCheckbox: Element) -> boolean
declare guiCheckBoxSetSelected: (theCheckbox: Element, state: boolean) -> boolean
declare guiComboBoxAddItem: (comboBox: Element, value: string) -> number
declare guiComboBoxClear: (comboBox: Element) -> boolean
declare guiComboBoxGetItemCount: (comboBox: Element) -> number
declare guiComboBoxGetItemText: (comboBox: Element, itemId: number) -> string
declare guiComboBoxGetSelected: (comboBox: Element) -> number
declare guiComboBoxIsOpen: (comboBox: Element) -> boolean
declare guiComboBoxRemoveItem: (comboBox: Element, itemId: number) -> boolean
declare guiComboBoxSetItemText: (comboBox: Element, itemId: number, text: string) -> boolean
declare guiComboBoxSetOpen: (comboBox: Element, state: boolean) -> boolean
declare guiComboBoxSetSelected: (comboBox: Element, itemIndex: number) -> boolean
declare guiCreateBrowser: (x: number, y: number, width: number, height: number, isLocal: boolean, isTransparent: boolean, isRelative: boolean?, parent: Element?) -> Browser
declare guiCreateButton: (x: number, y: number, width: number, height: number, text: string, relative: boolean, parent: Element?) -> Element
declare guiCreateCheckBox: (x: number, y: number, width: number, height: number, text: string, selected: boolean, relative: boolean, parent: Element?) -> Element
declare guiCreateComboBox: (x: number, y: number, width: number, height: number, caption: string, relative: boolean, parent: Element?) -> Element
declare guiCreateEdit: (x: number, y: number, width: number, height: number, text: string, relative: boolean, parent: Element?) -> Element
declare guiCreateGridList: (x: number, y: number, width: number, height: number, relative: boolean, parent: Element?) -> Element
declare guiCreateLabel: (x: number, y: number, width: number, height: number, text: string, relative: boolean, parent: Element?) -> Element
declare guiCreateMemo: (x: number, y: number, width: number, height: number, text: string, relative: boolean, parent: Element?) -> any
declare guiCreateProgressBar: (x: number, y: number, width: number, height: number, relative: boolean, parent: Element?) -> Element
declare guiCreateRadioButton: (x: number, y: number, width: number, height: number, text: string, relative: boolean, parent: Element?) -> Element
declare guiCreateScrollPane: (x: number, y: number, width: number, height: number, relative: boolean, parent: any?) -> Element
declare guiCreateStaticImage: (x: number, y: number, width: number, height: number, path: string, relative: boolean, parent: Element?) -> Element
declare guiCreateTab: (text: string, parent: Element) -> Element
declare guiCreateTabPanel: (x: number, y: number, width: number, height: number, relative: boolean, parent: Element?) -> Element
declare guiCreateWindow: (x: number, y: number, width: number, height: number, titleBarText: string, relative: boolean) -> Element
declare guiDeleteTab: (tabToDelete: Element, tabPanel: Element) -> boolean
declare guiEditGetCaretIndex: (theElement: Element) -> number
declare guiEditGetMaxLength: (guiEdit: any) -> number
declare guiEditIsMasked: (guiEdit: any) -> boolean
declare guiEditIsReadOnly: (guiEdit: any) -> boolean
declare guiEditSetCaretIndex: (theElement: Element, index: number) -> boolean
declare guiEditSetMasked: (theElement: Element, status: boolean) -> boolean
declare guiEditSetMaxLength: (guiEdit: Element, length: number) -> boolean
declare guiEditSetReadOnly: (editField: Element, status: boolean) -> boolean
declare guiFocus: (guiElement: Element) -> boolean
declare guiGetAlpha: (guiElement: Element) -> number
declare guiGetBrowser: (theBrowser: Browser) -> Browser
declare guiGetCursorType: () -> string
declare guiGetEnabled: (guiElement: Element) -> boolean
declare guiGetFont: (guiElement: Element) -> (string, Element)
declare guiGetInputEnabled: () -> boolean
declare guiGetInputMode: () -> string
declare guiGetPosition: (guiElement: Element, relative: boolean) -> (number, number)
declare guiGetProperties: (guiElement: Element) -> any
declare guiGetProperty: (guiElement: Element, property: string) -> string
declare guiGetScreenSize: () -> (number, number)
declare guiGetSelectedTab: (tabPanel: Element) -> Element
declare guiGetSize: (theElement: Element, relative: boolean) -> (number, number)
declare guiGetText: (guiElement: Element) -> string
declare guiGetVisible: (guiElement: Element) -> boolean
declare guiGridListAddColumn: (gridList: Element, title: string, width: number) -> number
declare guiGridListAutoSizeColumn: (gridList: Element, columnIndex: number) -> boolean
declare guiGridListClear: (gridList: Element) -> boolean
declare guiGridListGetColumnCount: (gridList: Element) -> number
declare guiGridListGetColumnTitle: (guiGridlist: Element, columnIndex: number) -> string
declare guiGridListGetColumnWidth: (gridList: Element, columnIndex: number, relative: boolean) -> number
declare guiGridListGetHorizontalScrollPosition: (guiGridlist: Element) -> number
declare guiGridListGetItemColor: (gridList: Element, rowIndex: number, columnIndex: number) -> (number, number, number, number)
declare guiGridListGetItemData: (gridList: Element, rowIndex: number, columnIndex: number) -> any
declare guiGridListGetItemText: (gridList: Element, rowIndex: number, columnIndex: number) -> string
declare guiGridListGetRowCount: (gridList: Element) -> number
declare guiGridListGetSelectedCount: (gridList: Element) -> number
declare guiGridListGetSelectedItem: (gridList: Element) -> (number, number)
declare guiGridListGetSelectedItems: (gridList: Element) -> any
declare guiGridListGetSelectionMode: (gridlist: any) -> number
declare guiGridListGetVerticalScrollPosition: (guiGridlist: Element) -> number
declare guiGridListInsertRowAfter: (gridList: Element, rowIndex: number) -> number
declare guiGridListIsSortingEnabled: (guiGridlist: Element) -> boolean
declare guiGridListRemoveColumn: (gridList: Element, columnIndex: number) -> boolean
declare guiGridListRemoveRow: (gridList: Element, rowIndex: number) -> boolean
declare guiGridListSetColumnTitle: (guiGridlist: Element, columnIndex: number, title: string) -> boolean
declare guiGridListSetColumnWidth: (gridList: Element, columnIndex: number, width: number, relative: boolean) -> boolean
declare guiGridListSetHorizontalScrollPosition: (guiGridlist: Element, fPosition: number) -> boolean
declare guiGridListSetItemColor: (gridList: Element, rowIndex: number, columnIndex: number, red: number, green: number, blue: number, alpha: number?) -> boolean
declare guiGridListSetItemData: (gridList: Element, rowIndex: number, columnIndex: number, data: any) -> boolean
declare guiGridListSetItemText: (gridList: Element, rowIndex: number, columnIndex: number, text: string, section: boolean, number: boolean) -> boolean
declare guiGridListSetScrollBars: (guiGridlist: Element, horizontalBar: boolean, verticalBar: boolean) -> boolean
declare guiGridListSetSelectedItem: (gridList: Element, rowIndex: number, columnIndex: number, bReset: boolean?) -> boolean
declare guiGridListSetSelectionMode: (gridlist: any, mode: number) -> boolean
declare guiGridListSetSortingEnabled: (guiGridlist: Element, enabled: boolean) -> boolean
declare guiGridListSetVerticalScrollPosition: (guiGridlist: Element, fPosition: number) -> boolean
declare guiLabelGetColor: (theLabel: any) -> (number, number, number)
declare guiLabelGetFontHeight: (theLabel: Element) -> number
declare guiLabelGetTextExtent: (theLabel: Element) -> number
declare guiLabelSetColor: (theElement: Element, red: number, green: number, blue: number) -> boolean
declare guiLabelSetHorizontalAlign: (theLabel: Element, align: string, wordwrap: boolean?) -> boolean
declare guiLabelSetVerticalAlign: (theLabel: Element, align: string) -> boolean
declare guiMemoGetCaretIndex: (theElement: Element) -> number
declare guiMemoGetVerticalScrollPosition: (theMemo: any) -> number
declare guiMemoIsReadOnly: (theMemo: any) -> boolean
declare guiMemoSetCaretIndex: (theMemo: any, index: number) -> boolean
declare guiMemoSetReadOnly: (theMemo: any, status: boolean) -> boolean
declare guiMemoSetVerticalScrollPosition: (theMemo: any, position: number) -> boolean
declare guiMoveToBack: (guiElement: Element) -> boolean
declare guiProgressBarGetProgress: (theProgressbar: any) -> number
declare guiProgressBarSetProgress: (theProgressbar: any, progress: number) -> boolean
declare guiRadioButtonGetSelected: (guiRadioButton: Element) -> boolean
declare guiRadioButtonSetSelected: (guiRadioButton: Element, state: boolean) -> boolean
declare guiScrollBarGetScrollPosition: (theScrollBar: any) -> number
declare guiScrollBarSetScrollPosition: (theScrollBar: any, amount: number) -> boolean
declare guiScrollPaneGetHorizontalScrollPosition: (horizontalScrollPane: Element) -> number
declare guiScrollPaneGetVerticalScrollPosition: (verticalScrollPane: Element) -> number
declare guiScrollPaneSetHorizontalScrollPosition: (horizontalScrollPane: Element, position: number) -> boolean
declare guiScrollPaneSetScrollBars: (scrollPane: Element, horizontal: boolean, vertical: boolean) -> boolean
declare guiScrollPaneSetVerticalScrollPosition: (verticalScrollPane: Element, position: number) -> boolean
declare guiSetAlpha: (guielement: Element, alpha: number) -> boolean
declare guiSetEnabled: (guiElement: Element, enabled: boolean) -> boolean
declare guiSetFont: (guiElement: Element, font: any) -> boolean
declare guiSetInputEnabled: (enabled: boolean) -> boolean
declare guiSetInputMode: (mode: string) -> boolean
declare guiSetPosition: (theElement: Element, x: number, y: number, relative: boolean) -> boolean
declare guiSetProperty: (guiElement: Element, property: string, value: string) -> boolean
declare guiSetSelectedTab: (tabPanel: Element, theTab: Element) -> boolean
declare guiSetSize: (guiElement: Element, width: number, height: number, relative: boolean) -> boolean
declare guiSetText: (guiElement: Element, text: string) -> boolean
declare guiSetVisible: (guiElement: Element, state: boolean) -> boolean
declare guiStaticImageGetNativeSize: (theImage: Element) -> (number, number)
declare guiStaticImageLoadImage: (theElement: Element, filename: string) -> boolean
declare guiWindowIsMovable: (guiWindow: any) -> boolean
declare guiWindowIsSizable: (guiWindow: any) -> boolean
declare guiWindowSetMovable: (theElement: Element, status: boolean) -> boolean
declare guiWindowSetSizable: (theElement: Element, status: boolean) -> boolean
declare hasElementData: (theElement: Element, key: string, inherit: boolean?) -> boolean
declare hasElementDataSubscriber: (theElement: Element, key: string, thePlayer: Player) -> boolean
declare hash: (algorithm: string, dataToHash: string, options: any?) -> string
declare httpClear: () -> boolean
declare httpRequestLogin: () -> boolean
declare httpSetResponseCode: (code: number) -> boolean
declare httpSetResponseCookie: (cookieName: string, cookieValue: string) -> boolean
declare httpSetResponseHeader: (headerName: string, headerValue: string) -> boolean
declare httpWrite: (data: string, length: number?) -> boolean
declare injectBrowserMouseDown: (webBrowser: Browser, mouseButton: string) -> boolean
declare injectBrowserMouseMove: (webBrowser: Browser, posX: number, posY: number) -> boolean
declare injectBrowserMouseUp: (webBrowser: Browser, mouseButton: string) -> boolean
declare injectBrowserMouseWheel: (webBrowser: Browser, verticalScroll: number, horizontalScroll: number) -> boolean
declare inspect: (var: any, options: any?) -> string
declare interpolateBetween: (x1: number, y1: number, z1: number, x2: number, y2: number, z2: number, fProgress: number, strEasingType: string, fEasingPeriod: number?, fEasingAmplitude: number?, fEasingOvershoot: number?) -> (number, number, number)
declare isAmbientSoundEnabled: (theType: string) -> boolean
declare isBan: (theBan: Ban) -> boolean
declare isBrowserDomainBlocked: (address: string, isURL: boolean?) -> boolean
declare isBrowserFocused: (webBrowser: Browser) -> boolean
declare isBrowserLoading: (webBrowser: Browser) -> boolean
declare isBrowserRenderingPaused: (webBrowser: Browser) -> boolean
declare isCapsLockEnabled: () -> boolean
declare isChatBoxInputActive: () -> boolean
declare isChatInputBlocked: () -> boolean
declare isChatVisible: () -> boolean
declare isConsoleActive: () -> boolean
declare isControlEnabled: (thePlayer: Player, control: string) -> boolean
declare isCoronaReflectionEnabled: (theMarker: Marker) -> boolean
declare isCursorShowing: (thePlayer: Player) -> boolean
declare isDebugViewActive: () -> boolean
declare isElement: (theValue: any) -> boolean
declare isElementAttached: (theElement: Element) -> boolean
declare isElementCallPropagationEnabled: (theElement: Element) -> boolean
declare isElementCollidableWith: (theElement: Element, withElement: Element) -> boolean
declare isElementDoubleSided: (theElement: Element) -> boolean
declare isElementFrozen: (theElement: Element) -> boolean
declare isElementInWater: (theElement: Element) -> boolean
declare isElementLocal: (theElement: Element) -> boolean
declare isElementLowLOD: (theElement: Element) -> boolean
declare isElementOnScreen: (theElement: Element) -> boolean
declare isElementStreamable: (theElement: Element) -> boolean
declare isElementStreamedIn: (theElement: Element) -> boolean
declare isElementSyncer: (theElement: Element) -> boolean
declare isElementVisibleTo: (theElement: Element, visibleTo: Element) -> boolean
declare isElementWaitingForGroundToLoad: (theElement: Element) -> boolean
declare isElementWithinColShape: (theElement: Element, theShape: ColShape) -> boolean
declare isElementWithinMarker: (theElement: Element, theMarker: Marker) -> boolean
declare isGarageOpen: (garageID: number) -> boolean
declare isGlitchEnabled: (glitchName: string) -> boolean
declare isGuestAccount: (theAccount: Account) -> boolean
declare isInsideColShape: (theShape: ColShape, posX: number, posY: number, posZ: number) -> boolean
declare isInsideRadarArea: (theArea: RadarArea, posX: number, posY: number) -> boolean
declare isKeyBound: (thePlayer: Player, key: string, keyState: string?, handler: any?) -> boolean
declare isLineOfSightClear: (startX: number, startY: number, startZ: number, endX: number, endY: number, endZ: number, checkBuildings: boolean?, checkVehicles: boolean?, checkPeds: boolean?, checkObjects: boolean?, checkDummies: boolean?, seeThroughStuff: boolean?, ignoreSomeObjectsForCamera: boolean?, ignoredElement: Element?) -> boolean
declare isMTAWindowActive: () -> boolean
declare isMainMenuActive: () -> boolean
declare isOOPEnabled: () -> boolean
declare isObjectInACLGroup: (theObjectName: string, theGroup: ACLGroup) -> boolean
declare isObjectMoving: (theObject: Object) -> boolean
declare isPedBleeding: (thePed: Ped) -> boolean
declare isPedChoking: (thePed: Ped) -> boolean
declare isPedDead: (thePed: Ped) -> boolean
declare isPedDoingGangDriveby: (thePed: Ped) -> boolean
declare isPedDoingTask: (thePed: Ped, taskName: string) -> boolean
declare isPedDucked: (thePed: Ped) -> boolean
declare isPedFootBloodEnabled: (thePlayer: Element) -> boolean
declare isPedHeadless: (thePed: Ped) -> boolean
declare isPedInVehicle: (thePed: Ped) -> boolean
declare isPedOnFire: (thePed: Ped) -> boolean
declare isPedOnGround: (thePed: Ped) -> boolean
declare isPedReloadingWeapon: (thePed: Ped) -> boolean
declare isPedTargetingMarkerEnabled: () -> boolean
declare isPedWearingJetpack: (thePed: Ped) -> boolean
declare isPickupSpawned: (thePickup: Pickup) -> boolean
declare isPlayerHudComponentVisible: (component: string) -> boolean
declare isPlayerMapForced: (thePlayer: Player) -> boolean
declare isPlayerMapVisible: () -> boolean
declare isPlayerMuted: (thePlayer: Player) -> boolean
declare isPlayerNametagShowing: (thePlayer: Player) -> boolean
declare isRadarAreaFlashing: (theRadararea: RadarArea) -> boolean
declare isResourceArchived: (resourceElement: Resource) -> boolean
declare isResourceProtected: (theResource: Resource) -> boolean
declare isShowCollisionsEnabled: () -> boolean
declare isShowSoundEnabled: () -> boolean
declare isSoundLooped: (theSound: Element) -> boolean
declare isSoundPanningEnabled: (theSound: Element) -> boolean
declare isSoundPaused: (theSound: Element) -> boolean
declare isTimer: (theTimer: Timer) -> boolean
declare isTrainChainEngine: (theTrain: Vehicle) -> boolean
declare isTrainDerailable: (vehicleToCheck: Vehicle) -> boolean
declare isTrainDerailed: (vehicleToCheck: Vehicle) -> boolean
declare isTransferBoxActive: () -> boolean
declare isTransferBoxAlwaysVisible: () -> boolean
declare isTransferBoxVisible: () -> boolean
declare isTrayNotificationEnabled: () -> boolean
declare isVehicleBlown: (theVehicle: Vehicle) -> boolean
declare isVehicleDamageProof: (theVehicle: Vehicle) -> boolean
declare isVehicleFuelTankExplodable: (theVehicle: Vehicle) -> boolean
declare isVehicleLocked: (theVehicle: Vehicle) -> boolean
declare isVehicleNitroActivated: (theVehicle: Vehicle) -> boolean
declare isVehicleNitroRecharging: (theVehicle: Vehicle) -> boolean
declare isVehicleOnGround: (theVehicle: Vehicle) -> boolean
declare isVehicleTaxiLightOn: (taxi: Vehicle) -> boolean
declare isVehicleWindowOpen: (theVehicle: Vehicle, window: number) -> boolean
declare isVoiceEnabled: () -> boolean
declare isWaterDrawnLast: () -> boolean
declare isWorldSoundEnabled: (group: number, index: number?) -> boolean
declare isWorldSpecialPropertyEnabled: (propname: string) -> boolean
declare killTimer: (theTimer: Timer) -> boolean
declare loadBrowserURL: (webBrowser: Browser, url: string, postData: string?, urlEncoded: boolean?) -> boolean
declare loadMapData: (node: XMLNode, parent: Element) -> Element
declare logIn: (thePlayer: Player, theAccount: Account, thePassword: string) -> boolean
declare logOut: (thePlayer: Player) -> boolean
declare md5: (str: string) -> string
declare moveObject: (theObject: Object, time: number, targetx: number, targety: number, targetz: number, moverx: number?, movery: number?, moverz: number?, strEasingType: string?, fEasingPeriod: number?, fEasingAmplitude: number?, fEasingOvershoot: number?) -> boolean
declare navigateBrowserBack: (webBrowser: Browser) -> boolean
declare navigateBrowserForward: (webBrowser: Browser) -> boolean
declare outputConsole: (text: string) -> boolean
declare outputServerLog: (text: string) -> boolean
declare passwordHash: (password: string, algorithm: string, options: any, callback: any?) -> string
declare passwordVerify: (password: string, hash: string, options: any?, callback: any?) -> boolean
declare playSFX: (containerName: string, bankId: number, soundId: number, looped: boolean?) -> Element
declare playSFX3D: (containerName: string, bankId: number, soundId: number, x: number, y: number, z: number, looped: boolean?) -> Element
declare playSound: (soundPath: string, looped: boolean?, throttled: boolean?) -> Element
declare playSound3D: (soundPath: string, x: number, y: number, z: number, looped: boolean?) -> Element
declare playSoundFrontEnd: (thePlayer: Player, sound: number) -> boolean
declare redirectPlayer: (thePlayer: Player, serverIP: string, serverPort: number, serverPassword: string?) -> boolean
declare ref: (objectToReference: any) -> number
declare refreshResources: (refreshAll: boolean?, targetResource: Resource?) -> boolean
declare reloadBans: () -> boolean
declare reloadBrowserPage: (webBrowser: Browser) -> boolean
declare reloadPedWeapon: (thePed: Ped) -> boolean
declare removeAccount: (theAccount: Account) -> boolean
declare removeBan: (theBan: Ban, responsibleElement: Player?) -> boolean
declare removeColPolygonPoint: (shape: ColShape, index: number) -> boolean
declare removeCommandHandler: (commandName: string, handler: any?) -> boolean
declare removeDebugHook: (hookType: string, callbackFunction: any) -> boolean
declare removeElementData: (theElement: Element, key: string) -> boolean
declare removeElementDataSubscriber: (theElement: Element, key: string, thePlayer: Player) -> boolean
declare removeEventHandler: (eventName: string, attachedTo: Element, functionVar: any) -> boolean
declare removePedClothes: (thePed: Ped, clothesType: number, clothesTexture: string?, clothesModel: string?) -> boolean
declare removePedFromVehicle: (thePed: Ped) -> boolean
declare removeResourceFile: (theResource: Resource, fileName: string) -> boolean
declare removeRuleValue: (key: string) -> boolean
declare removeVehicleSirens: (theVehicle: Vehicle) -> boolean
declare removeVehicleUpgrade: (theVehicle: Vehicle, upgrade: number) -> boolean
declare removeWorldModel: (modelID: number, radius: number, x: number, y: number, z: number, interior: number?) -> boolean
declare requestBrowserDomains: (pages: any, parseAsURL: boolean?, callback: any?) -> boolean
declare resendPlayerACInfo: (thePlayer: Player) -> boolean
declare resendPlayerModInfo: (thePlayer: Player) -> boolean
declare resetAmbientSounds: () -> boolean
declare resetBlurLevel: () -> boolean
declare resetColorFilter: () -> boolean
declare resetCoronaReflectionsEnabled: () -> boolean
declare resetFarClipDistance: () -> boolean
declare resetFogDistance: () -> boolean
declare resetHeatHaze: () -> boolean
declare resetMapInfo: (thePlayer: Player?) -> boolean
declare resetMoonSize: () -> boolean
declare resetNearClipDistance: () -> boolean
declare resetPedsLODDistance: () -> boolean
declare resetRainLevel: () -> boolean
declare resetSkyGradient: () -> boolean
declare resetSunColor: () -> boolean
declare resetSunSize: () -> boolean
declare resetTimer: (theTimer: Timer) -> boolean
declare resetVehicleComponentPosition: (theVehicle: Vehicle, theComponent: string) -> boolean
declare resetVehicleComponentRotation: (theVehicle: Vehicle, theComponent: string) -> boolean
declare resetVehicleComponentScale: (theVehicle: Vehicle, theComponent: string) -> boolean
declare resetVehicleDummyPositions: (theVehicle: Vehicle) -> boolean
declare resetVehicleExplosionTime: (theVehicle: Vehicle) -> boolean
declare resetVehicleIdleTime: (theVehicle: Vehicle) -> boolean
declare resetVehiclesLODDistance: () -> boolean
declare resetWaterColor: () -> boolean
declare resetWaterLevel: () -> boolean
declare resetWeaponFiringRate: (theWeapon: Weapon) -> boolean
declare resetWindVelocity: () -> boolean
declare resetWorldSounds: () -> boolean
declare resizeBrowser: (webBrowser: Browser, width: number, height: number) -> boolean
declare respawnObject: (theObject: Object) -> boolean
declare respawnVehicle: (theVehicle: Vehicle) -> boolean
declare restartResource: (theResource: Resource, persistent: boolean?, configs: boolean?, maps: boolean?, scripts: boolean?, html: boolean?, clientConfigs: boolean?, clientScripts: boolean?, clientFiles: boolean?) -> boolean
declare restoreAllWorldModels: () -> boolean
declare restoreWorldModel: (modelID: number, radius: number, x: number, y: number, z: number, iInterior: number?) -> boolean
declare saveMapData: (node: XMLNode, baseElement: Element, childrenOnly: boolean?) -> boolean
declare set: (settingName: string, value: any) -> boolean
declare setAccountData: (theAccount: Account, key: string, value: any) -> boolean
declare setAccountName: (theAccount: Account, name: string, allowCaseVariations: boolean?) -> boolean
declare setAccountPassword: (theAccount: Account, password: string) -> boolean
declare setAircraftMaxHeight: (Height: number) -> boolean
declare setAircraftMaxVelocity: (velocity: number) -> boolean
declare setAmbientSoundEnabled: (theType: string, enable: boolean) -> boolean
declare setAnalogControlState: (control: string, state: number?, forceOverrideNextFrame: boolean?) -> boolean
declare setBanAdmin: (theBan: Ban, theAdmin: string) -> boolean
declare setBanNick: (theBan: Ban, theNick: string) -> boolean
declare setBanReason: (theBan: Ban, theReason: string) -> boolean
declare setBirdsEnabled: (enable: boolean) -> boolean
declare setBlipColor: (theBlip: Blip, red: number, green: number, blue: number, alpha: number) -> boolean
declare setBlipIcon: (theBlip: Blip, icon: number) -> boolean
declare setBlipOrdering: (theBlip: Blip, ordering: number) -> boolean
declare setBlipSize: (theBlip: Blip, iconSize: number) -> boolean
declare setBlipVisibleDistance: (theBlip: Blip, theDistance: number) -> boolean
declare setBrowserAjaxHandler: (webBrowser: Browser, url: string, handler: any?) -> boolean
declare setBrowserProperty: (theBrowser: Browser, key: string, value: string) -> boolean
declare setBrowserRenderingPaused: (webBrowser: Browser, paused: boolean) -> boolean
declare setBrowserVolume: (webBrowser: Browser?, volume: number) -> boolean
declare setCameraClip: (objects: boolean?, vehicles: boolean?) -> boolean
declare setCameraFieldOfView: (cameraMode: string, fieldOfView: number) -> boolean
declare setCameraGoggleEffect: (goggleEffect: string, noiseEnabled: boolean?) -> boolean
declare setCameraInterior: (thePlayer: Player, interior: number) -> boolean
declare setCameraMatrix: (thePlayer: Player, positionX: number, positionY: number, positionZ: number, lookAtX: number?, lookAtY: number?, lookAtZ: number?, roll: number?, fov: number?) -> boolean
declare setCameraShakeLevel: (shakeLevel: number) -> boolean
declare setCameraTarget: (thePlayer: Player, target: Player?) -> boolean
declare setCameraViewMode: (vehicleCameraMode: number, pedCameraMode: number?) -> boolean
declare setClipboard: (theText: string) -> boolean
declare setCloudsEnabled: (enabled: boolean) -> boolean
declare setColPolygonHeight: (shape: ColShape, floor: number, ceil: number) -> boolean
declare setColPolygonPointPosition: (shape: ColShape, index: number, fX: number, fY: number) -> boolean
declare setColShapeRadius: (shape: ColShape, radius: number) -> boolean
declare setColorFilter: (aRed: number, aGreen: number, aBlue: number, aAlpha: number, bRed: number, bGreen: number, bBlue: number, bAlpha: number) -> boolean
declare setControlState: (thePlayer: Player, control: string, state: boolean) -> boolean
declare setCoronaReflectionEnabled: (theMarker: Marker, enabled: boolean) -> boolean
declare setCoronaReflectionsEnabled: (enabled: number) -> boolean
declare setCursorAlpha: (alpha: number) -> boolean
declare setCursorPosition: (cursorX: number, cursorY: number) -> boolean
declare setDebugViewActive: (enabled: boolean) -> boolean
declare setDevelopmentMode: (enable: boolean, enableWeb: boolean?) -> boolean
declare setEffectDensity: (theEffect: Effect, density: number) -> boolean
declare setEffectSpeed: (theEffect: Effect, speed: number) -> boolean
declare setElementAlpha: (theElement: Element, alpha: number) -> boolean
declare setElementAngularVelocity: (theElement: Element, rx: number, ry: number, rz: number) -> boolean
declare setElementAttachedOffsets: (theElement: Element, xPosOffset: number?, yPosOffset: number?, zPosOffset: number?, xRotOffset: number?, yRotOffset: number?, zRotOffset: number?) -> boolean
declare setElementBoneMatrix: (theElement: Element, boneId: number, matrix: any) -> boolean
declare setElementBonePosition: (theElement: Element, bone: number, x: number, y: number, z: number) -> boolean
declare setElementBoneRotation: (theElement: Element, boneId: number, yaw: number, pitch: number, roll: number) -> boolean
declare setElementCallPropagationEnabled: (theElement: Element, enabled: boolean) -> boolean
declare setElementCollidableWith: (theElement: Element, withElement: Element, enabled: boolean) -> boolean
declare setElementCollisionsEnabled: (theElement: Element, enabled: boolean) -> boolean
declare setElementData: (theElement: Element, key: string, value: any, synchronize: boolean?) -> boolean
declare setElementDimension: (theElement: Element, dimension: number) -> boolean
declare setElementDoubleSided: (theElement: Element, enable: boolean) -> boolean
declare setElementFrozen: (theElement: Element, freezeStatus: boolean) -> boolean
declare setElementHealth: (theElement: Element, newHealth: number) -> boolean
declare setElementID: (theElement: Element, name: string) -> boolean
declare setElementInterior: (theElement: Element, interior: number, x: number?, y: number?, z: number?) -> boolean
declare setElementMatrix: (theElement: Element, theMatrix: any) -> boolean
declare setElementModel: (theElement: Element, model: number) -> boolean
declare setElementParent: (theElement: Element, parent: Element) -> boolean
declare setElementPosition: (theElement: Element, x: number, y: number, z: number, warp: boolean?) -> boolean
declare setElementRotation: (theElement: Element, rotX: number, rotY: number, rotZ: number, rotOrder: string?, conformPedRotation: boolean?) -> boolean
declare setElementStreamable: (theElement: Element, streamable: boolean) -> boolean
declare setElementSyncer: (theElement: Element, thePlayer: Player) -> boolean
declare setElementVelocity: (theElement: Element, speedX: number, speedY: number, speedZ: number) -> boolean
declare setElementVisibleTo: (theElement: Element, visibleTo: Element, visible: boolean) -> boolean
declare setFPSLimit: (fpsLimit: number) -> boolean
declare setFarClipDistance: (distance: number) -> boolean
declare setFogDistance: (distance: number) -> boolean
declare setGameSpeed: (value: number) -> boolean
declare setGameType: (gameType: string) -> boolean
declare setGarageOpen: (garageID: number, open: boolean) -> boolean
declare setGlitchEnabled: (glitchName: string, enable: boolean) -> boolean
declare setGravity: (level: number) -> boolean
declare setHeatHaze: (intensity: number, randomShift: number?, speedMin: number?, speedMax: number?, scanSizeX: number?, scanSizeY: number?, renderSizeX: number?, renderSizeY: number?, bShowInside: boolean?) -> boolean
declare setHeliBladeCollisionsEnabled: (theVehicle: Vehicle, collisions: boolean) -> boolean
declare setHelicopterRotorSpeed: (heli: Vehicle, speed: number) -> boolean
declare setInteriorFurnitureEnabled: (roomID: number, enabled: boolean) -> boolean
declare setInteriorSoundsEnabled: (enabled: boolean) -> boolean
declare setJetpackMaxHeight: (Height: number) -> boolean
declare setJetpackWeaponEnabled: (weapon: string, enabled: boolean) -> boolean
declare setLightColor: (theLight: Light, r: number, g: number, b: number) -> boolean
declare setLightDirection: (theLight: Light, x: number, y: number, z: number) -> boolean
declare setLightRadius: (theLight: Light, radius: number) -> boolean
declare setLowLODElement: (theElement: Element, lowLODElement: Element) -> boolean
declare setMapName: (mapName: string) -> boolean
declare setMarkerColor: (theMarker: Marker, r: number, g: number, b: number, a: number) -> boolean
declare setMarkerIcon: (theMarker: Marker, icon: string) -> boolean
declare setMarkerSize: (theMarker: Marker, size: number) -> boolean
declare setMarkerTarget: (theMarker: Marker, x: number, y: number, z: number) -> boolean
declare setMarkerType: (theMarker: Marker, markerType: string) -> boolean
declare setMaxPlayers: (slots: number) -> boolean
declare setMinuteDuration: (milliseconds: number) -> boolean
declare setModelHandling: (modelId: number, property: string, value: any) -> boolean
declare setMoonSize: (size: number) -> boolean
declare setNearClipDistance: (distance: number) -> boolean
declare setObjectBreakable: (theObject: Object, breakable: boolean) -> boolean
declare setObjectMass: (theObject: Object, mass: number) -> boolean
declare setObjectProperty: (theObject: Object, property: string, value: any) -> boolean
declare setObjectScale: (theObject: Object, scale: number, scaleY: number?, scaleZ: number?) -> boolean
declare setOcclusionsEnabled: (enabled: boolean) -> boolean
declare setPedAimTarget: (thePed: Ped, x: number, y: number, z: number) -> boolean
declare setPedAnalogControlState: (thePed: Ped, control: string, state: number) -> boolean
declare setPedAnimation: (thePed: Ped, block: string?, anim: string?, time: number?, loop: boolean?, updatePosition: boolean?, interruptable: boolean?, freezeLastFrame: boolean?, blendTime: number?, retainPedState: boolean?) -> boolean
declare setPedAnimationProgress: (thePed: Ped, anim: string?, progress: number?) -> boolean
declare setPedAnimationSpeed: (thePed: Ped, anim: string?, speed: number?) -> boolean
declare setPedArmor: (thePed: Ped, armor: number) -> boolean
declare setPedBleeding: (thePed: Ped, bleeding: boolean) -> boolean
declare setPedCameraRotation: (thePed: Ped, cameraRotation: number) -> boolean
declare setPedCanBeKnockedOffBike: (thePed: Ped, canBeKnockedOffBike: boolean) -> boolean
declare setPedChoking: (thePed: Ped, choking: boolean) -> boolean
declare setPedControlState: (thePed: Ped, control: string, state: boolean) -> boolean
declare setPedDoingGangDriveby: (thePed: Ped, state: boolean) -> boolean
declare setPedEnterVehicle: (thePed: Ped, theVehicle: Vehicle?, passenger: boolean?) -> boolean
declare setPedExitVehicle: (thePed: Ped) -> boolean
declare setPedFightingStyle: (thePed: Ped, style: number) -> boolean
declare setPedFootBloodEnabled: (thePlayer: Element, enabled: boolean) -> boolean
declare setPedGravity: (thePed: Ped, gravity: number) -> boolean
declare setPedHeadless: (thePed: Ped, headState: boolean) -> boolean
declare setPedOnFire: (thePed: Ped, isOnFire: boolean) -> boolean
declare setPedOxygenLevel: (thePed: Ped, oxygen: number) -> boolean
declare setPedStat: (thePed: Ped, stat: number, value: number) -> boolean
declare setPedTargetingMarkerEnabled: (enabled: boolean) -> boolean
declare setPedVoice: (thePed: Ped, voiceType: string, voiceName: string) -> boolean
declare setPedWalkingStyle: (thePed: Ped, style: number) -> boolean
declare setPedWeaponSlot: (thePed: Ped, weaponSlot: number) -> boolean
declare setPedWearingJetpack: (thePed: Ped, state: boolean) -> boolean
declare setPedsLODDistance: (distance: number) -> boolean
declare setPickupRespawnInterval: (thePickup: Pickup, ms: number) -> boolean
declare setPlayerAnnounceValue: (thePlayer: Element, key: string, value: string) -> boolean
declare setPlayerBlurLevel: (thePlayer: Player, level: number) -> boolean
declare setPlayerHudComponentVisible: (thePlayer: Player, component: string, show: boolean) -> boolean
declare setPlayerMoney: (thePlayer: Player, amount: number, instant: boolean?) -> boolean
declare setPlayerMuted: (thePlayer: Player, state: boolean) -> boolean
declare setPlayerName: (thePlayer: Player, newName: string) -> boolean
declare setPlayerNametagColor: (thePlayer: Player, r: number, g: number, b: number) -> boolean
declare setPlayerNametagShowing: (thePlayer: Player, showing: boolean) -> boolean
declare setPlayerNametagText: (thePlayer: Player, text: string) -> boolean
declare setPlayerScriptDebugLevel: (thePlayer: Player, level: number) -> boolean
declare setPlayerTeam: (thePlayer: Player, theTeam: Team) -> boolean
declare setPlayerVoiceBroadcastTo: (thePlayer: Element, broadcastTo: any) -> boolean
declare setPlayerVoiceIgnoreFrom: (thePlayer: Element, ignoreFrom: any) -> boolean
declare setPlayerWantedLevel: (thePlayer: Player, stars: number) -> boolean
declare setProjectileCounter: (projectile: Projectile, timeToDetonate: number) -> boolean
declare setRadarAreaColor: (theRadarArea: RadarArea, r: number, g: number, b: number, a: number) -> boolean
declare setRadarAreaFlashing: (theRadarArea: RadarArea, flash: boolean) -> boolean
declare setRadarAreaSize: (theRadararea: RadarArea, x: number, y: number) -> boolean
declare setRadioChannel: (ID: number) -> boolean
declare setRainLevel: (level: number) -> boolean
declare setResourceInfo: (theResource: Resource, attribute: string, value: string) -> boolean
declare setRuleValue: (key: string, value: string) -> boolean
declare setSearchLightEndPosition: (theSearchLight: Searchlight, endX: number, endY: number, endZ: number) -> boolean
declare setSearchLightEndRadius: (theSearchlight: Searchlight, endRadius: number) -> boolean
declare setSearchLightStartPosition: (theSearchLight: Searchlight, startX: number, startY: number, startZ: number) -> boolean
declare setSearchLightStartRadius: (theSearchlight: Searchlight, startRadius: number) -> boolean
declare setServerConfigSetting: (name: string, value: string, bSave: boolean?) -> boolean
declare setServerPassword: (thePassword: string) -> boolean
declare setSkyGradient: (topRed: number?, topGreen: number?, topBlue: number?, bottomRed: number?, bottomGreen: number?, bottomBlue: number?) -> boolean
declare setSoundEffectParameter: (sound: Element, effectName: string, effectParam: string, paramValue: any) -> boolean
declare setSoundLooped: (theSound: Element, loop: boolean) -> boolean
declare setSoundMaxDistance: (sound: Element, distance: number) -> boolean
declare setSoundMinDistance: (sound: Element, distance: number) -> boolean
declare setSoundPan: (theSound: Element, pan: number) -> boolean
declare setSoundPanningEnabled: (sound: Element, enable: boolean) -> boolean
declare setSoundPaused: (theSound: Element, paused: boolean) -> boolean
declare setSoundPosition: (theSound: Element, pos: number) -> boolean
declare setSoundProperties: (sound: Element, fSampleRate: number, fTempo: number, fPitch: number, bReverse: boolean?) -> boolean
declare setSoundSpeed: (theSound: Element, speed: number) -> boolean
declare setSunColor: (aRed: number, aGreen: number, aBlue: number, bRed: number, bGreen: number, bBlue: number) -> boolean
declare setSunSize: (Size: number) -> boolean
declare setTeamColor: (theTeam: Team, colorR: number, colorG: number, colorB: number) -> boolean
declare setTeamFriendlyFire: (theTeam: Team, friendlyFire: boolean) -> boolean
declare setTeamName: (theTeam: Team, newName: string) -> boolean
declare setTime: (hour: number, minute: number) -> boolean
declare setTrafficLightState: (state: number) -> boolean
declare setTrafficLightsLocked: (toggle: boolean) -> boolean
declare setTrainDerailable: (derailableVehicle: Vehicle, derailable: boolean) -> boolean
declare setTrainDerailed: (vehicleToDerail: Vehicle, derailed: boolean) -> boolean
declare setTrainDirection: (train: Vehicle, clockwise: boolean) -> boolean
declare setTrainPosition: (train: Vehicle, position: number) -> boolean
declare setTrainSpeed: (train: Vehicle, speed: number) -> boolean
declare setTrainTrack: (train: Vehicle, track: number) -> boolean
declare setTransferBoxVisible: (visible: boolean) -> boolean
declare setUnbanTime: (theBan: Ban, theTime: number) -> boolean
declare setVehicleAdjustableProperty: (theVehicle: Element, value: number) -> boolean
declare setVehicleColor: (veh: Vehicle, r1: number, g1: number, b1: number, r2: number?, g2: number?, b2: number?, r3: number?, g3: number?, b3: number?, r4: number?, g4: number?, b4: number?) -> boolean
declare setVehicleComponentPosition: (theVehicle: Vehicle, theComponent: string, posX: number, posY: number, posZ: number, base: string?) -> boolean
declare setVehicleComponentRotation: (theVehicle: Vehicle, theComponent: string, rotX: number, rotY: number, rotZ: number, base: string?) -> boolean
declare setVehicleComponentScale: (theVehicle: Vehicle, theComponent: string, scaleX: number, scaleY: number, scaleZ: number, base: string?) -> boolean
declare setVehicleComponentVisible: (theVehicle: Vehicle, theComponent: string, visible: boolean) -> boolean
declare setVehicleDamageProof: (theVehicle: Vehicle, damageProof: boolean) -> boolean
declare setVehicleDirtLevel: (theVehicle: Vehicle, dirtLevel: number) -> boolean
declare setVehicleDoorOpenRatio: (theVehicle: Vehicle, door: number, ratio: number, time: number?) -> boolean
declare setVehicleDoorState: (theVehicle: Vehicle, door: number, state: number) -> boolean
declare setVehicleDoorsUndamageable: (theVehicle: Vehicle, state: boolean) -> boolean
declare setVehicleDummyPosition: (theVehicle: Vehicle, dummy: string, x: number, y: number, z: number) -> boolean
declare setVehicleEngineState: (theVehicle: Vehicle, engineState: boolean) -> boolean
declare setVehicleFuelTankExplodable: (theVehicle: Vehicle, explodable: boolean) -> boolean
declare setVehicleGravity: (theVehicle: Vehicle, x: number, y: number, z: number) -> boolean
declare setVehicleHandling: (theVehicle: Element, property: string, value: any) -> boolean
declare setVehicleHeadLightColor: (theVehicle: Vehicle, red: number, green: number, blue: number) -> boolean
declare setVehicleIdleRespawnDelay: (theVehicle: Vehicle, timeDelay: number) -> boolean
declare setVehicleLandingGearDown: (theVehicle: Vehicle, gearState: boolean) -> boolean
declare setVehicleLightState: (theVehicle: Vehicle, light: number, state: number) -> boolean
declare setVehicleLocked: (theVehicle: Vehicle, locked: boolean) -> boolean
declare setVehicleModelDummyPosition: (modelID: number, dummy: string, x: number, y: number, z: number) -> boolean
declare setVehicleModelExhaustFumesPosition: (modelID: number, posX: number, posY: number, posZ: number) -> boolean
declare setVehicleModelWheelSize: (vehicleModel: number, wheelGroup: string, wheelSize: number) -> boolean
declare setVehicleNitroActivated: (theVehicle: Vehicle, state: boolean) -> boolean
declare setVehicleNitroCount: (theVehicle: Vehicle, count: number) -> boolean
declare setVehicleNitroLevel: (theVehicle: Vehicle, level: number) -> boolean
declare setVehicleOverrideLights: (theVehicle: Vehicle, value: number) -> boolean
declare setVehiclePaintjob: (theVehicle: Vehicle, value: number) -> boolean
declare setVehiclePanelState: (theVehicle: Vehicle, panelID: number, state: number) -> boolean
declare setVehiclePlateText: (theVehicle: Element, numberplate: string) -> boolean
declare setVehicleRespawnDelay: (theVehicle: Vehicle, timeDelay: number) -> boolean
declare setVehicleRespawnPosition: (theVehicle: Vehicle, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?) -> boolean
declare setVehicleRespawnRotation: (theVehicle: Vehicle, rx: number, ry: number, rz: number) -> boolean
declare setVehicleSirens: (theVehicle: Vehicle, sirenPoint: number, posX: number, posY: number, posZ: number, red: number, green: number, blue: number, alpha: number?, minAlpha: number?) -> boolean
declare setVehicleSirensOn: (theVehicle: Vehicle, sirensOn: boolean) -> boolean
declare setVehicleTaxiLightOn: (taxi: Vehicle, LightState: boolean) -> boolean
declare setVehicleTurnVelocity: (theVehicle: Vehicle, rx: number, ry: number, rz: number) -> boolean
declare setVehicleTurretPosition: (turretVehicle: Vehicle, positionX: number, positionY: number) -> boolean
declare setVehicleVariant: (theVehicle: Vehicle, variant1: number?, variant2: number?) -> boolean
declare setVehicleWheelScale: (theVehicle: Vehicle, wheelScale: number) -> boolean
declare setVehicleWheelStates: (theVehicle: Vehicle, frontLeft: number, rearLeft: number?, frontRight: number?, rearRight: number?) -> boolean
declare setVehicleWindowOpen: (theVehicle: Vehicle, window: number, open: boolean) -> boolean
declare setVehiclesLODDistance: (vehiclesDistance: number, trainsAndPlanesDistance: number?) -> boolean
declare setWaterColor: (red: number, green: number, blue: number, alpha: number?) -> boolean
declare setWaterDrawnLast: (bEnabled: boolean) -> boolean
declare setWaterLevel: (theWater: Water?, level: number?) -> boolean
declare setWaterVertexPosition: (theWater: Water, vertexIndex: number, x: number, y: number, z: number) -> boolean
declare setWaveHeight: (height: number) -> boolean
declare setWeaponAmmo: (thePlayer: Player, weapon: number, totalAmmo: number, ammoInClip: number?) -> boolean
declare setWeaponClipAmmo: (theWeapon: Weapon, clipAmmo: number) -> boolean
declare setWeaponFiringRate: (theWeapon: Weapon, firingRate: number) -> boolean
declare setWeaponFlags: (theWeapon: Weapon, theFlag: string, enable: boolean) -> boolean
declare setWeaponState: (theWeapon: Weapon, theState: string) -> boolean
declare setWeather: (weatherID: number) -> boolean
declare setWeatherBlended: (weatherID: number) -> boolean
declare setWindVelocity: (velocityX: number, velocityY: number, velocityZ: number) -> boolean
declare setWindowFlashing: (shouldFlash: boolean, count: number?) -> boolean
declare setWorldSpecialPropertyEnabled: (propname: string, enable: boolean) -> boolean
declare sha256: (str: string) -> string
declare showChat: (show: boolean, inputBlocked: boolean?) -> boolean
declare showCol: (state: boolean) -> boolean
declare showCursor: (thePlayer: Player, show: boolean, toggleControls: boolean?) -> boolean
declare showSound: (state: boolean) -> boolean
declare shutdown: (reason: string?) -> boolean
declare spawnPlayer: (thePlayer: Player, x: number, y: number, z: number, rotation: number?, skinID: number?, interior: number?, dimension: number?, theTeam: Team?) -> boolean
declare spawnVehicle: (theVehicle: Vehicle, x: number, y: number, z: number, rx: number?, ry: number?, rz: number?) -> boolean
declare startResource: (resourceToStart: Resource, persistent: boolean?, startIncludedResources: boolean?, loadServerConfigs: boolean?, loadMaps: boolean?, loadServerScripts: boolean?, loadHTML: boolean?, loadClientConfigs: boolean?, loadClientScripts: boolean?, loadFiles: boolean?) -> boolean
declare stopObject: (theobject: Object) -> boolean
declare stopResource: (theResource: Resource) -> boolean
declare stopSound: (theSound: Element) -> boolean
declare svgCreate: (width: number, height: number, pathOrRawData: string?, callback: any?) -> any
declare svgGetDocumentXML: (svgElement: any) -> XMLNode
declare svgGetSize: (svgElement: any) -> (number, number)
declare svgSetDocumentXML: (svgElement: any, xmlDocument: XMLNode, callback: any?) -> boolean
declare svgSetSize: (svgElement: any, width: number, height: number, callback: any?) -> boolean
declare takeAllWeapons: (thePed: Ped) -> boolean
declare takePlayerMoney: (thePlayer: Player, amount: number) -> boolean
declare takePlayerScreenShot: (thePlayer: Player, width: number, height: number, tag: string?, quality: number?, maxBandwith: number?, maxPacketSize: number?) -> boolean
declare takeWeapon: (thePlayer: Player, weaponId: number, ammo: number?) -> boolean
declare teaDecode: (data: string, key: string) -> string
declare teaEncode: (text: string, key: string) -> string
declare testLineAgainstWater: (startX: number, startY: number, startZ: number, endX: number, endY: number, endZ: number) -> (boolean, number, number, number)
declare textCreateDisplay: () -> TextDisplay
declare textCreateTextItem: (text: string, x: number, y: number, priority: string?, red: number?, green: number?, blue: number?, alpha: number?, scale: number?, alignX: string?, alignY: string?, shadowAlpha: number?) -> TextItem
declare textDestroyDisplay: (display: TextDisplay) -> boolean
declare textDestroyTextItem: (theTextitem: TextItem) -> ()
declare textDisplayAddObserver: (display: TextDisplay, playerToAdd: Player) -> ()
declare textDisplayAddText: (displayToAddTo: TextDisplay, itemToAdd: TextItem) -> ()
declare textDisplayGetObservers: (theDisplay: TextDisplay) -> any
declare textDisplayIsObserver: (display: TextDisplay, thePlayer: Player) -> boolean
declare textDisplayRemoveObserver: (display: TextDisplay, playerToRemove: Player) -> boolean
declare textDisplayRemoveText: (displayToRemoveFrom: TextDisplay, itemToRemove: TextItem) -> ()
declare textItemGetColor: (theTextItem: TextItem) -> (number, number, number, number)
declare textItemGetPosition: (theTextItem: TextItem) -> (number, number)
declare textItemGetPriority: (textitemToCheck: TextItem) -> number
declare textItemGetScale: (theTextitem: TextItem) -> number
declare textItemGetText: (theTextitem: TextItem) -> string
declare textItemSetColor: (theTextItem: TextItem, r: number, g: number, b: number, a: number) -> boolean
declare textItemSetPosition: (theTextItem: TextItem, x: number, y: number) -> boolean
declare textItemSetPriority: (theTextItem: TextItem, priority: string) -> ()
declare textItemSetScale: (theTextitem: TextItem, scale: number) -> boolean
declare textItemSetText: (theTextitem: TextItem, text: string) -> ()
declare tocolor: (red: number, green: number, blue: number, alpha: number?) -> number
declare toggleAllControls: (thePlayer: Player, enabled: boolean, gtaControls: boolean?, mtaControls: boolean?) -> boolean
declare toggleBrowserDevTools: (webBrowser: Browser, visible: boolean) -> boolean
declare toggleControl: (thePlayer: Player, control: string, enabled: boolean) -> boolean
declare toggleObjectRespawn: (theObject: Object, respawn: boolean) -> boolean
declare toggleVehicleRespawn: (theVehicle: Vehicle, Respawn: boolean) -> boolean
declare triggerEvent: (eventName: string, baseElement: Element, argument1: any?, ...any?) -> boolean
declare triggerServerEvent: (event: string, theElement: Element, ...any?) -> boolean
declare unbindKey: (thePlayer: Player, key: string, keyState: string, command: string) -> boolean
declare updateElementRpHAnim: (theElement: Element) -> boolean
declare updateResourceACLRequest: (theResource: Resource, rightName: string, access: boolean, byWho: string?) -> boolean
declare usePickup: (thePickup: Pickup, thePlayer: Player) -> boolean
declare utfChar: (characterCode: number) -> string
declare utfCode: (theString: string) -> number
declare utfLen: (theString: string) -> number
declare utfSeek: (theString: string, position: number) -> number
declare utfSub: (theString: string, Start: number, End: number) -> string
declare wasEventCancelled: () -> boolean
declare xmlCopyFile: (nodeToCopy: XMLNode, newFilePath: string) -> XMLNode
declare xmlCreateChild: (parentNode: XMLNode, tagName: string) -> XMLNode
declare xmlCreateFile: (filePath: string, rootNodeName: string) -> XMLNode
declare xmlDestroyNode: (theXMLNode: XMLNode) -> boolean
declare xmlFindChild: (parent: XMLNode, tagName: string, index: number) -> XMLNode
declare xmlLoadFile: (filePath: string, readOnly: boolean?) -> XMLNode
declare xmlLoadString: (xmlString: string) -> XMLNode
declare xmlNodeGetAttribute: (node: XMLNode, name: string) -> string
declare xmlNodeGetAttributes: (node: XMLNode) -> any
declare xmlNodeGetName: (node: XMLNode) -> string
declare xmlNodeGetParent: (node: XMLNode) -> XMLNode
declare xmlNodeGetValue: (theXMLNode: XMLNode) -> string
declare xmlNodeSetName: (node: XMLNode, name: string) -> boolean
declare xmlNodeSetValue: (theXMLNode: XMLNode, value: string, setCDATA: boolean?) -> boolean
declare xmlSaveFile: (rootNode: XMLNode) -> boolean
declare xmlUnloadFile: (node: XMLNode) -> boolean

declare utf8: {
    escape: (input: string) -> string,
    find: (input: string, pattern: string, startpos: number?, plain: boolean?) -> (number, number),
    fold: (input: any) -> any,
    gmatch: (input: string, pattern: string) -> any,
    gsub: (input: string, pattern: string, replace: any, match_limit: number?) -> string,
    insert: (input: string, insert_pos: number?, substring: string) -> string,
    len: (input: string, i: number?, j: number?) -> number,
    fold: (input: any) -> any,
    ncasecmp: (a: string, b: string) -> number,
    remove: (input: string, start: number, stop: number?) -> string,
    reverse: (input: string) -> string,
    sub: (input: string, i: number?, j: number?) -> string,
    title: (input: any) -> string,
    title: (input: any) -> string,
    width: (input: any, ambi_is_double: boolean?, default_width: number?) -> number,
    widthindex: (input: string, location: number, ambi_is_double: boolean?, default_width: number?) -> (number, number, number),
}

declare outputDebugString: ((text: string, level: number?) -> boolean) & ((text: string, level: number, red: number, green: number, blue: number) -> boolean)

declare exports: any
declare resource: any
declare resourceRoot: any
declare root: Element
declare guiRoot: any
declare localPlayer: Player
declare source: any
declare this: any
declare eventName: any
declare client: any
declare sourceResource: any
declare sourceResourceRoot: any
declare sourceTimer: any

declare string: {
	byte: (s: string, i: number?, j: number?) -> any,
	char: (...any) -> string,
	dump: (fn: any) -> string,
	find: (s: string, pattern: string, init: number?, plain: boolean?) -> (number, number, ...any),
	format: (s: string, ...any) -> string,
	gmatch: (s: string, pattern: string) -> any,
	gsub: (s: string, pattern: string, replacement: string, n: number?) -> string,
	len: (s: string) -> number,
	lower: (s: string) -> string,
	match: (s: string, pattern: string, init: number?) -> ...any,
	rep: (s: string, n: number) -> string,
	reverse: (s: string) -> string,
	sub: (s: string, i: number, j: number?) -> string,
	upper: (s: string) -> string,
}
