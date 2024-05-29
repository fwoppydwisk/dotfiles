{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        viAlias = true;
        vimAlias = true;
        debugMode = {
          enable = false;
          level = 20;
          logFile = "/tmp/nvim.log";
        };
      };

      vim.lsp = {
        formatOnSave = true;
        lspkind.enable = false;
        lightbulb.enable = true;
        lspsaga.enable = false;
        nvimCodeActionMenu.enable = true;
        trouble.enable = true;
        lspSignature.enable = true;
      };

      vim.languages = {
        enableLSP = true;
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        html.enable = true;
        clang.enable = false;
        sql.enable = false;
        rust = {
          enable = false;
          crates.enable = false;
        };
        ts.enable = true;
        go.enable = true;
        zig.enable = false;
        python.enable = false;
        dart.enable = false;
        elixir.enable = false;
      };

      vim.visuals = {
        enable = true;
        nvimWebDevicons.enable = true;
        scrollBar.enable = true;
        smoothScroll.enable = true;
        cellularAutomaton.enable = true;
        fidget-nvim.enable = true;
        indentBlankline = {
          enable = true;
          fillChar = null;
          eolChar = null;
          scope.enabled = true;
        };
        cursorline = {
          enable = true;
          lineTimeout = 0;
        };
      };

      vim.statusline = {
        lualine = {
          enable = true;
          theme = "onedark";
        };
      };

      vim.theme = {
        enable = true;
        name = "onedark";
        style = "dark";
        transparent = false;
      };
      vim.autopairs.enable = true;

      vim.autocomplete = {
        enable = true;
        type = "nvim-cmp";
      };

      vim.filetree = {
        nvimTree = {
          enable = true;
          openOnSetup = true;
          setupOpts = {
            disable_netrw = true;

            hijack_unnamed_buffer_when_opening = true;
            hijack_cursor = true;
            hijack_directories = {
              enable = true;
              autoOpen = true;
            };

            git = {
              enable = true;
              showOnDirs = false;
              timeout = 100;
            };

            view = {
              cursorline = false;
              width = {
                min = 35;
                max = -1;
                padding = 1;
              };
            };

            renderer = {
              indent_markers.enable = true;
              root_folder_label = false;

              icons = {
                modified_placement = "after";
                git_placement = "after";
                show.git = true;
                show.modified = true;
              };
            };

            diagnostics.enable = true;

            modified = {
              enable = true;
              show_on_dirs = false;
              show_on_open_dirs = true;
            };
          };

          mappings = {
            toggle = "<C-w>";
          };
        };
      };

      vim.tabline = {
        nvimBufferline.enable = true;
      };

      vim.treesitter.context.enable = true;

      vim.binds = {
        whichKey.enable = true;
        cheatsheet.enable = true;
      };

      vim.telescope.enable = true;

      vim.git = {
        enable = true;
        gitsigns.enable = true;
        gitsigns.codeActions.enable = false;
      };

      vim.minimap = {
        minimap-vim.enable = false;
        codewindow.enable = true; # lighter, faster, and uses lua for configuration
      };

      vim.dashboard = {
        dashboard-nvim.enable = false;
        alpha.enable = true;
      };

      vim.notify = {
        nvim-notify.enable = true;
      };

      vim.projects = {
        project-nvim.enable = true;
      };

      vim.utility = {
        ccc.enable = true;
        icon-picker.enable = true;
        diffview-nvim.enable = true;
        motion = {
          hop.enable = true;
          leap.enable = false;
        };
        vim-wakatime = {
          enable = true;
          cli-package = pkgs.wakatime;
        };
      };

      vim.notes = {
        mind-nvim.enable = true;
        todo-comments.enable = true;
      };

      vim.terminal = {
        toggleterm.enable = true;
      };

      vim.ui = {
        noice.enable = true;
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            nix = 150;
            ruby = 110;
            java = 120;
            go = [110 150];
          };
        };
      };

      vim.assistant = {
        copilot.enable = true;
      };

      vim.session = {
        nvim-session-manager.enable = true;
      };

      vim.gestures = {
        gesture-nvim.enable = false;
      };

      vim.comments = {
        comment-nvim.enable = true;
      };

      #vim.presence = {
      #  presence-nvim = {
      #    enable = true;
      #    auto_update = true;
      #    image_text = "The Superior Text Editor";
      #    client_id = "793271441293967371";
      #    main_image = "neovim";
      #    rich_presence = {
      #      editing_text = "Editing %s";
      #    };
      #  };
      #};
    };
  };
}
