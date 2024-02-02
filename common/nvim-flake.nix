{inputs, ...}: { 

  imports = [ inputs.neovim-flake.homeManagerModules.default ];
  # enable programs
  programs = {
    neovim-flake = {
      enable = true;
      settings = {
        vim.languages = {
	        nix.enable = true;
          nix.lsp.enable = true;
	        ts.enable = true;
	        python.enable = true;
	        html.enable = true;
        };
        vim.lsp = {
          enable = true;
        };
      };
    };
    # ... add more programs as you see fit
  };
}
