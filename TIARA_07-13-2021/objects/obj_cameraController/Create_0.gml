/// @description
//Enable the use of views
view_enabled = true;

followObject = instance_create_depth(room_width/2,room_height/2, -9999, obj_cameraAid); 
if scr_isValidInstance(obj_player)
{
	followObject.x = obj_player.x; 
	followObject.y = obj_player.y; 
}

//Make view 0 visible
view_set_visible(0, true);

var _displayControl = obj_displayController;
width = _displayControl.ideal_width;
height = _displayControl.ideal_height;

halfWidth = width / 2;
halfHeight = height /2; 
//Set the port bounds of view 0 to 640x480
view_set_wport(0, width);
view_set_hport(0, height);


//Build a camera at (0,0), with size 640x480, 0 degrees of angle, no target instance, instant-jupming hspeed and vspeed, with a 32 pixel border
camera = camera_create_view(round((room_width/2) - (halfWidth)), round((room_height/2) - (halfHeight)),  width, height, 0, -1, -1, -1,-1, -1);
view_set_camera(0, camera);

alarm[0] = 3;

cameraX = round((room_width/2) - (halfWidth));
cameraY = round((room_height/2) - (halfHeight));
finalCameraX = cameraX; 
finalCameraY = cameraY; 

xShakeForce = 0; 
yShakeForce = 0; 
xShakeDecay = 0; 
yShakeDecay = 0; 

zoom = .5; 
targetZoom = .5; 
zoomLerp = .1; 

// BG SETTINGS
bg1 = layer_get_id("bg_1"); 
bg2 = layer_get_id("bg_2"); 
bg3 = layer_get_id("bg_3"); 