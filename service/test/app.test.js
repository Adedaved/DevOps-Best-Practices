'use strict';

const assert = require('node:assert/strict');
const test = require('node:test');
const { createApp } = require('../src/app');

async function request(server, path) {
  const address = server.address();
  return fetch(`http://127.0.0.1:${address.port}${path}`);
}

test('returns service metadata for the root endpoint', async (t) => {
  const server = createApp({ serviceName: 'test-api' });
  await new Promise((resolve) => server.listen(0, '127.0.0.1', resolve));
  t.after(() => server.close());

  const response = await request(server, '/');
  assert.equal(response.status, 200);
  assert.deepEqual(await response.json(), { status: 'ok', service: 'test-api' });
});

test('exposes health endpoints and rejects unknown paths', async (t) => {
  const server = createApp();
  await new Promise((resolve) => server.listen(0, '127.0.0.1', resolve));
  t.after(() => server.close());

  for (const path of ['/healthz', '/livez', '/readyz', '/startupz']) {
    assert.equal((await request(server, path)).status, 200);
  }
  assert.equal((await request(server, '/missing')).status, 404);
});
