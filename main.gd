extends Node3D
##Project created 2026/3/14, thursday
##Version: a0.0.1_build1
##PROTOTYPE AIM PRACTICE GAME 
##DEVELOPER: Elmo Luneta (Dalve)
##language: GDScript
##mini engine.



##GAME TEXTURE...
var texture1 : Texture = preload("res://GameTexture/desertgrassysht.jpg");
var texture2 : Texture = preload("res://gametextures_v2fold/walltexture1.png");
var texture3 : Texture = preload("res://gametextures_v2fold/walltexture1.png");
#sound effect && music
@onready var soundplayer1 : AudioStreamPlayer = AudioStreamPlayer.new();
@onready var soundplayer2 : AudioStreamPlayer = AudioStreamPlayer.new();
@onready var soundplayer3 : AudioStreamPlayer = AudioStreamPlayer.new();
@onready var soundplayer4 : AudioStreamPlayer = AudioStreamPlayer.new();
@onready var soundplayer5 : AudioStreamPlayer = AudioStreamPlayer.new();
##environment player
@onready var soundenvironmentplayer4 : AudioStreamPlayer = AudioStreamPlayer.new();
@onready var soundenvironmentplayer5 : AudioStreamPlayer = AudioStreamPlayer.new();




var soundhd1 = preload("res://hd sfx/helmet/headshot_helmet_1_alt.wav");
var soundhd2 = preload("res://hd sfx/legacy/headshot_flesh_17_old.wav");
var soundhd3 = preload("res://hd sfx/legacy/headshot_flesh_36_old.wav");
var randsound = [soundhd1, soundhd2, soundhd3]






var sound2 = preload("res://soundbase/S_gunshotv2.wav");
var sound3 = preload("res://soundbase/S_uisoundfx.ogg");
var sound4 = preload("res://soundenv/S_roomambient.wav");
var sound5 = preload("res://soundbase/S_uisoundfx.ogg")
var sound6 = preload("res://soundenv/nightambient.mp3");
var sound7 = preload("res://soundSystemFolderGFX/pop.ogg")
@onready var filepath := "user://playerdata.json"
@onready var filepath1 := "user://setting.cfg"
#file time to load
@onready var timerforloading : float = 0.2;
@onready var isthefileneedtoloaded : bool = true;


#Game objects...
@onready var ballmaterial = StandardMaterial3D.new();
@onready var ballshape = SphereMesh.new()
@onready var ballcollisionshape = SphereShape3D.new();
@onready var ballmesh = MeshInstance3D.new();
@onready var ballholder = CharacterBody3D.new();
@onready var ballcollision = CollisionShape3D.new();
@onready var ball2material = StandardMaterial3D.new();
@onready var ball2shape = SphereMesh.new()
@onready var ball2collisionshape = SphereShape3D.new();
@onready var ball2mesh = MeshInstance3D.new();
@onready var ball2holder = CharacterBody3D.new();
@onready var ball2collision = CollisionShape3D.new();
##ball1 & ball2 properties...
@onready var movement_smooth : float = 1.0;
@onready var balldata : Array = [];
@onready var balldata2 : Array = [];
@onready var maxballspawn : int = 3;
@onready var maxballspawn2 : int = 1;
@onready var maxballspawn3 : int = 1;
@onready var isballmax : bool = false;
@onready var isballmax2 : bool = false;
@onready var isballmax3 : bool = false;
@onready var ballcounter : int = 0;
@onready var ballcounter2 : int = 0;
@onready var ballcounter3 : int = 0;
@onready var timer1 : float = 0.001;
@onready var timer2 : float = 0.001;





@onready var smallballmaterial = StandardMaterial3D.new();
@onready var smallballshape = SphereMesh.new()
@onready var smallballcollisionshape = SphereShape3D.new();
@onready var smallballmesh = MeshInstance3D.new();
@onready var smallballholder = CharacterBody3D.new();
@onready var smallballcollision = CollisionShape3D.new();

@onready var smallballcounter : int = 0;
@onready var smallballarray : Array = [];
@onready var issmallballmax : bool = false;
@onready var timerforsmallball : float = 0.001;
@onready var maxsmallball : int = 2;

#movingball
@onready var ballspeed : float = 15.0;
@onready var goingright : bool = false;
@onready var goingleft : bool = false;
@onready var goingstop : bool = false;

#PLAYER NODES...
@onready var headmesh = $player/Head/head_mesh
@onready var flashlight = $player/Head/head_mesh/Camera/flashlight
@onready var playerraycast : RayCast3D = $player/Head/head_mesh/Camera/Detector;
@onready var playerraycast2 : RayCast3D = $player/Head/head_mesh/Camera/Detector2;
#DEBUGGER...
@onready var debugger1 : Label = $Debugger/debug1;
@onready var timedebugsecond : float = 0.0;




##GAME MENU NODES...||||
@onready var GamemenuCanva : CanvasLayer = $Gamemenu;
@onready var ModemenuCanva : CanvasLayer = $Modechooser;
#Gamemode triggers...

@onready var isAI360 : bool = false;
@onready var isflickclicked : bool = false;
@onready var isflickreflexclicked : bool = false;
@onready var ismovingballclicked : bool = false;
@onready var isfreemodeclicked : bool = false;
@onready var issmallballnodeclicked : bool = false;
#controller canva...
@onready var interactbutton : Label = $Controller/interacttext;
@onready var player = $player;
var returnpos = true;
@onready var playercamera : Camera3D = $player/Head/head_mesh/Camera;
@onready var playercontroller : CanvasLayer = $Controller;
@onready var playerhealth : CanvasLayer = $HealthBar;
@onready var forwardbutton : TouchScreenButton = $Controller/forward;
@onready var backbutton : TouchScreenButton = $Controller/back;
@onready var rightbutton : TouchScreenButton = $Controller/right;
@onready var leftbutton : TouchScreenButton = $Controller/left;


#score1 text..
@onready var scorecanvas : CanvasLayer = $Scores;
@onready var flickscore : Label = $Scores/flickscore;
@onready var highestscorelabel : Label = $Gamemenu/HighestScore;
@onready var scorecounter : int = 0;
@onready var highestscore : int = 0;
@onready var isthisthehighscore : bool = false;
#settings node...
@onready var settingcanvas : CanvasLayer = $SettingsCanvas;
@onready var menubutton : CanvasLayer = $OptionThing;
@onready var backmenucanvas : CanvasLayer = $Backmenu;
@onready var shadowbutton : Button = $SettingsCanvas/shadow;
@onready var bloombutton : Button = $SettingsCanvas/bloom;
@onready var fogbutton : Button = $SettingsCanvas/fog;
@onready var fpschangerlineedit : LineEdit = $SettingsCanvas/FpsChanger;
@onready var sensitivitychangerlineedit : LineEdit = $SettingsCanvas/sensitivity;
@onready var fovchangerlineedit : LineEdit = $SettingsCanvas/fieldofview;
@onready var AttributesText : Label = $Gamemenu/AtrributesText;
@onready var VersionText : Label = $Gamemenu/VersionText;
@onready var CopyrightText : Label = $Gamemenu/CopyrightText;
@onready var isshadowbuttonpressed : bool = false;
@onready var isbloombuttonpressed : bool = false;
@onready var isfogbuttonpressed : bool = false;
@onready var backsettingsmenubutton : Button = $SettingsCanvas/backmenu;
@onready var mainbacksettings : Button = $SettingsCanvas/settingback;
##chest inv canvas 
@onready var chestcanva : CanvasLayer = $Chest;
##AI CONFIGS HERE..
@onready var jumpingpower : float = 4.0;
@onready var isbrojumping : bool = false;
@onready var G = 9.8;
@onready var isAIgoingright : bool = false;
@onready var isAIgoingleft : bool = false;
@onready var isAIneedtomove : bool = false;
@onready var angle : float = 90.0;
@onready var AIrotation_speed : float = 1.0;
@onready var AIradius : float = 4.0;
@onready var gainscore : bool = false;


##ALL THING HERE instatior..
##daynightcycle fields...
@onready var timerforthisshit : float = 0.0;
@onready var lightvalueminuser : float = 0.0010; #0.0010
@onready var rotationspeed : float = 0.0010;
@onready var activenight : bool = false;
@onready var activeday : bool = false;


#console
@onready var backconsolebutton : Button = $debugloader/closebuttonconsole;

@onready var debugcanvas : CanvasLayer = $debugloader
@onready var debugconsole : Label = $debugloader/console1;
@onready var debugconsole2 : Label = $debugloader/console2;
@onready var debugconsole3 : Label = $debugloader/console3;
@onready var debugconsole4 : Label = $debugloader/console4;
@onready var debugconsole5 : Label = $debugloader/console5;
@onready var debugconsole6 : Label = $debugloader/console6;
@onready var debugconsole7 : Label = $debugloader/console7;
@onready var debugconsole8 : Label = $debugloader/console8;
@onready var debugconsole9 : Label = $debugloader/console9;
@onready var debugconsole10 : Label = $debugloader/console10;
@onready var debugconsole11 : Label = $debugloader/console11;
@onready var debugconsole12 : Label = $debugloader/console12;
@onready var debugconsole13 : Label = $debugloader/console13;
@onready var debugconsole14 : Label = $debugloader/console14;
@onready var debugconsole15 : Label = $debugloader/console15;


##setting cfg 
var fpsresult : int = 60;
var sensitiveresult : float = 1.0;


#gamemode CFGS
@onready var modetimerlabel : Label = $Scores/timermodes;
var timerpermodes : float = 60.0;
var isthemodestarts : bool = false;


var color1 = Color(0.0, 1.0, 0.0, 1.0);
var color2 = Color(1.0, 0.501, 0.434, 1.0);
var color3 = Color(1.0, 0.757, 0.0, 1.0);
var randomcolor : Array = [color1,
color2,
color3
]
@onready var rewardcanva = $rewardcanva;
@onready var info1 = $rewardcanva/info1
@onready var info2 = $rewardcanva/info2

#text speeches below 0 score
var speech1_score0 = "AFK?";
var speech2_score0 = "Quit!";
var speech3_score0 = "Why Are You Still Here?";
var speech4_score0 = "Play Minecraft!"
var chooserandomspeechscore0 : Array = [speech1_score0, speech2_score0, speech3_score0, speech4_score0];
#text speech below 10 score



var look_timer_target : float = 0.2;
var soundifthetimerisfivesecondsonly : float = 1.0;




var isthegameneedtoplay1 : bool = false
var isthegameneedtoplay2 : bool = false


var addvolume : float = 0.0;
@onready var rank = $Gamemenu/ranklable
var scorelistener : int = 0;







#BASE TERRAIN ENVIRONMENT...
#roof
@onready var roofmaterial = StandardMaterial3D.new();
@onready var roofshape = BoxMesh.new()
@onready var roofcollisionshape = BoxShape3D.new();
@onready var roofmesh = MeshInstance3D.new();
@onready var roofholder = CharacterBody3D.new();
@onready var roofcollision = CollisionShape3D.new();










#environment...
@onready var worldenvironment : Environment = Environment.new();
@onready var sun : DirectionalLight3D = DirectionalLight3D.new();
@onready var sky : WorldEnvironment = WorldEnvironment.new();
@onready var skytype : Sky = Sky.new();
@onready var skymaterial : ProceduralSkyMaterial = ProceduralSkyMaterial.new();
#terrain
@onready var terrainmaterial = StandardMaterial3D.new();
@onready var terrainshape = BoxMesh.new()
@onready var terraincollisionshape = BoxShape3D.new();
@onready var terrainmesh = MeshInstance3D.new();
@onready var terrainholder = CharacterBody3D.new();
@onready var terraincollision = CollisionShape3D.new();
# wall1
@onready var wall1material = StandardMaterial3D.new();
@onready var wall1shape = BoxMesh.new()
@onready var wall1collisionshape = BoxShape3D.new();
@onready var wall1mesh = MeshInstance3D.new();
@onready var wall1holder = CharacterBody3D.new();
@onready var wall1collision = CollisionShape3D.new();
# wall2
@onready var wall2material = StandardMaterial3D.new();
@onready var wall2shape = BoxMesh.new()
@onready var wall2collisionshape = BoxShape3D.new();
@onready var wall2mesh = MeshInstance3D.new();
@onready var wall2holder = CharacterBody3D.new();
@onready var wall2collision = CollisionShape3D.new();
# wall3
@onready var wall3material = StandardMaterial3D.new();
@onready var wall3shape = BoxMesh.new()
@onready var wall3collisionshape = BoxShape3D.new();
@onready var wall3mesh = MeshInstance3D.new();
@onready var wall3holder = CharacterBody3D.new();
@onready var wall3collision = CollisionShape3D.new();
# wall4
@onready var wall4material = StandardMaterial3D.new();
@onready var wall4shape = BoxMesh.new()
@onready var wall4collisionshape = BoxShape3D.new();
@onready var wall4mesh = MeshInstance3D.new();
@onready var wall4holder = CharacterBody3D.new();
@onready var wall4collision = CollisionShape3D.new();
#roomwall
@onready var roomwall1material = StandardMaterial3D.new();
@onready var roomwall1shape = BoxMesh.new()
@onready var roomwall1collisionshape = BoxShape3D.new();
@onready var roomwall1mesh = MeshInstance3D.new();
@onready var roomwall1holder = CharacterBody3D.new();
@onready var roomwall1collision = CollisionShape3D.new();
#roof1
@onready var roof1material = StandardMaterial3D.new();
@onready var roof1shape = BoxMesh.new()
@onready var roof1collisionshape = BoxShape3D.new();
@onready var roof1mesh = MeshInstance3D.new();
@onready var roof1holder = CharacterBody3D.new();
@onready var roof1collision = CollisionShape3D.new();
##AI BODY HERE...
@onready var AI1material = StandardMaterial3D.new();
@onready var AI1shape = CapsuleMesh.new()
@onready var AI1collisionshape = CapsuleShape3D.new();
@onready var AI1mesh = MeshInstance3D.new();
@onready var AI1holder = CharacterBody3D.new();
@onready var AI1collision = CollisionShape3D.new();






##BULLETTTTTTTTTT RARRRRRRREKKSDKKDKD
#bullet Fcking shit...(hard thing)
@onready var bulletarrayfinalshit : Array = [];
@onready var bulletcountershit : int = 0;
@onready var bulletspeedcountershit : int = 0;
@onready var ishowbulletspeed : int = 300;
@onready var isbrofiringthisfckinggun : bool = false;
@onready var firedbullet : bool = false;
@onready var directionshouldntchange : bool = false;
@onready var bulletmesh = MeshInstance3D.new();
@onready var bulletholder = CharacterBody3D.new();
@onready var bulletmaterial = StandardMaterial3D.new();
@onready var bulletshape = SphereMesh.new();
#bullethole 
@onready var bulletholemesh = MeshInstance3D.new();
@onready var bulletholeholder = CharacterBody3D.new();
@onready var bulletholematerial = StandardMaterial3D.new();
@onready var bulletholeshape = SphereMesh.new()
@onready var bulletholearray : Array = [];






##light 1 class.......///
@onready var directionallight1 : OmniLight3D = OmniLight3D.new();
#bulb mesh
@onready var light1material = StandardMaterial3D.new();
@onready var light1shape = BoxMesh.new()
@onready var light1collisionshape = BoxShape3D.new();
@onready var light1mesh = MeshInstance3D.new();
@onready var light1holder = CharacterBody3D.new();
@onready var light1collision = CollisionShape3D.new();
##end...///
#Chest...///
@onready var chestmaterial = StandardMaterial3D.new();
@onready var chestshape = BoxMesh.new()
@onready var chestcollisionshape = BoxShape3D.new();
@onready var chestmesh = MeshInstance3D.new();
@onready var chestholder = CharacterBody3D.new();
@onready var chestcollision = CollisionShape3D.new();
##object1
@onready var obj1material = StandardMaterial3D.new();
@onready var obj1shape = BoxMesh.new()
@onready var obj1collisionshape = BoxShape3D.new();
@onready var obj1mesh = MeshInstance3D.new();
@onready var obj1holder = CharacterBody3D.new();
@onready var obj1collision = CollisionShape3D.new();


#particlegpu
@onready var mainparticle1 : GPUParticles3D = GPUParticles3D.new();


##thimg configuration
var terrainYsize : float = 1.0;








##THIS PART OF THE CODE IS INSTIATING THING SO PLEASE DONT REM9VE IT THIS IS BODY OF THE GAME!!!!!! :D
func setroof():
	var roofpos = Vector3(-0.0, 10.0, -271.0);
	var roofsize = Vector3(400.0, 1.0, 500.0);
	roofmesh.mesh = roofshape;
	roofmaterial.normal_enabled = true
	roofmaterial.normal_scale = 0.7
	roofmaterial.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	roofmesh.global_position = roofpos;
	roofshape.size = roofsize;
	roofshape.material = roofmaterial;

	roofmaterial.roughness = 0.3
	roofmaterial.albedo_texture = texture2;
	roofmaterial.uv1_scale = Vector3(500.0, 500.0, 580.0);
	roofmaterial.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST_WITH_MIPMAPS;
	roofcollision.shape = roofcollisionshape;
	roofcollision.scale = roofsize;
	roofcollision.position = roofpos;
	add_child(roofholder);
	roofholder.add_child(roofmesh);
	roofholder.add_child(roofcollision);










func setlight1():
	directionallight1.hide();
	directionallight1.omni_range = 200.0;
	directionallight1.light_color = Color(1.0, 1.0, 1.0, 1.0);
	directionallight1.light_energy = 50.0;
	directionallight1.shadow_enabled = true;
	directionallight1.omni_shadow_mode = OmniLight3D.SHADOW_CUBE
	directionallight1.global_position = Vector3(18.0, 8.0, -18.0);
	add_child(directionallight1);
func setterrain():
	var terrainpos = Vector3(0.0, 1.0, 0.0);
	var terrainsize = Vector3(80.0, terrainYsize, 80.0);
	terrainholder.global_position = terrainpos
	terrainmesh.mesh = terrainshape;
	terrainshape.size = terrainsize;
	terrainshape.material = terrainmaterial;
	terrainmaterial.albedo_texture = texture1;
	terrainmaterial.normal_enabled = true;
	terrainmaterial.normal_scale = 1.8
	terrainmaterial.normal_texture = preload("res://Normal craver/12347-normal.jpg")
	terrainmaterial.roughness_texture = preload("res://Normal craver/12347-normal.jpg")
	terrainmaterial.roughness = 0.4
	terrainmaterial.uv1_scale = Vector3(30.0, 30.0, 1.0);
	terrainmaterial.texture_filter = BaseMaterial3D.TEXTURE_FILTER_LINEAR;
	terraincollision.shape = terraincollisionshape;
	terraincollision.scale = terrainsize;
	add_child(terrainholder);
	terrainholder.add_child(terrainmesh);
	terrainholder.add_child(terraincollision);
func setwall1():
	var wall1pos = Vector3(0.0, 20.5, -5.5);
	var wall1size = Vector3(40.0, 1.0, 10.0);
	wall1holder.rotation_degrees = Vector3(90.0, 0.0, 0.0);
	wall1mesh.mesh = wall1shape;
	wall1mesh.global_position = wall1pos;
	wall1shape.size = wall1size;
	wall1shape.material = wall1material;
	wall1material.albedo_texture = texture2;
	wall1material.uv1_scale = Vector3(40.0, 5.0, 40.0);
	wall1material.roughness_texture = preload("res://Normal craver/12347-normal.jpg")
	wall1material.roughness = 0.3
	wall1material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	wall1material.normal_enabled = true
	wall1material.normal_texture = preload("res://Normal craver/12347-normal.jpg")
	wall1material.normal_scale = 0.7
	wall1collision.shape = wall1collisionshape;
	wall1collision.scale = wall1size;
	wall1collision.position = wall1pos;
	add_child(wall1holder);
	wall1holder.add_child(wall1mesh);
	wall1holder.add_child(wall1collision);
func setwall2():
	var wall2pos = Vector3(0.0, -20.5, -5.5);
	var wall2size = Vector3(40.0, 1.0, 10.0);
	wall2material.normal_enabled = true
	wall2material.normal_scale = 0.7
	wall2material.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	wall2holder.rotation_degrees = Vector3(90.0, 0.0, 0.0);
	wall2mesh.mesh = wall2shape;
	wall2mesh.global_position = wall2pos;
	wall2shape.size = wall2size;
	wall2shape.material = wall2material;
	wall2material.roughness = 0.3
	wall2material.albedo_texture = texture2;
	wall2material.uv1_scale = Vector3(40.0, 5.0, 40.0);
	wall2material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	wall2collision.shape = wall2collisionshape;
	wall2collision.scale = wall2size;
	wall2collision.position = wall2pos;
	add_child(wall2holder);
	wall2holder.add_child(wall2mesh);
	wall2holder.add_child(wall2collision);
func setwall3():
	var wall3pos = Vector3(5.5, 20.5, 0.0);
	var wall3size = Vector3(10.0, 1.0, 40.0);
	wall3material.normal_enabled = true
	wall3material.normal_scale = 0.7
	wall3material.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	wall3holder.rotation_degrees = Vector3(0.0, 0.0, 90.0);
	wall3mesh.mesh = wall3shape;
	wall3mesh.global_position = wall3pos;
	wall3material.roughness = 0.3
	wall3shape.size = wall3size;
	wall3shape.material = wall3material;
	wall3material.albedo_texture = texture2;
	wall3material.uv1_scale = Vector3i(5.0, 40.0, 40.0);
	wall3material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	wall3collision.shape = wall2collisionshape;
	wall3collision.scale = wall3size;
	wall3collision.position = wall3pos;
	add_child(wall3holder);
	wall3holder.add_child(wall3mesh);
	wall3holder.add_child(wall3collision);
func setwall4():
	var wall4pos = Vector3(5.5, -20.5, 0.0);
	var wall4size = Vector3(10.0, 1.0, 40.0);
	wall4holder.rotation_degrees = Vector3(0.0, 0.0, 90.0);
	wall4mesh.mesh = wall4shape;
	wall4mesh.global_position = wall4pos;
	wall4shape.size = wall4size;
	wall4shape.material = wall4material;
	wall4material.roughness = 0.3
	wall4material.albedo_texture = texture2;
	wall4material.uv1_scale = Vector3(5.5, 30.0, 30.0);
	wall4material.normal_enabled = true
	wall4material.normal_scale = 0.7
	wall4material.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	wall4material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	wall4collision.shape = wall4collisionshape;
	wall4collision.scale = wall4size;
	wall4collision.position = wall4pos;
	add_child(wall4holder);
	wall4holder.add_child(wall4mesh);
	wall4holder.add_child(wall4collision);
func setroomwall1():
	var roomwall1pos = Vector3(5.75, 9.5, -5);
	var roomwall1size = Vector3(9.5, 1.0, 30.5);
	roomwall1holder.rotation_degrees = Vector3(0.0, 0.0, 90.0);
	roomwall1mesh.mesh = roomwall1shape;
	roomwall1mesh.global_position = roomwall1pos;
	roomwall1shape.size = roomwall1size;
	roomwall1shape.material = roomwall1material;
	roomwall1material.albedo_texture = texture2;
	roomwall1material.roughness = 0.3;
	roomwall1material.uv1_scale = Vector3(5.5, 30.0, 30.0);
	roomwall1material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	roomwall1collision.shape = roomwall1collisionshape;
	roomwall1collision.scale = roomwall1size;
	roomwall1material.normal_enabled = true
	roomwall1material.normal_scale = 0.7
	roomwall1material.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	roomwall1collision.position = roomwall1pos;
	add_child(roomwall1holder);
	roomwall1holder.add_child(roomwall1mesh);
	roomwall1holder.add_child(roomwall1collision);
func setroof1():
	var roof1pos = Vector3(16.0, 9.8, 0.0);
	var roof1size = Vector3(8.5, 1.5, 40.0);
	roof1material.normal_enabled = true
	roof1material.normal_scale = 0.7
	roof1material.normal_texture =  preload("res://Normal craver/12347-normal.jpg")
	roof1holder.rotation_degrees = Vector3(0.0, 0.0, 360.0);
	roof1mesh.mesh = roof1shape;
	roof1mesh.global_position = roof1pos;
	roof1shape.size = roof1size;
	roof1shape.material = roof1material;
	roof1material.albedo_texture = texture3;
	roof1material.uv1_scale = Vector3(5.0, 30.0, 30.0);
	roof1material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST
	roof1material.roughness = 0.3;
	roof1collision.shape = roof1collisionshape;
	roof1collision.scale = roof1size;
	roof1collision.position = roof1pos;
	add_child(roof1holder);
	roof1holder.add_child(roof1mesh);
	roof1holder.add_child(roof1collision);

func setlightbulbmesh1():
	var lightbulb1pos = Vector3(20.0, 8.0, -18.0);
	var lightbulb1size = Vector3(0.5, 0.5, 0.5);
	light1mesh.mesh = light1shape;
	light1mesh.global_position = lightbulb1pos;
	light1shape.size = lightbulb1size;
	light1shape.material = light1material;
	light1material.emission_energy_multiplier = 100.0;
	light1material.albedo_color = Color(1.0, 1.0, 1.0, 1.0)
	light1material.emission = Color(18.047, 18.047, 18.047, 1.0);;
	light1material.roughness = 0.2;
	#light1material.shading_mode = BaseMaterial3D.SHADING_MODE_UNSHADED;
	light1material.uv1_scale = Vector3(20.0, 70.0, 20.0);
	light1material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST;
	light1collision.shape = light1collisionshape;
	light1collision.scale = lightbulb1size;
	light1collision.position = lightbulb1pos;
	add_child(light1holder);
	light1holder.add_child(light1mesh);
	light1holder.add_child(light1collision);
func setobj1():
	var chestpos = Vector3(-11, 2.0, -19.5);
	var chestsize = Vector3(2.0, 1.0, 1.0);
	chestmesh.mesh = chestshape;
	chestmesh.global_position = chestpos;
	chestshape.size = chestsize;
	chestshape.material = chestmaterial;
	chestmaterial.albedo_color = Color(0.486, 0.272, 0.022, 1.0);;
	chestmaterial.uv1_scale = Vector3(20.0, 70.0, 20.0);
	chestmaterial.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST;
	chestcollision.shape = chestcollisionshape;
	chestcollision.scale = chestsize;
	chestcollision.position = chestpos;
	add_child(chestholder);
	chestholder.add_child(chestmesh);
	chestholder.add_child(chestcollision);
func setobj1designedonly():
	var obj1pos = Vector3(-17, 2.0, -19.5);
	var obj1size = Vector3(2.0, 1.0, 1.0);
	obj1mesh.mesh = obj1shape;
	obj1mesh.global_position = obj1pos;
	obj1shape.size = obj1size;
	obj1shape.material = obj1material;
	obj1material.albedo_color = Color(0.486, 0.272, 0.022, 1.0);;
	obj1material.uv1_scale = Vector3(20.0, 70.0, 20.0);
	obj1material.texture_filter = BaseMaterial3D.TEXTURE_FILTER_NEAREST;
	obj1collision.shape = obj1collisionshape;
	obj1collision.scale = obj1size;
	obj1collision.position = obj1pos;
	add_child(obj1holder);
	obj1holder.add_child(obj1mesh);
	obj1holder.add_child(obj1collision);
func SetSun():
	sun.directional_shadow_max_distance = 100.0
	sun.rotation_degrees = Vector3(-150.0, 0.0, 0.0); ##change it
	sun.light_energy = 1.0;
	sun.directional_shadow_mode = DirectionalLight3D.SHADOW_ORTHOGONAL;
	
	add_child(sun);
func SetEnvironment():
	worldenvironment.fog_light_color = Color(0.827, 0.827, 0.827, 1.0);
	worldenvironment.fog_density = 0.07;
	worldenvironment.fog_depth_begin = 10.0
	worldenvironment.tonemap_mode = Environment.TONE_MAPPER_REINHARDT
	
	sky.environment = worldenvironment
	worldenvironment.background_mode = Environment.BG_SKY
	worldenvironment.sky = skytype
	skytype.sky_material = skymaterial
	worldenvironment.adjustment_saturation = 1.0
	worldenvironment.adjustment_contrast = 1.2
	worldenvironment.adjustment_enabled = true;
	worldenvironment.glow_blend_mode = Environment.GLOW_BLEND_MODE_SCREEN
	worldenvironment.glow_intensity = 1.0;
	worldenvironment.glow_strength = 0.8
	worldenvironment.glow_bloom = 0.3
	skymaterial.sun_angle_max = 10.0
	skymaterial.sun_curve = 0.5
	skymaterial.sky_top_color = Color(0.0, 0.463, 0.92, 1.0)
	skymaterial.sky_horizon_color = Color(0.70, 0.78, 0.85)
	skymaterial.ground_horizon_color = Color(0.75, 0.78, 0.80)
	skymaterial.ground_bottom_color = Color(0.55, 0.60, 0.65)
	worldenvironment.background_color = Color(0.70, 0.80, 0.90)
	worldenvironment.ambient_light_source = Environment.AMBIENT_SOURCE_COLOR
	worldenvironment.ambient_light_color = Color(0.822, 0.911, 1.0, 1.0)
	worldenvironment.ambient_light_energy = 1.0
	worldenvironment.ambient_light_sky_contribution = 0.0

	add_child(sky)
func setbulletthing():
	bulletholder.position = Vector3(0.0, -22.0, 0.0);
	bulletshape.material = bulletmaterial;
	bulletmaterial.emission_enabled = true;
	bulletshape.radius = 0.03;
	bulletshape.height = 0.1;
	bulletmaterial.emission = Color(1.0, 1.0, 0.3, 1.0);
	bulletmaterial.emission_energy_multiplier = 5.0;
	bulletmaterial.emission_intensity = 2.0;
	bulletmaterial.albedo_color = Color(1.0, 1.0, 0.3, 1.0);
	bulletmesh.mesh = bulletshape;
	add_child(bulletholder);
	bulletholder.add_child(bulletmesh);
func setbullettholehing():
	bulletholeholder.position = Vector3(0.0, -20.0, 4.0);
	bulletholeshape.material = bulletholematerial;
	bulletholematerial.emission_enabled = true;
	bulletholeholder.scale = Vector3(0.2,0.2,0.2);

	bulletholematerial.emission = Color(1.0, 0.0, 0.0, 1.0);
	bulletholematerial.emission_energy_multiplier = 5.0;
	bulletholematerial.emission_intensity = 2.0;
	bulletholematerial.albedo_color = Color(0.0, 1.0, 0.0, 1.0);
	bulletholemesh.mesh = bulletholeshape;
	add_child(bulletholeholder);
	bulletholeholder.add_child(bulletholemesh);
func ball():
	var ballpos = Vector3(0.0, 0.0, 0.0);
	var ballsize = Vector3(1.0, 1.0, 1.0);
	ballholder.rotation_degrees = Vector3(0.0, 0.0, 0.0);
	ballmesh.mesh = ballshape;
	ballmesh.position = ballpos;
	ballshape.material = ballmaterial;
	ballmaterial.albedo_color = Color(1.0, 0.0, 0.0, 1.0);
	ballmaterial.emission_enabled = true;
	ballmaterial.emission_energy_multiplier = 10.0;
	ballmaterial.emission =Color(1.0, 0.0, 0.0, 1.0); 
	ballcollision.shape = ballcollisionshape;
	ballcollision.scale = ballsize;
	ballcollision.position = ballpos;
	add_child(ballholder);
	ballholder.add_child(ballmesh);
	ballholder.add_child(ballcollision);
func ball2():
	var ball2pos = Vector3(0.0, 0.0, 0.0);
	var ball2size = Vector3(1.0, 1.0, 1.0);
	ball2holder.rotation_degrees = Vector3(0.0, 0.0, 0.0);
	ball2mesh.mesh = ballshape;
	ball2mesh.position = ball2pos;
	ball2shape.material = ball2material;
	ball2material.albedo_color = Color(1.0, 0.0, 0.0, 1.0);
	ball2material.emission_enabled = true;
	ball2material.emission_energy_multiplier = 4.0;
	ball2material.emission =Color(1.0, 0.0, 0.0, 1.0); 
	ball2collision.shape = ball2collisionshape;
	ball2collision.scale = ball2size;
	ball2collision.position = ball2pos;
	add_child(ball2holder);
	ball2holder.add_child(ball2mesh);
	ball2holder.add_child(ball2collision);
func smallball():
	var smallballpos = Vector3(0.0, 0.0, 0.0);
	var smallballsize = Vector3(1.0, 1.0, 1.0);
	smallballholder.scale = smallballsize
	smallballholder.rotation_degrees = Vector3(0.0, 0.0, 0.0);
	smallballmesh.mesh = smallballshape;
	smallballmesh.position = smallballpos;
	smallballshape.material = ballmaterial;
	smallballmaterial.albedo_color = Color(1.0, 0.0, 0.0, 1.0);
	smallballmaterial.emission_enabled = true;
	smallballmaterial.emission_energy_multiplier = 4.0;
	smallballmaterial.emission =Color(1.0, 0.0, 0.0, 1.0); 
	smallballcollision.shape = smallballcollisionshape;
	smallballcollision.scale = smallballsize;
	smallballcollision.position = smallballpos;
	add_child(smallballholder);
	smallballholder.add_child(smallballmesh);
	smallballholder.add_child(smallballcollision);
func setAIbody():
	var AI1pos = Vector3(0.0, 1.5, 8.0);
	var AI1size = Vector3(3, 3, 50);
	AI1shape.radius = 0.3;
	AI1collisionshape.radius = 0.3;
	AI1holder.scale = AI1size;
	AI1holder.global_position = AI1pos;
	AI1mesh.mesh = AI1shape;
	AI1shape.material = AI1material;
	AI1material.albedo_color = Color(0.0, 0.0, 1.0, 1.0);
	AI1collision.shape = AI1collisionshape;
	add_child(AI1holder);
	AI1holder.add_child(AI1mesh);
	AI1holder.add_child(AI1collision);






##ALL LOGICS HERE THIS PART OF CODE IS HEART SO DONT TOUCH IT!!!
##ALLL LOGICS HERE NO MORE SHIT JUST BE CLEAN🥀...//////(#*@(@(@(@(@...
## time to copy this for template
##bruh i use a.i again dude 😡😡😡 i hate my self so much atleast 97.0% of this are made by me slightly guilt feeling 
# i missed things thats why i ask a.i
#- set_meta and get_meta
#- look_at() function
#i learned This thing :(
@onready var uspgun = $player/Head/head_mesh/Camera/uspgun
func bulletgo():
	if isbrofiringthisfckinggun:
		var dupbullet = bulletholder.duplicate();
		bulletcountershit += 1;
		if bulletcountershit >= 1:
			bulletcountershit = 0;
			isbrofiringthisfckinggun = false;
			directionshouldntchange = true;
			firedbullet = true;
			dupbullet.position = player.position;
			dupbullet.set_meta("direction", -playercamera.global_transform.basis.z);
			bulletarrayfinalshit.append(dupbullet);
			add_child(dupbullet);
# bullet run...
func bulletshitgoestorun():
	if firedbullet:
		for i in range(bulletarrayfinalshit.size() - 1, -1, -1):
			var bullet = bulletarrayfinalshit[i]
			if not is_instance_valid(bullet):
				bulletarrayfinalshit.erase(i);
				continue;
			bulletspeedcountershit += ishowbulletspeed;
			bullet.look_at(bullet.position + bullet.get_meta("direction"), Vector3(0.0, 1.0, 0.0));
			bullet.velocity = bullet.get_meta("direction") * ishowbulletspeed;
			bullet.move_and_slide();
#delete bullets
func deletebulletsaftertimes():
	while true:
		await get_tree().create_timer(8).timeout
		for i in range(bulletarrayfinalshit.size() - 1, -1, -1):
			var bullet = bulletarrayfinalshit[i]
			if is_instance_valid(bullet):
				bullet.queue_free()
			bulletarrayfinalshit.remove_at(i)
		for i in range(bulletholearray.size() - 1, -1, -1):
			var hole = bulletholearray[i]
			if is_instance_valid(hole):
				hole.queue_free()
			bulletholearray.remove_at(i)

#bullet hole
func spawnassholes():
		var pos = playerraycast.get_collision_point();
		var dupbullethole = bulletholeholder.duplicate();
		dupbullethole.position = pos;
		bulletholearray.append(dupbullethole);
		add_child(dupbullethole);





#MODES LOGIC HERE
func freemode1():
	if isfreemodeclicked:
		pass;
func balllogic():
	if isflickclicked:
		var randf_spawn = Vector3(randi_range(-6, 6), randi_range(2, 6), 18);
		if isballmax == false:
			var balldup = ballholder.duplicate();
			balldup.global_position = randf_spawn;
			ballcounter += 1;
			add_child(balldup);
			balldata.append(balldup);
		if ballcounter > maxballspawn:
			isballmax = true;
		if ballcounter < maxballspawn:
			isballmax = false;
func ball2logic():
	if isflickreflexclicked:
		var randf_spawn = Vector3(randi_range(-5, 5), randi_range(2, 7), 18);
		if isballmax2 == false:
			var balldup = ballholder.duplicate();
			balldup.global_position = randf_spawn;
			ballcounter2 += 1;
			add_child(balldup);
			balldata.append(balldup);
		if ballcounter2 > maxballspawn2:
			isballmax2 = true;
		if ballcounter2 < maxballspawn2:
			isballmax2 = false;

func ball3logic():
	if ismovingballclicked:
		var randf_spawn = Vector3(randi_range(-5, 5), randi_range(4, 4), 18);
		if isballmax3 == false:
			var balldup = ball2holder.duplicate();
			balldup.global_position = randf_spawn;
			ballcounter3 += 1;
			add_child(balldup);
			balldata2.append(balldup);
		if ballcounter3 > maxballspawn3:
			isballmax3 = true;
		if ballcounter3 < maxballspawn3:
			isballmax3 = false;
func smallballlogic():
	if issmallballnodeclicked:
		var randf_spawn = Vector3(randf_range(-5.0, 5.0), randf_range(2.0, 6.0), 18.0);
		if issmallballmax == false:
			var smallballdup = smallballholder.duplicate();
			smallballdup.global_position = randf_spawn;
			smallballdup.scale = Vector3(0.5, 0.5, 0.5);
			smallballcounter += 1;
			add_child(smallballdup);
			smallballarray.append(smallballdup);
		if smallballcounter > maxsmallball:
			issmallballmax = true;
		if smallballcounter < maxsmallball:
			issmallballmax = false;

func removeball():
	spawnassholes();
	isbrofiringthisfckinggun = true
	if playerraycast.is_colliding():
		var raycastcollider = playerraycast.get_collider();
		for balls in balldata:
			if raycastcollider == balls:
				balldata.erase(balls);
				raycastcollider.queue_free();
				playersoundplayer1();
				ballcounter -= 1;
				ballcounter2 -= 1;
				scorecounter += 1;
				usemainparticle1();
				highestscorelogic();
func smallballremove():
	if playerraycast.is_colliding():
		for ballsmall in smallballarray:
			var collider = playerraycast.get_collider();
			if collider == ballsmall:
				smallballcounter -= 1;
				scorecounter += 1;
				smallballarray.erase(ballsmall);
				collider.queue_free();
				playersoundplayer1();
				highestscorelogic();
				usemainparticle1();








func lookatball2challenge(delta):
	if playerraycast.is_colliding():
		for ballsbro2 in balldata2:
			var getcollidder = playerraycast.get_collider();
			if getcollidder == ballsbro2:
				look_timer_target -= delta
				if look_timer_target <= 0.0:
					scorecounter += randi_range(1, 3)
					playsound6sfx()
					highestscorelogic();
					look_timer_target = 0.2;

#learned lerp i love lerp so much i need to learn more deeply bout this lerp();
func moveball(delta):
	for balls2 in balldata2:
		if goingright:
			balls2.velocity.x = lerp(balls2.velocity.x, ballspeed, delta * movement_smooth);
		if goingleft:
			balls2.velocity.x = lerp(balls2.velocity.x, -ballspeed, delta * movement_smooth);
		if goingstop:
			balls2.velocity.x = lerp(balls2.velocity.x, 0.0, delta * movement_smooth);
		if balls2.position.x < -8.0:
			balls2.position.x = -8.0;
			goingright = true;
			goingleft = false;
			goingstop = false;
		if balls2.position.x > 8.0:
			balls2.position.x = 8.0;
			goingright = false;
			goingleft = true;
			goingstop = false;
		balls2.move_and_slide();
func choosewheretomove():
	while true:
		await get_tree().create_timer(0.50).timeout;
		var choose = randi() % 3;
		if choose == 0:
			goingright = false;
			goingleft = false;
			goingstop = true;
		if choose == 1:
			goingstop = false;
			goingright = true;
			goingleft = false;
		if choose == 2:
			goingstop = false;
			goingright = false;
			goingleft = true;
func AIphysics(delta):
	if not AI1holder.is_on_floor():
			AI1holder.velocity.y -= G * delta;
	AI1holder.move_and_slide();
func AIconfigs():
	AI1holder.hide();
func AIlogic1():
	if isAI360:
		AI1holder.show();
func followplayer(delta):
	if isAIneedtomove:
		if isbrojumping and AI1holder.is_on_floor():
			AI1holder.velocity.y = jumpingpower;
		if AI1holder.global_position.y < -30.0:
			AI1holder.global_position = Vector3(0.0, 3.0, -20.0);
		if isAIgoingright:
			angle += AIrotation_speed * delta;
		if isAIgoingleft:
			angle -= AIrotation_speed * delta;
		var x = player.position.x + cos(angle) * AIradius;
		var z = player.position.z + sin(angle) * AIradius;
		AI1holder.position = Vector3(x, AI1holder.position.y, z);
		AI1holder.move_and_slide()
func chooseAIpath():
	while true:
		await get_tree().create_timer(1.0).timeout;
		var randomChoose = randi() % 2;
		if randomChoose == 0:
			isAIgoingright = true;
			isAIgoingleft = false;
		if randomChoose == 1:
			isAIgoingright = false;
			isAIgoingleft = true;
func AIjumping():
	while true:
		await get_tree().create_timer(2.0).timeout;
		var randomChoose = randi() % 2;
		if randomChoose == 0:
			isbrojumping = true;
		if randomChoose == 1:
			isbrojumping = false;
func LookatAI(delta):
	if gainscore:
		if playerraycast.is_colliding():
			var getcollidder = playerraycast.get_collider();
			if getcollidder == AI1holder:
				look_timer_target -= delta
				if look_timer_target <= 0.0:
					scorecounter += randi_range(1, 3);
					playsound6sfx()
					highestscorelogic();
					look_timer_target = 0.2;





func openchest():
	if playerraycast2.is_colliding():
		var chestcollider = playerraycast2.get_collider();
		if chestcollider == chestholder:
			chestcanva.show();
##daynightcycle...
# maunal hardcoded cod lol 
func update_sun(delta):
	sun.rotate_x(-rotationspeed * delta)
func night():
	if sun.rotation_degrees.x >= 0:
		worldenvironment.fog_light_energy -= lightvalueminuser
		sun.light_energy -= lightvalueminuser;
		worldenvironment.ambient_light_energy -= lightvalueminuser;
		worldenvironment.background_energy_multiplier -= lightvalueminuser;
		if sun.light_energy <= 0.08:
			worldenvironment.fog_light_energy = 0.08
			worldenvironment.ambient_light_energy = 0.08
			sun.light_energy = 0.08
			worldenvironment.background_energy_multiplier = 0.08
		if sun.light_energy <= 0.7:
			addvolume += 0.008;
			soundenvironmentplayer5.volume_db = addvolume;
		if addvolume >= 15.0:
			addvolume = 15.0;
			soundenvironmentplayer5.volume_db = addvolume;
		if sun.light_energy <= 0.5:
			directionallight1.show()
			return
			flashlight.show();
func day():
	if sun.rotation_degrees.x <= 0.0:
		worldenvironment.fog_light_energy += lightvalueminuser
		sun.light_energy += lightvalueminuser;
		worldenvironment.ambient_light_energy += lightvalueminuser;
		worldenvironment.background_energy_multiplier += lightvalueminuser;
		if sun.light_energy >= 1.0:
			worldenvironment.fog_light_energy = 1.0
			sun.light_energy = 1.0;
			worldenvironment.ambient_light_energy = 1.0
			worldenvironment.background_energy_multiplier = 1.0;
		if sun.light_energy >= 0.2:
			addvolume -= 0.03;
			soundenvironmentplayer5.volume_db = addvolume;
		if addvolume <= -20.0:
			addvolume = -20.0;
			soundenvironmentplayer5.volume_db = addvolume;
		if sun.light_energy >= 0.7:
			directionallight1.hide()
			return
			flashlight.hide();
func MAINTIMERdebug(delta):
	timedebugsecond += delta;
func debugger():
	debugger1.text = str("debug:", "\n", "timer: ", timedebugsecond,
	"\n", "pos: ", " x: ", int(player.position.x), " y: ", int(player.position.y), " z: ", int(player.position.z));
func modetimer(delta):
	if isthemodestarts:
		timerpermodes -= delta
		modetimerlabel.text = str("Time: ", int(timerpermodes));
		if timerpermodes <= 10.0:
			soundifthetimerisfivesecondsonly -= delta;
			if soundifthetimerisfivesecondsonly <= 0.0:
				soundplayer4.play();
				soundifthetimerisfivesecondsonly = 1.0;
		if timerpermodes <= 0.0:
			info1.text = str("Score: ", scorecounter)
			get_tree().paused = true;
			rewardcanva.show();
			soundplayer4.play();
			timerpermodes = 60.0;
			info2.modulate = randomcolor.pick_random();
			isthemodestarts = false;
			## COMMENTS HERE LOL
			if (scorecounter == 0):
				info2.text = chooserandomspeechscore0.pick_random();
			elif (scorecounter <= 30):
				info2.text = str("You Need More Practice Buddy!")
			elif (scorecounter <= 50):
				info2.text = str("Begginer!")
			elif (scorecounter <= 100):
				info2.text = str("Average?");
			elif (scorecounter <= 250):
				info2.text = str("Pro?");
			elif (scorecounter <= 400):
				info2.text = str("CS2 Pro Player!");
			elif (scorecounter <= 500):
				info2.text = str("Aimbot?");
			elif (scorecounter <= 600):
				info2.text = str("Dalve is Happy For you!");
			elif (scorecounter <= 750):
				info2.text = str("Godlike?");
			elif (scorecounter <= 900):
				info2.text = str("Cheater?");
			elif (scorecounter <= 1300):
				info2.text = str("You Broke The Game?");
##IS MY RANKING SYSTEM IS so IMPOSIBLE LMAO🙏😆
func ranksystem():
	scorelistener = highestscore;
	if scorelistener >= 450:
		rank.text = "Rank: Diamond+";
	elif scorelistener >= 400:
		rank.text = "Rank: Titanium++";
	elif scorelistener >= 350:
		rank.text = "Rank: Platinum+";
	elif scorelistener >= 300:
		rank.text = "Rank: Gold";
	elif scorelistener >= 250:
		rank.text = "Rank: Iron";
	elif scorelistener >= 200:
		rank.text = "Rank: Silver";
	elif scorelistener >= 100:
		rank.text = "Rank: Copper";
	else:
		rank.text = "Rank: Bronze";




func score1():
	flickscore.text = str("score: ", scorecounter)
	highestscorelabel.text = str("best score: ", highestscore)


func highestscorelogic():
	if scorecounter > highestscore:
		highestscore = scorecounter






##DONT TOUCH THIS
##THIS PART LF TH3 CODE IS SYSTEM SOUND DONT TOUCH THIS...!!!
func setsoundplayer():
	soundplayer1.pitch_scale = 1.0;
	soundplayer1.volume_db = -10.0;
	add_child(soundplayer1);
func playersoundplayer1():
	soundplayer1.pitch_scale = randf_range(1.0, 1.9);
	soundplayer1.stream = randsound.pick_random();
	soundplayer1.play();
func setsoundplayer2():
	soundplayer2.pitch_scale = 1.0;
	soundplayer2.volume_db = -3.0;
	add_child(soundplayer2);
func gunshot():
	soundplayer2.pitch_scale = randf_range(0.9, 1.1)
	soundplayer2.stream = sound2;
	soundplayer2.play();
func setsoundplayer3():
	soundplayer3.pitch_scale = 1.0;
	soundplayer3.volume_db = 10.5;
	add_child(soundplayer3);
func guiclicksound():
	soundplayer3.stream = sound3;
	soundplayer3.play();
func setsoundplayer4():
	soundenvironmentplayer4.pitch_scale = 1.0;
	soundenvironmentplayer4.volume_db = 11.0;
	add_child(soundenvironmentplayer4);
func ambient(delta):
	if isthegameneedtoplay1:
		if not soundenvironmentplayer4.playing:
			soundenvironmentplayer4.stream = sound4;
			soundenvironmentplayer4.play()
			
func setsoundplayer5():
	soundenvironmentplayer5.pitch_scale = 1.0;
	soundenvironmentplayer5.volume_db = -10.0;
	add_child(soundenvironmentplayer5);
func nightambientsound(delta):
	if isthegameneedtoplay2:
		if not soundenvironmentplayer5.playing:
			soundenvironmentplayer5.stream = sound6;
			soundenvironmentplayer5.play()
func setsoundplayer6SFX():
	soundplayer5.pitch_scale = 1.0;
	soundplayer5.volume_db = 1.0;
	add_child(soundplayer5);
func playsound6sfx():
	soundplayer5.pitch_scale = randf_range(0.8, 1.4);
	soundplayer5.stream = sound7
	soundplayer5.play();








##PARTICLE SYSTEM///
func setmainparticle():
	add_child(mainparticle1);
func usemainparticle1():
	var getpospoint = playerraycast.get_collision_point();
	mainparticle1.global_position = getpospoint;



	
##DATA FILE HERE SAVE
func savesettings():
	var config = {
		"shadowcfg": isshadowbuttonpressed,
		"bloomcfg": isbloombuttonpressed,
		"fogcfg": isfogbuttonpressed,
		"fpscfg": fpsresult,
		"sensitivecfg": sensitiveresult,
	}
	var file = FileAccess.open(filepath1, FileAccess.WRITE);
	if file:
		file.store_string(JSON.stringify(config));
		file.close();
		print("saved");
	else:
		print("error not saved!")
func loadsettings():
	var openfile = FileAccess.open(filepath1, FileAccess.READ);
	var usedata = JSON.parse_string(openfile.get_as_text());
	if openfile == null:
		return
	if usedata:
		fpsresult = usedata["fpscfg"];
		sensitiveresult = usedata["sensitivecfg"];
		isshadowbuttonpressed = usedata["shadowcfg"];
		isbloombuttonpressed = usedata["bloomcfg"];
		isfogbuttonpressed = usedata["fogcfg"];
		sun.shadow_enabled = isshadowbuttonpressed;
		worldenvironment.glow_enabled = isbloombuttonpressed;
		worldenvironment.fog_enabled = isfogbuttonpressed;
		Engine.max_fps = fpsresult;
		player.SENSITIVITY = sensitiveresult*0.15;
		sensitivitychangerlineedit.text = str(sensitiveresult)
		fpschangerlineedit.text = str(fpsresult);
		shadowbutton.text = str("shadow: ",usedata["shadowcfg"]);
		bloombutton.text = str("bloom: ",usedata["bloomcfg"]);
		fogbutton.text = str("fog: ",usedata["fogcfg"]);
		print("settings loaded");
	else:
		print("error to load");

























func savescore():
	var score_data = {"highestscore": highestscore};
	var fileaccess = FileAccess.open(filepath, FileAccess.WRITE);
	if fileaccess:
		fileaccess.store_string(JSON.stringify(score_data));
		fileaccess.close();
	else:
		print("ERROR: not saved please fontact the developer");
		return;
func loadscore():
	var fileaccess = FileAccess.open(filepath, FileAccess.READ);
	if fileaccess == null:
		return;
	var readdata = JSON.parse_string(fileaccess.get_as_text());
	if readdata:
		scorecounter = readdata["highestscore"];
		highestscore = readdata["highestscore"];
	#scoredata is int bro 
##SAVE SETTINGS HERE SOON!!!
##im too lazy to do it tbh....




#extra mod
@onready var entiystalking = $entity
#'console vars
var hideconsolecanvastimer : float = 8.0;
var delay1 : float = 0.5;
var delay2 : float = 0.7;
var delay3 : float = 0.9;
var delay4 : float = 1.3;
var delay5 : float = 1.5;
var delay6 : float = 1.8;
var delay7 : float = 2.0;
var delay8 : float = 2.3;
var delay9 : float = 2.5;
var delay10 : float = 2.9;
var delay11 : float = 3.3;
var delay12: float = 3.7;
var delay13: float = 4.0;
var delay14: float = 4.3;
var delay15: float = 4.7;

#CONSOLE HERE
func showconsole(delta):
	delay1 -= delta;
	delay2 -= delta;
	delay3 -= delta;
	delay4 -= delta;
	delay5 -= delta;
	delay6 -= delta;
	delay7 -= delta;
	delay8 -= delta;
	delay9 -= delta;
	delay10 -= delta;
	delay11 -= delta;
	delay12 -= delta;
	delay13 -= delta;
	delay14 -= delta;
	delay15 -= delta;

	if delay1 < 0.0:
		if (player != null):
			debugconsole.text = str("[LOG]: player loaded...", player.global_position, player.get_children());
		else:
			debugconsole.text = str("[LOG]: player not exist in file data");
	if delay2 < 0.0:
		if texture1 != null:
			debugconsole2.text = str("[LOG]: texture1 loaded...", texture1);
		else:
			debugconsole2.text = str("[LOG]: texture1 not exist in file data[missing file type]", texture1);
	if delay3 < 0.0:
		if texture2 != null:
			debugconsole3.text = str("[LOG]: texture2 loaded...", texture1);
		else:
			debugconsole3.text = str("[LOG]: texture2 not exist in file data[missing file type]", texture2);
	if delay4 < 0.0:
		if FileAccess.file_exists(filepath):
			debugconsole4.text = str("[LOG]: file_path loaded: ", filepath);
		else:
			debugconsole4.text = str("[LOG]: file_path is missing: ", filepath);
	if delay5 < 0.0:
		if soundhd1 != null:
			debugconsole5.text = str("[LOG]: sound1 loaded: ", soundhd1);
		else:
			debugconsole5.text = str("[LOG]: sound1 is missing: ", soundhd1);
	if delay6 < 0.0:
		if sound2 != null:
			debugconsole6.text = str("[LOG]: sound2 loaded: ", sound2);
		else:
			debugconsole6.text = str("[LOG]: sound2 is missing: ", sound2);
	if delay7 < 0.0:
		if ResourceLoader.exists("res://mainsrccodes/player.gd"):
			debugconsole7.text = str("[LOG]: player game code loaded: ", ResourceLoader.exists("res://mainsrccodes/player.gd"), ", gameversion: a0.0.1_build1");
		else:
			debugconsole7.text = str("[LOG]: player game code is missing: ", ResourceLoader.exists("res://mainsrccodes/player.gd"));
	if delay8 < 0.0:
		if timedebugsecond != null:
			debugconsole8.text = str("[LOG]: Current Time Run: ", timedebugsecond);
		else:
			debugconsole8.text = str("[LOG]: Current Time Node is missing ", timedebugsecond);
	if delay9 < 0.0:
		var mainfps = Engine.get_frames_per_second();
		debugconsole9.text = str("[LOG]: Frame Rate Per Second:", mainfps);
		if mainfps < 30.0:
			debugconsole9.text = str("[LOG]: Mid Frame Issue :", mainfps);
		if mainfps < 10.0:
			debugconsole9.text = str("[LOG]: Device low specs:", mainfps);
	if delay10 < 0.0:
		debugconsole10.text = str("[LOG]: %d_rare_rate: ", entiystalking.rarerate);













##HERE IS MAIN GAME UI SO PLEAZE DON'T TALK ABOUT THIS
##GAME UI MAIN DONT TOUFH THIS
##setting configs_____
func settingshadowbuttonlogic():
	isshadowbuttonpressed = !isshadowbuttonpressed;
	if isshadowbuttonpressed:
		sun.shadow_enabled = isshadowbuttonpressed;
		shadowbutton.text = str("shadow: ", isshadowbuttonpressed);
	else:
		shadowbutton.text = str("shadow: ", isshadowbuttonpressed);
		sun.shadow_enabled = isshadowbuttonpressed;
func setyourfps():
	var inputtext1 = fpschangerlineedit.text;
	var fpsinput = int(inputtext1);
	fpsresult = fpsinput;
	print(fpsresult)
	Engine.max_fps = fpsresult;
func setownsensitivity():
	var newtext = sensitivitychangerlineedit.text;
	var input = float(newtext);
	sensitiveresult = input;
	player.SENSITIVITY = sensitiveresult*0.15;
func bloombuttonfunc():
	isbloombuttonpressed = !isbloombuttonpressed;
	if isbloombuttonpressed:
		bloombutton.text = str("bloom: ", isbloombuttonpressed);
		worldenvironment.glow_enabled = isbloombuttonpressed;
	else:
		worldenvironment.glow_enabled = isbloombuttonpressed;
		bloombutton.text = str("bloom: ", isbloombuttonpressed);
		
func fogbuttonfunc():
	isfogbuttonpressed = !isfogbuttonpressed;
	if isfogbuttonpressed:
		fogbutton.text = str("fog: ", isfogbuttonpressed);
		worldenvironment.fog_enabled = isfogbuttonpressed;
	else:
		fogbutton.text = str("fog: ", isfogbuttonpressed);
		worldenvironment.fog_enabled = isfogbuttonpressed;

### UI MAIN...!!!
func pausegame():
	get_tree().paused = false;
	$counterstartCanva.process_mode = Node.PROCESS_MODE_ALWAYS;
	menubutton.process_mode = Node.PROCESS_MODE_ALWAYS;
	backmenucanvas.process_mode = Node.PROCESS_MODE_ALWAYS;
	GamemenuCanva.process_mode = Node.PROCESS_MODE_ALWAYS;
	ModemenuCanva.process_mode = Node.PROCESS_MODE_ALWAYS;
	rewardcanva.process_mode = Node.PROCESS_MODE_ALWAYS
	settingcanvas.process_mode = Node.PROCESS_MODE_ALWAYS;	menubutton.hide();
func startbuttonfunc():
	GamemenuCanva.hide();
	ModemenuCanva.show();
func settingsfunc():
	backsettingsmenubutton.hide();
	mainbacksettings.show();
	settingcanvas.show();
	GamemenuCanva.hide();
func quitbuttonfunc():
	get_tree().quit();
	savescore();
## FAST DEBUG HERE...
#forwardbutton.hide();
#backbutton.hide();
#rightbutton.hide();
#leftbutton.hide();
#interactbuttongui.hide();

#MODEMENU func...
func freemode1func():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	interactbutton.show()
	scorecounter = 0;
	isthemodestarts = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	isthefileneedtoloaded = false;
	## anothe4 comfig here
	AI1holder.position = Vector3(80.0, 4.0, 80.0)
	GamemenuCanva.hide();
	AI1holder.hide();
	isAIneedtomove = false;
	get_tree().paused = false;
	issmallballnodeclicked = false;
	isfreemodeclicked = true;
	isflickclicked = false;
	isflickreflexclicked = false;
	ismovingballclicked = false;
	isAI360 = false
	ModemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();
	menubutton.show();
	await get_tree().process_frame
	#AI1holder.global_position = Vector3(90, 90, 90);
	player.global_position = Vector3(0.0, 5.0, 8.0);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	forwardbutton.show();
	backbutton.show();
	rightbutton.show();
	leftbutton.show();

func flickfunc():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	isthefileneedtoloaded = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	scorecounter = 0;
	## anothe4 comfig here
	isAIneedtomove = false;
	get_tree().paused = false;
	isfreemodeclicked = false;
	issmallballnodeclicked = false;
	isflickclicked = true;
	isflickreflexclicked = false;
	ismovingballclicked = false;
	isAI360 = false
	scorecanvas.show();
	ModemenuCanva.hide();
	GamemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();

	AI1holder.position = Vector3(80.0, 4.0, 80.0)
	isthemodestarts = true;

	player.global_position = Vector3(0.0, 2.6, 10.0);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	player.rotation_degrees.x = 0;
	player.rotation_degrees.y = 0;
	forwardbutton.hide();
	backbutton.hide();
	rightbutton.hide();
	leftbutton.hide();
	interactbutton.hide();

#second mode here...
func flickReflex():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	isthefileneedtoloaded = false;
	## anothe4 comfig here
	isAIneedtomove = false;
	scorecounter = 0;
	get_tree().paused = false;
	isfreemodeclicked = false;
	isflickclicked = false;
	ismovingballclicked = false;
	isflickreflexclicked = true;
	issmallballnodeclicked = false;
	isAI360 = false
	isthemodestarts = true;
	scorecanvas.show();
	AI1holder.position = Vector3(80.0, 2.0, 80.0)
	ModemenuCanva.hide();
	GamemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();

	player.global_position = Vector3(0.0, 2.6, -9.5);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	player.rotation_degrees.x = 0;
	player.rotation_degrees.y = 0;
	forwardbutton.hide();
	backbutton.hide();
	rightbutton.hide();
	leftbutton.hide();
	interactbutton.hide();
func movingball():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	isthefileneedtoloaded = false;
	## anothe4 comfig here
	isAIneedtomove = false;
	get_tree().paused = false;
	isAI360 = false
	isfreemodeclicked = false;
	issmallballnodeclicked = false;
	isflickclicked = false;
	scorecounter = 0;
	ismovingballclicked = true
	isflickreflexclicked = false;
	isthemodestarts = true;
	scorecanvas.show();
	ModemenuCanva.hide();
	GamemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();

	player.global_position = Vector3(0.0, 2.6, 5.0);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	player.rotation_degrees.x = 0;
	player.rotation_degrees.y = 0;
	forwardbutton.hide();
	backbutton.hide();
	rightbutton.hide();
	leftbutton.hide();
	interactbutton.hide();
func AI360mode():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	isthefileneedtoloaded = false;
	## anothe4 comfig here
	AIradius = 3.0;
	gainscore = true;
	scorecounter = 0;
	isAIneedtomove = true;
	get_tree().paused = false;
	isAI360 = true;
	isthemodestarts = true;
	issmallballnodeclicked = false;
	isfreemodeclicked = false;
	isflickclicked = false;
	ismovingballclicked = false;
	isflickreflexclicked = false;
	scorecanvas.show();
	ModemenuCanva.hide();
	GamemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();

	angle = 90.0;
	AI1holder.position = Vector3(0.0, 3.0, 3.0);
	player.global_position = Vector3(0.0, 2.6, 5.0);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	player.rotation_degrees.x = 0;
	player.rotation_degrees.y = 0;
	forwardbutton.hide();
	backbutton.hide();
	rightbutton.hide();
	leftbutton.hide();
	interactbutton.hide();
func headshot():
	isthegameneedtoplay1 = true
	isthegameneedtoplay2 = true
	scorecounter = 0;
	isthefileneedtoloaded = false;
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	## anothe4 comfig here
	isAIneedtomove = false;
	get_tree().paused = false;
	issmallballnodeclicked = true;
	isfreemodeclicked = false;
	isflickclicked = false;
	ismovingballclicked = false;
	isthemodestarts = true;
	isflickreflexclicked = false;
	isAI360 = false
	scorecanvas.show();
	ModemenuCanva.hide();
	GamemenuCanva.hide();
	settingcanvas.hide();
	playercontroller.show();
	playerhealth.show();

	AI1holder.position = Vector3(0.0, -90, 0.0);
	player.global_position = Vector3(0.0, 2.6, 6.5);
	player.look_at(player.global_position + Vector3(0.0, 0.0, -1.0), Vector3(0.0, 1.0, 0.0));
	player.rotation_degrees.x = 0;
	player.rotation_degrees.y = 0;
	forwardbutton.hide();
	backbutton.hide();
	rightbutton.hide();
	leftbutton.hide();
	interactbutton.hide();









#settinglogic...
func backfunc():
	ModemenuCanva.hide();
	GamemenuCanva.show();

func settingback():
	savesettings();
	GamemenuCanva.show();
	settingcanvas.hide();
func backmenu():
	savesettings();
	backmenucanvas.show();
	settingcanvas.hide();
func backmenulogic():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE);
	get_tree().paused = true;
	backmenucanvas.show();
	menubutton.hide();
func resumelogic():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED);
	get_tree().paused = false;
	backmenucanvas.hide();
	menubutton.show();
func settingbuttonlogicagain():
	savesettings();
	settingcanvas.show();
	mainbacksettings.hide();
	backsettingsmenubutton.show();
	backmenucanvas.hide();
func mainmenushow():
	savescore();
	savesettings();
	isthefileneedtoloaded = true;
	gainscore = false;;
	for balls in balldata:
		balls.queue_free();
		ballcounter = 0;
		ballcounter2 = 0;
	balldata.clear();
	for balls in balldata2:
		balls.queue_free();
		ballcounter3 = 0;
	for smallballs in smallballarray:
		smallballs.queue_free();
		smallballcounter = 0;
	smallballarray.clear();
	balldata2.clear();
	AI1holder.hide();
	scorecanvas.hide();
	menubutton.hide();
	playercontroller.hide();
	playerhealth.hide();
	settingcanvas.hide();
	GamemenuCanva.show();
	backmenucanvas.hide();
	timerpermodes = 60.0; #
	get_tree().paused = true;
func consolebackfunction():
	debugcanvas.hide();
func showconsoledebug():
	debugcanvas.show();









#chest...
func final_v99_finalVeryFinal_close_back_final_buttonlogic():
	chestcanva.hide();

func _on_start_pressed() -> void:
	startbuttonfunc();
	guiclicksound();
func _on_settings_pressed() -> void:
	settingsfunc();
	guiclicksound();
func _on_quit_pressed() -> void:
	quitbuttonfunc();
	guiclicksound();
#MODE FUNC...
func _on_free_mode_pressed() -> void:
	freemode1func();
	guiclicksound();
func _on_mode_1_pressed() -> void:
	flickfunc();
	guiclicksound();
func _on_mode_2_pressed() -> void:
	flickReflex();
	guiclicksound();
func _on_back_pressed() -> void:
	backfunc();
	guiclicksound();
func _on_settingback_pressed() -> void:
	settingback();
	guiclicksound();
func _on_shadow_pressed() -> void:
	settingshadowbuttonlogic();
	guiclicksound();
func _on_shoot_pressed() -> void:
	gunshot();
	smallballremove();
	removeball();
func _on_interact_pressed() -> void:
	openchest();
func _on_openmenu_pressed() -> void:
	backmenulogic();
	guiclicksound();
func _on_backresume_pressed() -> void:
	resumelogic();
	guiclicksound();
func _on_shoot_released() -> void:
	isbrofiringthisfckinggun = false;
func _on_backsettings_pressed() -> void:
	settingbuttonlogicagain();
	guiclicksound();
func _on_backtomainmenu_pressed() -> void:
	mainmenushow();
	guiclicksound();
func _on_backmenu_pressed() -> void:
	backmenu();
	guiclicksound();
func _on_fps_changer_text_changed(new_text: String) -> void:
	setyourfps();
	guiclicksound();
func _on_sensitivity_text_changed(new_text: String) -> void:
	setownsensitivity();
	guiclicksound();

func _on_bloom_pressed() -> void:
	bloombuttonfunc();
	guiclicksound();
func _on_fog_pressed() -> void:
	fogbuttonfunc();
	guiclicksound();
func _on_backchest_pressed() -> void:
	final_v99_finalVeryFinal_close_back_final_buttonlogic();
	guiclicksound();
func _on_mode_3_pressed() -> void:
	movingball();
	guiclicksound();
func _on_mode_4_pressed() -> void:
	AI360mode();
	guiclicksound();
func _on_mode_5_pressed() -> void:
	headshot();
	guiclicksound();
func _on_closebuttonconsole_pressed() -> void:
	consolebackfunction();
	guiclicksound();
func _on_logoutputbutton_pressed() -> void:
	showconsoledebug();
	guiclicksound();
func _on_reloadgamebutton_pressed() -> void:
	get_tree().reload_current_scene();
	loadsettings();
	guiclicksound();
func _on_continuebutton_pressed() -> void:
	savesettings();
	isthefileneedtoloaded = true;
	gainscore = false;;
	for balls in balldata:
		balls.queue_free();
		ballcounter = 0;
		ballcounter2 = 0;
	balldata.clear();
	for balls in balldata2:
		balls.queue_free();
		ballcounter3 = 0;
	for smallballs in smallballarray:
		smallballs.queue_free();
		smallballcounter = 0;
	smallballarray.clear();
	balldata2.clear();
	AI1holder.hide();
	scorecanvas.hide();
	menubutton.hide();
	playercontroller.hide();
	playerhealth.hide();
	settingcanvas.hide();
	GamemenuCanva.show();
	backmenucanvas.hide();
	timerpermodes = 60.0; ##
	get_tree().paused = true;
	rewardcanva.hide();
	GamemenuCanva.show();
	guiclicksound();




##CALLERS HERE NOT 911 
func _ready() -> void:
	soundplayer4.volume_db = 10.5
	soundplayer4.pitch_scale = 1.0
	soundplayer4.stream = sound5;
	add_child(soundplayer4)
	##ETCCC TEXT EDIT
	Engine.time_scale = 1.0;
	#call environment thing;
	AIjumping();
	setAIbody();
	smallball();
	choosewheretomove();
	deletebulletsaftertimes();
	setbulletthing();
	setroof1();
	loadsettings();
	setobj1();
	setbullettholehing();
	setobj1designedonly();
	setlightbulbmesh1();
	setlight1();
	setroof();
	chooseAIpath();
	setroomwall1();
	setwall4();
	setwall3();
	setwall2();
	setwall1();
	setterrain();
	SetSun();
	AIconfigs();
	SetEnvironment();
	#call game objects;
	ball();
	ball2();
	#gamemenu...
	pausegame();
	#sound
	setsoundplayer6SFX()
	setsoundplayer();
	setsoundplayer2();
	setsoundplayer3();
	setsoundplayer4();
	setsoundplayer5()
	#particle system
	setmainparticle();
func _physics_process(delta: float) -> void:
	LookatAI(delta);
	AIphysics(delta);
	debugger();
	MAINTIMERdebug(delta);
	update_sun(delta);
	night();

	score1();
	day();
	lookatball2challenge(delta);
	timerforloading -= delta;

	if isthefileneedtoloaded:
		if timerforloading < 0.0:
			loadscore();
			timerforloading = 0.2;
func _process(delta: float) -> void:
	backconsolebutton.process_mode = Node.PROCESS_MODE_ALWAYS;
	ranksystem();
	freemode1();
	followplayer(delta);
	AIlogic1();
	ball3logic();
	nightambientsound(delta)
	ambient(delta);
	moveball(delta);
	bulletshitgoestorun();
	bulletgo();
	showconsole(delta); 
	timer1 -= delta;
	timer2 -= delta;
	timerforsmallball -= delta;
	modetimer(delta)
	if timer1 <= 0.0:
		balllogic();
		timer1 = 0.001;
	if timer2 <= 0.0:
		ball2logic();
		timer2 = 0.001;
	if timerforsmallball <= 0.0:
		smallballlogic();
		timerforsmallball = 0.001;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	pass;
