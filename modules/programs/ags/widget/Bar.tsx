import app from "ags/gtk4/app"
import { Astal, Gtk, Gdk } from "ags/gtk4"
import { execAsync } from "ags/process"
import { createPoll } from "ags/time"
import Hyprland from "gi://AstalHyprland"

function DisplayWorkspaces() {
  const hyprland = Hyprland.get_default()
  const workspaces = hyprland.get_workspaces()

  if (!workspaces || workspaces.length === 0) {
    return <box><label label="No WS" /></box>
  }

  return (
    <box>
      {workspaces.map(ws => (
        <button>
          <label label={ws.id.toString()} />
        </button>
      ))}
    </box>
  )
}


export default function Bar(gdkmonitor: Gdk.Monitor) {
  const time = createPoll("", 1000, "date")
  const { TOP, LEFT, RIGHT } = Astal.WindowAnchor
  // const hyprland = Hyprland.get_default()

  return (
    <window
      visible
      name="bar"
      class="Bar"
      gdkmonitor={gdkmonitor}
      exclusivity={Astal.Exclusivity.EXCLUSIVE}
      anchor={TOP | LEFT | RIGHT}
      application={app}
    >
      <centerbox cssName="centerbox">
        {DisplayWorkspaces()}
        {/* <button */}
        {/*   $type="start" */}
        {/*   onClicked={() => execAsync("echo hello").then(console.log)} */}
        {/*   hexpand */}
        {/*   halign={Gtk.Align.CENTER} */}
        {/* > */}
        {/*   <label label="Welcome to AGS!" /> */}
        {/* </button> */}
        <box $type="center" />
        <menubutton $type="end" hexpand halign={Gtk.Align.CENTER}>
          <label label={time} />
          <popover> 
            <Gtk.Calendar/>
          </popover>
        </menubutton>
      </centerbox>
    </window>
  )
}
