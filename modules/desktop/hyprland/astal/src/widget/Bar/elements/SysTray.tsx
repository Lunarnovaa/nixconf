import { Variable, GLib, bind, exec } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk4"

import Wp from "gi://AstalWp"
import Network from "gi://AstalNetwork"

function AudioSlider() {
    const speaker = Wp.get_default()?.audio.defaultSpeaker!

    return <menubutton direction={Gtk.ArrowType.RIGHT} valign={Gtk.Align.CENTER}>
        <image iconName={bind(speaker, "volumeIcon")}/>
        <popover hasArrow={false}>
            <box>
                <slider
                    widthRequest={150}
                    onNotify={({value}) => (speaker.set_volume(value))}
                    value={bind(speaker,"volume")}
                    round_digits={2}
                />
            </box>
        </popover>
    </menubutton>
}

function Wifi() {
    const network = Network.get_default()
    const wifi = bind(network, "wifi")
    const wired = bind(network, "wired")

    return <button
        onClicked="pwvucontrol"
    >
        {wifi.as(wifi => wifi && (
            <image
                tooltipText={bind(wifi, "ssid").as(String)}
                iconName={bind(wifi, "iconName")}
            />
        ))}

    </button>
}

function Bluetooth() {

}

export default function SysTray() {
    return <box
        name = "SysTray"
        orientation={1}
        cssClasses={["element", "systray"]}
        visible>
            <AudioSlider/>
            <Wifi/>
            <button onClicked="blueberry">󰂲</button>
    </box>
}
