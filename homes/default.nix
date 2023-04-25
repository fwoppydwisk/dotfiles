{
  inputs,
  self,
  outputs,
  ...
}: {
  home-manager = {
    useUserPackages = true;
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit inputs self outputs;
    };
    users = {
      # TODO: "base" user that will be used by default is there is no defined
      # home directory for the user
      floppydisk = ./floppydisk;
    };
  };
}
