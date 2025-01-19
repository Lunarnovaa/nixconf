import { App } from "astal/gtk4"
import { Variable, GLib, bind, exec } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk4"

import Hyprland from "gi://AstalHyprland"

export default function Workspaces() {
    const hypr = Hyprland.get_default()

    return <box name="Workspaces" orientation={1} cssClasses={["element", "workspaces"]}>
        {bind(hypr, "workspaces").as(wss => wss
            .filter(ws => !(ws.id >= -99 && ws.id <= -2)) // filter out special workspaces
            .sort((a, b) => a.id - b.id)
            .map(ws => (
                <button
                name={bind(hypr, "focusedWorkspace").as(fw =>
                        ws === fw ? "focused" : "")}
                    onClicked={() => ws.focus()}>
                    {ws.id}
                </button>
            ))
        )}
    </box>
}
