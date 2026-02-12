/**
 * MYTHOS — Reverse proxy (zero dependencies)
 *
 * Combines frontend (3000) + backend (3001) on a single port (8080)
 * so we only need ONE ngrok tunnel.
 *
 *   /api/*        → localhost:3001
 *   /socket.io/*  → localhost:3001  (Socket.IO HTTP + WebSocket)
 *   everything    → localhost:3000  (Next.js)
 */

const http = require('http');
const net = require('net');

const BACKEND = { host: '127.0.0.1', port: 3001 };
const FRONTEND = { host: '127.0.0.1', port: 3000 };
const PROXY_PORT = 8080;

function getTarget(url) {
  if (url.startsWith('/api') || url.startsWith('/socket.io')) {
    return BACKEND;
  }
  return FRONTEND;
}

// ── HTTP Proxy ──────────────────────────────────────────────
const server = http.createServer((req, res) => {
  const target = getTarget(req.url);

  const proxyReq = http.request(
    {
      hostname: target.host,
      port: target.port,
      path: req.url,
      method: req.method,
      headers: { ...req.headers, host: `${target.host}:${target.port}` },
    },
    (proxyRes) => {
      res.writeHead(proxyRes.statusCode, proxyRes.headers);
      proxyRes.pipe(res);
    },
  );

  proxyReq.on('error', () => {
    res.writeHead(502);
    res.end('Bad Gateway — is the target server running?');
  });

  req.pipe(proxyReq);
});

// ── WebSocket Proxy (raw TCP tunnel after upgrade) ──────────
server.on('upgrade', (req, socket, head) => {
  const target = getTarget(req.url);

  const conn = net.connect(target.port, target.host, () => {
    // Replay the original HTTP upgrade request to the target
    const headerLines = Object.entries(req.headers)
      .map(([k, v]) => `${k}: ${v}`)
      .join('\r\n');
    conn.write(
      `${req.method} ${req.url} HTTP/${req.httpVersion}\r\n${headerLines}\r\n\r\n`,
    );
    if (head && head.length) conn.write(head);

    // Bi-directional piping
    conn.pipe(socket);
    socket.pipe(conn);
  });

  conn.on('error', () => socket.end());
  socket.on('error', () => conn.end());
});

server.listen(PROXY_PORT, () => {
  console.log('');
  console.log(`  MYTHOS Proxy running on http://localhost:${PROXY_PORT}`);
  console.log('');
  console.log('  Routing:');
  console.log(`    /api/*       → localhost:${BACKEND.port}  (REST API)`);
  console.log(`    /socket.io/* → localhost:${BACKEND.port}  (WebSocket)`);
  console.log(`    /*           → localhost:${FRONTEND.port}  (Next.js)`);
  console.log('');
});
