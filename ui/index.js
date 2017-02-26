import { Main } from "./src/Main";

Main.embed(document.getElementById("app"), {
  locations: document.getElementById("locations").innerHTML
});
