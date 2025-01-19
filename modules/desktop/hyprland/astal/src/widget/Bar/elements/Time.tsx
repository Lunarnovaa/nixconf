import { App } from "astal/gtk4"
import { Variable, GLib, bind, exec } from "astal"
import { Astal, Gtk, Gdk } from "astal/gtk4"


export default function Time({ format = "%H %M" }) {
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
