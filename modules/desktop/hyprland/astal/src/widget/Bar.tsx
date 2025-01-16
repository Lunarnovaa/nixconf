import { App } from "astal/gtk4"
import { Variable, GLib, bind, exec } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk4"

import Hyprland from "gi://AstalHyprland"
import Wp from "gi://AstalWp"

function Workspaces() {
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

function AudioSlider(show = false) {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!


    return <box>
        
        <slider
            hexpand
            onDragged={({ value }) => speaker.volume = value}
            value={bind(speaker, "volume")}
        />
    </box>
}

function SysTray() {
    
    return <box
        name = "SysTray"
        orientation={1}
        cssClasses={["element", "systray"]}
        visible>
            <button onClicked={() => }>S</button>
            <button onClicked="pwvucontrol">󰈀</button>
            <button onClicked="blueberry &">󰂲
                
            </button>
    </box>
}

function Power() {
    return <box 
        name="Power"
        vexpand
        orientation={1}
        visible
        cssClasses={["element", "power"]}
        >
        <button onClicked="echo power">⏻</button>
    </box>
}

function Time({ format = "%H %M" }) {
    const time = Variable<string>("").poll(1000, () =>
        GLib.DateTime.new_now_local().format(format)!)

    return <label
        name="Time"
        onDestroy={() => time.drop()}
        label={time()}
        maxWidthChars={2}
        wrap
        cssClasses={["element", "time"]}
    />
}

export default function Bar(monitor = 0) {
    const { TOP, LEFT, BOTTOM } = Astal.WindowAnchor
    return <window 
        visible
        cssClasses={["Bar"]} 
        name="bar"
        monitor={monitor}
        exclusivity={Astal.Exclusivity.EXCLUSIVE}
        anchor={TOP | LEFT | BOTTOM}>
        <centerbox orientation={1}>
            <box orientation={1} vexpand valign={Gtk.Align.START}>
                
            </box>
            <box orientation={1}>
                <Workspaces/>
            </box>
            <box orientation={1} vexpand valign={Gtk.Align.END}>
                <SysTray />
                <Time/>
                <Power />
            </box>
        </centerbox>
    </window>
}