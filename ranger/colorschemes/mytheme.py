from ranger.gui.color import *
from ranger.colorschemes.default import Default

class Scheme(Default):
    def use(self, context):
        fg, bg, attr = default_colors

        if context.directory:
            fg = cyan
        elif context.executable and not any((context.media, context.container)):
            fg = green
        elif context.link:
            fg = magenta
        elif context.socket:
            fg = yellow

        if context.main_column:
            if context.selected:
                attr |= reverse
            if context.marked:
                attr |= bold
                fg = yellow

        return fg, bg, attr