import assert from 'power-assert';
import { spy } from 'sinon';

import getWeatherForecast from './';

describe('Server API', () => {
  it('proxies requests to the OpenWeatherMap 5-day forecast API', async () => {
    const resJson = spy(() => ({ some: 'json' }));
    const fetch = spy(() => Promise.resolve({
      json: resJson,
      ok: true
    }));
    const resSend = spy();
    const res = {
      send: resSend
    };
    const req = {
      query: { location: 'Somewhere' }
    }

    await getWeatherForecast(fetch, 423)(req, res);
    assert(fetch.calledWith('http://samples.openweathermap.org/data/2.5/forecast?q=Somewhere&appid=423'));
    assert(resSend.calledWith({ some: 'json' }));
  });

  it('handles upstream non-2** responses correctly', async () => {
    const resJson = spy(() => ({ some: 'json' }));
    const fetch = spy(() => Promise.resolve({
      ok: false
    }));
    const resSendStatus = spy();
    const res = {
      sendStatus: resSendStatus
    };
    const req = {
      query: { location: 'Somewhere' }
    }

    await getWeatherForecast(fetch, 423)(req, res);
    assert(resSendStatus.calledWith(502));
  });
});
