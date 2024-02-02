{
  inputs,
  self,
  config,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs self;
    };
    users = {
      floppydisk = ./floppydisk;
      # more users can go here, the format is only for convenience
    };
  };
}
