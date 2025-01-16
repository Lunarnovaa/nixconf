import { monitorFile, exec } from "astal"

function reload() {
    exec("kill $(pidof gjs)")
    exec("nix run system#ags")
}

monitorFile(
    "/home/lunarnova/tmp/ags-colors.scss",
    reload
)