import { format, getTime } from "date-fns";
import nodeFetch from "node-fetch";
import {
  compose,
  groupBy,
  pick,
  map,
  nth,
  reduceBy,
  sort,
  split,
  toPairs
} from "ramda";

export default (
  fetch = nodeFetch,
  key = process.env.OWM_KEY,
  format = formatResponse
) =>
  async (req, res) => {
    const querystring = compose(nth(1), split("?"))(req.url);
    const response = await fetch(
      `http://api.openweathermap.org/data/2.5/forecast?${querystring}&appid=${key}`
    );

    if (!response.ok) {
      return res.sendStatus(502);
    }
    res.send(format(await response.json()));
  };

const formatTime = (fmt, time) => format(time * 1000, fmt);

const formatGroupedTimeSegment = (acc, curr) => acc.concat({
  time: formatTime(null, curr.dt),
  temp: curr.main.temp,
  pressure: curr.main.pressure,
  humidity: curr.main.humidity,
  overall: curr.weather[0].main,
  description: curr.weather[0].description,
  icon: curr.weather[0].icon
});

const groupDaysByDate = segment => formatTime("YYYY-MM-DD", segment.dt);

const sortDays = sort((a, b) => getTime(a.time) - getTime(b.time));

const formatList = map(([day, segments]) => ({
  day,
  segments
}));

const groupDaySegments = reduceBy(
  formatGroupedTimeSegment,
  [],
  groupDaysByDate
);

const createForecast = compose(sortDays, formatList, toPairs, groupDaySegments);

export const formatResponse = ({ city, list }) => ({
  location: pick(["name", "country"], city),
  forecast: createForecast(list)
});
