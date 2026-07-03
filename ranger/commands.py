# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

from __future__ import (absolute_import, division, print_function)

# You can import any python module as needed.
import os
import subprocess
from ranger.api.commands import Command


class extract_here(Command):
    """:extract_here

    Extract selected archives to the current directory.
    Supports: zip, tar, tar.gz, tar.bz2, tar.xz, rar, 7z
    """
    def execute(self):
        cwd = self.fm.thisdir
        marked_files = tuple(cwd.get_selection())

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        if not marked_files:
            return

        original_path = cwd.path
        au_flags = ['-x', cwd.path]
        au_flags += self.line.split()[1:]
        au_flags += ['-e']

        self.fm.copy_buffer.clear()
        self.fm.cut_buffer = False
        if len(marked_files) == 1:
            self.fm.execute_command(
                ['aunpack'] + au_flags + [f.path for f in marked_files],
                stdout=subprocess.DEVNULL
            )
        else:
            self.fm.execute_command(
                ['aunpack'] + au_flags + [f.path for f in marked_files],
                stdout=subprocess.DEVNULL
            )
        self.fm.client.register_operation('refresh', refresh)


class compress(Command):
    """:compress <format>

    Compress marked files to an archive.
    Supported formats: zip, tar, tar.gz, tar.bz2, tar.xz, 7z
    """
    def execute(self):
        cwd = self.fm.thisdir
        marked_files = cwd.get_selection()

        if not marked_files:
            return

        def refresh(_):
            cwd = self.fm.get_directory(original_path)
            cwd.load_content()

        original_path = cwd.path
        parts = self.line.split()
        if len(parts) < 2:
            self.fm.notify('Usage: compress <format>', bad=True)
            return

        format = parts[1]
        if format not in ['zip', 'tar', 'tar.gz', 'tar.bz2', 'tar.xz', '7z']:
            self.fm.notify('Unsupported format: ' + format, bad=True)
            return

        filename = os.path.basename(cwd.path) + '.' + format
        archive_path = os.path.join(cwd.path, filename)

        self.fm.execute_command(
            ['apack', archive_path] + [f.path for f in marked_files],
            stdout=subprocess.DEVNULL
        )
        self.fm.client.register_operation('refresh', refresh)
        self.fm.notify('Compressed to ' + filename)


class fzf_select(Command):
    """:fzf_select

    Find a file using fzf.
    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"
        else:
            # match files and directories
            command = "find -L . \( -path '*/\.*' -o -fstype 'dev' -o -fstype 'proc' \) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m"

        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)


class mkcd(Command):
    """:mkcd <dirname>

    Creates a directory with the name <dirname> and enters it.
    """
    def execute(self):
        from os.path import join, expanduser, lexists
        from os import makedirs
        import re

        dirname = join(self.fm.thisdir.path, expanduser(self.rest(1)))
        if not lexists(dirname):
            makedirs(dirname)
            match = re.search('^/|^~[^/]*/', dirname)
            if match:
                self.fm.cd(match.group(0))
                dirname = dirname[match.end():]
            for m in re.finditer('[^/]+', dirname):
                s = m.group(0)
                if s == '..' or (s.startswith('.') and len(s) > 1):
                    self.fm.cd(s)
                else:
                    ## We force ranger to load content before calling `cd`
                    self.fm.thisdir.load_content(schedule=False)
                    self.fm.cd(s)
        else:
            self.fm.notify("file/directory exists!", bad=True)


class toggle_flat(Command):
    """:toggle_flat

    Flattens or unflattens the view, hiding or showing the directory hierarchy.
    """
    def execute(self):
        if self.fm.thisdir.flat == 0:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = -1
            self.fm.thisdir.load_content()
        else:
            self.fm.thisdir.unload()
            self.fm.thisdir.flat = 0
            self.fm.thisdir.load_content()


class show_files_in_finder(Command):
    """:show_files_in_finder

    Present selected files in finder
    """
    def execute(self):
        import subprocess
        files = tuple(f.path for f in self.fm.thistab.get_selection())
        subprocess.run(["xdg-open", "--", *files])


class terminal_here(Command):
    """:terminal_here

    Open terminal in the current directory.
    """
    def execute(self):
        import subprocess
        from os.path import expanduser, join

        term = os.getenv('TERMCMD') or os.getenv('TERM')
        if term:
            subprocess.Popen([term], cwd=self.fm.thisdir.path)
        else:
            self.fm.notify('No terminal emulator found. Set $TERMCMD or $TERM.', bad=True)
