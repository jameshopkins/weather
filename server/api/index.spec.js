import assert, { deepEqual } from 'power-assert';
import { spy } from 'sinon';

import getWeatherForecast, { formatResponse } from './';
import response from './fixtures/response.json';
import expected from './fixtures/expected.json';

describe('Server API', () => {
  describe('Proxy', () => {
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
      const format = spy(() => ({ some: 'formatted-json' }));

      await getWeatherForecast(fetch, 423, format)(req, res);

      // Calls correct endpoint
      assert(fetch.calledWith('http://api.openweathermap.org/data/2.5/forecast?q=Somewhere&appid=423'));
      // Finishes request/response with correct payload
      assert(resSend.calledWith({ some: 'formatted-json' }));
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

  describe('Formatting', () => {
    it('correctly formats the response', () => {
      const result = formatResponse(response);
      deepEqual(result, expected);
    });
  });
});
