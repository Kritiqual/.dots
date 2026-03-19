#######################################################
#/===================================================\#
#|>                RTFM TO CUSTOMIZE                <|#
#\===================================================/#
#######################################################

# from dooit.api import Todo
# from dooit.api.theme import DooitThemeBase
# from dooit.ui.api import DooitAPI, subscribe
# from dooit.ui.api.events import Startup
# from dooit.ui.api.widgets import TodoWidget
# from dooit_extras.bar_widgets import (
#     Clock,
#     CurrentWorkspace,
#     Date,
#     Mode,
#     Platform,
#     Powerline,
#     Spacer,
#     StatusIcons,
#     TextBox,
#     WorkspaceProgress,
# )
# from dooit_extras.formatters import (
#     description_children_count,
#     description_highlight_link,
#     description_highlight_tags,
#     description_strike_completed,
#     due_casual_format,
#     due_icon,
#     effort_icon,
#     recurrence_icon,
#     status_icons,
#     todo_description_progress,
#     urgency_icons,
# )
# from rich.style import Style
# from rich.text import Text


# class DooitThemeEDracula(DooitThemeBase):
#     _name: str = "dooit-edracula"

#     # background colors
#     background1: str = "#191a2e"  # Darkest
#     background2: str = "#21222c"
#     background3: str = "#7f848e"  # Lightest

#     # foreground colors
#     foreground1: str = "#ffffff"  # Lightest
#     foreground2: str = "#f8f8f2"
#     foreground3: str = "#7f848e"  # Darkest

#     # other colors
#     red: str = "#ff5555"
#     orange: str = "#fde181"
#     yellow: str = "#ffb86c"
#     green: str = "#20e3b2"
#     blue: str = "#9b87fd"
#     purple: str = "#8d92ff"
#     magenta: str = "#ff6bcb"
#     cyan: str = "#2cccff"

#     # accent colors
#     primary: str = purple
#     secondary: str = blue


# @subscribe(Startup)
# def setup_colorscheme(api: DooitAPI, _):
#     api.css.set_theme(DooitThemeEDracula)


# @subscribe(Startup)
# def setup_formatters(api: DooitAPI, _):
#     theme = api.vars.theme
#     fmt = api.formatter
#     fw = fmt.workspaces
#     ft = fmt.todos

#     fw.description.add(description_children_count(Text(" ({}) ").markup))
#     fw.description.add(description_highlight_link(""))
#     fw.description.add(description_highlight_tags(color="", fmt="{}"))
#     # fw.description.add(description_strike_completed(dim = True))

#     ft.description.add(description_children_count(Text(" ({}) ").markup))
#     ft.description.add(description_highlight_link(""))
#     ft.description.add(description_highlight_tags(color="", fmt="{}"))
#     ft.description.add(description_strike_completed(dim=True))

#     ft.description.add(
#         todo_description_progress(
#             Text(
#                 "C%:{completed_percent} / R%:{remaining_percent} / CC:{completed_count} / RC:{remaining_count} / TC:{total_count}"
#             ).markup
#         )
#     )

#     ft.due.add(due_casual_format(fmt=""))
#     ft.due.add(due_icon(completed="󱫐 ", pending="󱫚 ", overdue="󱫦 "))

#     ft.effort.add(effort_icon(icon="󱠇 ", color=None, show_on_zero=False))

#     ft.recurrence.add(recurrence_icon(icon="", color=None))

#     ft.status.add(status_icons(completed=" ", pending=" ", overdue=" "))

#     ft.urgency.add(
#         urgency_icons(
#             icons={1: "  󰯬", 2: "  󰯯", 3: "  󰯲", 4: "  󰯵"},
#             colors={1: theme.green, 2: theme.yellow, 3: theme.orange, 4: theme.red},
#         )
#     )


# @subscribe(Startup)
# def setup_layout(api: DooitAPI, _):
#     api.layouts.todo_layout = [
#         TodoWidget.status,
#         TodoWidget.effort,
#         TodoWidget.description,
#         TodoWidget.due,
#     ]


# @subscribe(Startup)
# def setup_bar(api: DooitAPI, _):
#     theme = api.vars.theme

#     widgets = [
#         TextBox(api, " 󰄛 ", bg=theme.magenta),
#         Spacer(api, width=1),
#         Mode(api, format_normal=" 󰷸 NORMAL ", format_insert=" 󰛿 INSERT "),
#         Spacer(api, width=0),
#         WorkspaceProgress(api, fmt=" 󰞯 {}% ", bg=theme.secondary),
#         Spacer(api, width=1),
#         Date(api, fmt=" 󰃰 {} "),
#         CurrentWorkspace(api),
#     ]
#     api.bar.set(widgets)


# @subscribe(Startup)
# def setup_dashboard(api: DooitAPI, _):
#     theme = api.vars.theme

#     ascii_art = r"""
#    ,-.       _,---._ __  / \
#  /  )    .-'       `./ /   \
# (  (   ,'            `/    /|
#  \  `-"             \'\   / |
#   `.              ,  \ \ /  |
#    /`.          ,'-`----Y   |
#   (            ;        |   '
#   |  ,-.    ,-'         |  /
#   |  | (   |      TODOS | /
#   )  |  \  `.___________|/
#   `--'   `--'
#     """

#     ascii_art = Text(ascii_art, style=theme.primary)
#     ascii_art.highlight_words(["TODOS"], style=theme.red)

#     due_today = sum([1 for i in Todo.all() if i.is_due_today and i.is_pending])
#     overdue = sum([1 for i in Todo.all() if i.is_overdue])

#     header = Text(
#         "Another day, another opportunity to organize my todos and then procrastinate",
#         style=Style(color=theme.secondary, bold=True, italic=True),
#     )

#     items = [
#         header,
#         ascii_art,
#         "",
#         "",
#         Text("󰠠 Tasks pending today: {}".format(due_today), style=theme.green),
#         Text("󰁇 Tasks still overdue: {}".format(overdue), style=theme.red),
#     ]
#     api.dashboard.set(items)
