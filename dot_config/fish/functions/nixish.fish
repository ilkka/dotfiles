if command -v podman &>/dev/null
    function nixish --wraps="podman" --description="Nix shell here"
        argparse b/bare -- $argv
        or return

        podman run -it -v "$(pwd):/work" -w /work docker.io/nixos/nix $(if not set -ql _flag_bare; echo nix-shell; end)
    end
end
