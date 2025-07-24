{config, pkgs, ...}:
{
	users.users.ryan = {
		home = "/home/ryan";
		isNormalUser = true;
		description = "ryan";
		shell = pkgs.fish;
		extraGroups = [
			"networkmanager"
			"wheel"
		];
	};
}
