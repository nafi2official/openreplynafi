#!/bin/sh
npx prisma migrate deploy
npm run worker &
CRON_BASE_URL=http://localhost:${PORT:-10000} sh scripts/cron.sh &
exec npm run start -- -p ${PORT:-10000}
