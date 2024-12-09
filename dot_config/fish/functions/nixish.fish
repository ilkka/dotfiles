if command -v podman
    function nixish --wraps="podman" --description="Nix shell here"
        podman run -it -v "$(pwd):/work" -w /work docker.io/nixos/nix nix-shell
    end
end
