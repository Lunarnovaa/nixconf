export default function Power() {
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
