///@arg resolution
///@arg alpha
///@arg lightScale
///@arg radialBlurFactor
var resolution = argument0;
var alpha = argument1;
var lightScale = argument2;
var blur = argument3;

#region Tiles
if !variable_instance_exists(id,"occlusionMapTiles") occlusionMapTiles = noone;
if !surface_exists(occlusionMapTiles) 
{
	occlusionMapTiles = surface_create(room_width,room_height);
	surface_set_target(occlusionMapTiles);
		draw_clear_alpha(c_white,0);
		var tileLayerList = ["Tiles_foreground_a","Tiles_foreground_b","Tiles_foreground_c","Tiles_foreground_d","Tiles_foreground_e"];
		for (var i = 0; i < array_length_1d(tileLayerList); i++)
		{
			var tileLayerID = layer_get_id(tileLayerList[i]);
			if tileLayerID != -1
			{
				var tileMapID = layer_tilemap_get_id(tileLayerID);
				draw_tilemap(tileMapID,0,0);
			}
		}
	surface_reset_target();
}
#endregion
#region Initializations
with obj_light_parent if enabled
{
	///// VARIABLES \\\\\
	if lightSize < 0 lightSize = 0;
	if maxLightSize < 0 maxLightSize = 0;
	col = make_color_rgb(color_get_red(colour),colour_get_green(colour),colour_get_blue(colour))

	///// SURFACE VARIABLES \\\\\
	if !variable_instance_exists(id,"occlusionMap") occlusionMap = noone;
	if !variable_instance_exists(id,"shadowMap1D") shadowMap1D = noone;
	
	///// CHECK SURFACES EXIST \\\\\
	if !surface_exists(shadowMap1D) shadowMap1D = surface_create(maxLightSize*lightScale,1);
	if !surface_exists(occlusionMap) occlusionMap = surface_create(maxLightSize*lightScale,maxLightSize*lightScale);

	///// CLEAR SURFACES \\\\\
	surface_set_target(shadowMap1D);
		draw_clear_alpha(c_white,0);
	surface_reset_target();
	surface_set_target(occlusionMap);
		draw_clear_alpha(c_white,0);
	surface_reset_target();
}
#endregion
#region Occlusion maps
shader_set(shd_white);
	with obj_light_parent if enabled
	{
		if lightSize != 0
		{			
				///// SPRITES AND COMBINE \\\\\
			surface_set_target(occlusionMap);
				draw_surface_ext(other.occlusionMapTiles,(-x+lightSize/2)*lightScale*(maxLightSize/lightSize),(-y+lightSize/2)*lightScale*(maxLightSize/lightSize),lightScale*(maxLightSize/lightSize),lightScale*(maxLightSize/lightSize),0,c_white,1);
				with objBlockParent if occlusion
				{
					var zoomRatio = other.maxLightSize/other.lightSize;
					draw_sprite_ext(sprite_index,image_index,(x-other.x+(other.lightSize)/2)*lightScale*zoomRatio,(y-other.y+(other.lightSize)/2)*lightScale*zoomRatio,image_xscale*lightScale*zoomRatio,image_yscale*lightScale*zoomRatio,image_angle,c_black,image_alpha)
				}
			surface_reset_target();
		}
	}
shader_reset();
#endregion
#region 1D shadow maps
shader_set(shd_cast_shadows);
var shd_resolution = shader_get_uniform(shd_cast_shadows,"resolution");
shader_set_uniform_f(shd_resolution,resolution,resolution);
	with obj_light_parent if enabled
	{
			///// DRAW SURFACE USING CASTER SHADER \\\\\
		surface_set_target(shadowMap1D);
			draw_surface(occlusionMap,0,0);
		surface_reset_target();
	}
shader_reset();
#endregion
#region Render light onto controller surface
surface_set_target(LightingController.light);
	draw_clear(c_black);
	shader_set(shd_render_light);
	var shd_resolution = shader_get_uniform(shd_render_light,"resolution");
	var shd_blurFactor = shader_get_uniform(shd_render_light,"blurFactor");
	shader_set_uniform_f(shd_resolution,resolution,resolution);
	shader_set_uniform_f(shd_blurFactor,blur);
		with obj_light_parent if enabled
		{
			///// DRAW LIGHT ONTO SURFACE \\\\\
			draw_surface_ext(
				shadowMap1D,
				(x-lightSize/2-camera_get_view_x(Camera.cam)+1)*lightScale,
				(y+lightSize/2-camera_get_view_y(Camera.cam)+1)*lightScale,
				lightSize/maxLightSize,
				-lightSize*lightScale,
				0,col,alpha);
		}
	shader_reset();
surface_reset_target();
#endregion