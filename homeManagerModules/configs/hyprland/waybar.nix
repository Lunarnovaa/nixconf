{ pkgs, lib, config, options, ... }: {

	#imports = [
		
	#];

	#config =  lib.mkIf config.hyprland.enable {
		programs.waybar = {
    		enable = true;


  		};				

	#};




}
