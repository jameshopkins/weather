# Weather Forecast

> A little web application to show the forecast in a particular area, against the [OpenWeatherMap 5-day forecast API](https://openweathermap.org/forecast5)

## Getting Started

### Setup

Both application and tests are executed in a Docker container, whose image needs to be built first.

```bash
docker build -t weather .
```

### Run The Application

Ensure you have a valid OpenWeatherMap API key assigned to the `OWM_KEY` environment variable, so it's available inside the container.

```bash
docker run -p 3000:3000 -e "OWM_KEY=YOUR_KEY_HERE" weather make run
```

### Run The Tests

```bash
docker run weather make test
```
