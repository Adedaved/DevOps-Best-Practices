'use strict';

const { createApp } = require('./app');

const port = Number.parseInt(process.env.PORT || '8080', 10);
const host = process.env.HOST || '0.0.0.0';
const serviceName = process.env.SERVICE_NAME || 'sample-api';

if (!Number.isInteger(port) || port < 1 || port > 65535) {
  throw new Error('PORT must be an integer between 1 and 65535');
}

const server = createApp({ serviceName });
server.listen(port, host, () => {
  console.log(`Listening on http://${host}:${port}`);
});

function shutdown(signal) {
  console.log(`Received ${signal}; shutting down`);
  server.close(() => process.exit(0));
  setTimeout(() => process.exit(1), 10_000).unref();
}

process.once('SIGTERM', () => shutdown('SIGTERM'));
process.once('SIGINT', () => shutdown('SIGINT'));
