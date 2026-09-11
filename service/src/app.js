'use strict';

const http = require('node:http');

function createApp({ serviceName = 'sample-api' } = {}) {
  return http.createServer((request, response) => {
    const pathname = new URL(request.url, 'http://localhost').pathname;
    const status = pathname === '/' || ['/healthz', '/livez', '/readyz', '/startupz'].includes(pathname) ? 200 : 404;
    const body = status === 200
      ? JSON.stringify({ status: 'ok', service: serviceName })
      : JSON.stringify({ error: 'not found' });

    response.writeHead(status, {
      'content-type': 'application/json; charset=utf-8',
      'cache-control': 'no-store',
      'x-content-type-options': 'nosniff'
    });
    response.end(body);
  });
}

module.exports = { createApp };
