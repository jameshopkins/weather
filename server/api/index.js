import nodeFetch from 'node-fetch';

export default (fetch = nodeFetch, key = process.env.OWM_KEY) => async (req, res) => {
  const response = await fetch(`http://api.openweathermap.org/data/2.5/forecast?q=${req.query.location}&appid=${key}`);

  if (!response.ok) {
    return res.sendStatus(502);
  }
  res.send(await response.json());
}
