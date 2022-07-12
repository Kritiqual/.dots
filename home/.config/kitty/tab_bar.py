from kitty.fast_data_types import Screen
from kitty.rgb import Color
from kitty.tab_bar import *

# from kitty.tab_bar import DrawData, ExtraData, TabBarData, as_rgb, draw_title, draw_tab_with_powerline
def _draw_left_status(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    left, right = "", ""
    orig_fg, orig_bg = screen.cursor.fg, screen.cursor.bg
    tab_bg = color_from_int(orig_bg >> 8)
    # fade_colors = [
    #     as_rgb(color_as_int(alpha_blend(tab_bg, draw_data.default_bg, alpha)))
    #     for alpha in draw_data.alpha
    # ]
    # for bg in fade_colors:
    #     screen.cursor.bg = bg
    #     screen.draw(" ")
    screen.cursor.fg, screen.cursor.bg = orig_bg, orig_fg
    screen.draw(left)
    screen.cursor.bg = orig_bg
    screen.draw(" ")
    screen.cursor.fg, screen.cursor.bg = orig_fg, orig_bg
    draw_title(draw_data, screen, tab, index)
    screen.cursor.bg = orig_bg
    screen.draw(" ")
    screen.cursor.fg, screen.cursor.bg = orig_bg, orig_fg
    screen.draw(right)
    screen.cursor.fg, screen.cursor.bg = orig_fg, orig_bg
    # extra = screen.cursor.x - before - max_title_length
    # if extra > 0:
    #     screen.cursor.x = before
    #     draw_title(draw_data, screen, tab, index)
    #     extra = screen.cursor.x - before - max_title_length
    #     if extra > 0:
    #         screen.cursor.x -= extra + 1
    #         screen.draw("…")
    # for bg in reversed(fade_colors):
    #     if extra >= 0:
    #         break
    #     extra += 1
    #     screen.cursor.bg = bg
    #     screen.draw(" ")
    end = screen.cursor.x + len(right)
    screen.cursor.bg = as_rgb(color_as_int(draw_data.default_bg))
    screen.draw(" ")
    return end


def draw_tab(
    draw_data: DrawData,
    screen: Screen,
    tab: TabBarData,
    before: int,
    max_title_length: int,
    index: int,
    is_last: bool,
    extra_data: ExtraData,
) -> int:
    _draw_left_status(
        draw_data,
        screen,
        tab,
        before,
        max_title_length,
        index,
        is_last,
        extra_data,
    )

    return screen.cursor.x


### TEMPLATE ###
# import datetime
# import json
# import subprocess
# from collections import defaultdict

# from kitty.boss import get_boss
# from kitty.fast_data_types import Screen, add_timer
# from kitty.tab_bar import (
#     DrawData,
#     ExtraData,
#     Formatter,
#     TabBarData,
#     as_rgb,
#     draw_attributed_string,
#     draw_tab_with_powerline,
# )

# timer_id = None


# def draw_tab(
#     draw_data: DrawData,
#     screen: Screen,
#     tab: TabBarData,
#     before: int,
#     max_title_length: int,
#     index: int,
#     is_last: bool,
#     extra_data: ExtraData,
# ) -> int:
#     global timer_id

#     # if timer_id is None:
#     #     timer_id = add_timer(_redraw_tab_bar, 2.0, True)
#     draw_tab_with_powerline(
#         draw_data, screen, tab, before, max_title_length, index, is_last, extra_data
#     )
#     if is_last:
#         draw_right_status(draw_data, screen)
#     return screen.cursor.x


# def draw_right_status(draw_data: DrawData, screen: Screen) -> None:
#     # The tabs may have left some formats enabled. Disable them now.
#     draw_attributed_string(Formatter.reset, screen)
#     cells = create_cells()
#     # Drop cells that wont fit
#     while True:
#         if not cells:
#             return
#         padding = screen.columns - screen.cursor.x - sum(len(c) + 3 for c in cells)
#         if padding >= 0:
#             break
#         cells = cells[1:]

#     if padding:
#         screen.draw(" " * padding)

#     tab_bg = as_rgb(int(draw_data.inactive_bg))
#     tab_fg = as_rgb(int(draw_data.inactive_fg))
#     default_bg = as_rgb(int(draw_data.default_bg))
#     for cell in cells:
#         # Draw the separator
#         if cell == cells[0]:
#             screen.cursor.fg = tab_bg
#             screen.draw("")
#         else:
#             screen.cursor.fg = default_bg
#             screen.cursor.bg = tab_bg
#             screen.draw("")
#         screen.cursor.fg = tab_fg
#         screen.cursor.bg = tab_bg
#         screen.draw(f" {cell} ")


# def create_cells() -> list[str]:
#     now = datetime.datetime.now()
#     return [
#         currently_playing(),
#         get_headphone_battery_status(),
#         now.strftime("%d %b"),
#         now.strftime("%H:%M"),
#     ]


# def get_headphone_battery_status():
#     try:
#         battery_pct = int(subprocess.getoutput("headsetcontrol -b -c"))
#     except Exception:
#         status = ""
#     else:
#         if battery_pct < 0:
#             status = ""
#         else:
#             status = f"{battery_pct}% {''[battery_pct // 10]}"
#     return f" {status}"


# STATE = defaultdict(lambda: "", {"Paused": "", "Playing": ""})


# def currently_playing():
#     # TODO: Work out how to add python libraries so that I can query dbus directly
#     # For now, implemented in a separate python project: dbus-player-status
#     status = " "
#     data = {}
#     try:
#         data = json.loads(subprocess.getoutput("dbus-player-status"))
#     except ValueError:
#         pass
#     if data:
#         if "state" in data:
#             status = f"{status} {STATE[data['state']]}"
#         if "title" in data:
#             status = f"{status} {data['title']}"
#         if "artist" in data:
#             status = f"{status} - {data['artist']}"
#     else:
#         status = ""
#     return status


# def _redraw_tab_bar(timer_id):
#     for tm in get_boss().all_tab_managers:
#         tm.mark_tab_bar_dirty()
