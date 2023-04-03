#!/usr/bin/env python3

import sys
import shutil
import pathlib
from typing import Final

# This list includes all directories that are used by Neovim.
SOURCE_PATHS: Final[list] = [
    "~/.config/nvim",
    "~/.local/share/nvim",
    "~/.local/state/nvim",
    "~/.cache/nvim"
]
PATH_SUFFIX: Final[str] = ".bak"

def getOriginalPath(path: str) -> pathlib.Path:
    return pathlib.Path(path).expanduser()

def getBackupPath(path: str) -> pathlib.Path:
    return pathlib.Path(path + PATH_SUFFIX).expanduser()

def main(return_to_original: bool = False) -> int:
    """
    Temporarily rename Neovim directories to test new configuration changes.

    :param return_to_original: Return to the original directory names.
    :returns: 0 on success, 1 on failure.
    """

    for path in SOURCE_PATHS:
        source = getBackupPath(path) if return_to_original else getOriginalPath(path)
        destination = getOriginalPath(path) if return_to_original else getBackupPath(path)
        try:
            if not source.exists():
                print(f"[!] The directory `{source}` does not exist.")
                continue

            if destination.exists():
                if input(f"    [!] The directory `{destination}` already exists. Overwrite? (y/n) > ") != 'y':
                    print(f"[+] Skipping `{source}`.")
                    continue

                shutil.rmtree(destination)

            print(f"[+] Renaming `{source}` to `{destination}`.")
            shutil.move(source, destination)

        except Exception as e:
            print(f"[!] Failed to rename `{source}` to `{destination}`.")
            print(f"[!] Error: {e}")
            return 1

    return 0


if __name__ == "__main__":
    if "--return" in sys.argv:
        print("[*] Returning to original directory names.")
        sys.exit(main(return_to_original=True))

    print("[*] Renaming directories.")
    sys.exit(main())
