import os.path

from gi import require_version
from gi.repository import Nautilus, GObject, Gio, GLib


class OpenInVSCodiumAction(GObject.GObject, Nautilus.MenuProvider):
    def __init__(self):
        pass

    def _open_vscodium(self, path):
        cmd = ['codium', path]
        child = Gio.Subprocess.new(cmd, Gio.SubprocessFlags.NONE)

    def _menu_item_activated(self, _menu, paths):
        for path in paths:
            self._open_vscodium(path)

    def _make_item(self, name, paths):
        item = Nautilus.MenuItem(name=name, label='Open in VSCodium',
            icon='vscodium')
        item.connect('activate', self._menu_item_activated, paths)
        return item

    def _paths_to_open(self, files):
        paths = []
        for file in files:
            location = file.get_location()
            path = location.get_path()
            if path and path not in paths:
                paths.append(path)
        if 10 < len(paths):
            return []
        else:
            return paths

    def get_file_items(self, *args):
        # Nautilus 3.0 API passes args (window, files), 4.0 API just passes files
        files = args[0] if len(args) == 1 else args[1]
        paths = self._paths_to_open(files)
        if paths:
            return [self._make_item(name='VSCodiumNautilus::open_in_vscodium', paths=paths)]
        else:
            return []

    def get_background_items(self, *args):
        # Nautilus 3.0 API passes args (window, file), 4.0 API just passes file
        file = args[0] if len(args) == 1 else args[1]
        paths = self._paths_to_open([file])
        if paths:
            return [self._make_item(name='VSCodiumNautilus::open_folder_in_vscodium', paths=paths)]
        else:
            return []
