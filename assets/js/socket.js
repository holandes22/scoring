// NOTE: The contents of this file will only be executed if
// you uncomment its entry in "assets/js/app.js".

// To use Phoenix channels, the first step is to import Socket
// and connect at the socket path in "lib/web/endpoint.ex":
import {Socket} from "phoenix"

let socket = new Socket("/socket", {params: {token: window.userToken}})

socket.connect()

let handleUpdate = (score) => {
  console.log("UPDATTING SCORE", score);
  document.getElementById("score-left").innerText = score.left
  document.getElementById("score-right").innerText = score.right
};

let channel = socket.channel("room:lobby", {})
channel.join()
  .receive("ok", handleUpdate)
  .receive("error", resp => { console.log("Unable to join", resp) })

channel.on("score_event", score => {
  handleUpdate(score)
})

export default socket
