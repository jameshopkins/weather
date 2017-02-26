import express from "express";
import fetch from "node-fetch";
import path from "path";

import getWeatherForecast from "./api";

const app = express();

if (!process.env.OWM_KEY) {
  throw new Error(
    "The OWM_KEY environment variable not set. Make sure it's present before running the app"
  );
}

app.set("view engine", "pug");
app.set("views", path.join(__dirname));
app.use(express.static(path.join(process.cwd(), "public")));

app.get("/", (req, res) => res.render("index"));
app.get("/api", getWeatherForecast());

app.listen(3000, () => {
  console.log("Get your weather on http://localhost:3000!");
});
