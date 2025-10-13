export default {
  label: 'Test Daily Reminder',
  description: 'Logs a message when triggered',
  triggers: [
    { resource: 'system', event: 'manual', runAs: 'admin' },    // Run manually from UI
    { resource: 'system', event: 'interval', interval: '*/5 * * * *', runAs: 'admin' } // Every 5 mins
  ],
  async exec({ $log }) {
    $log('✅ Daily Reminder test script executed at ' + new Date().toISOString())
  }
}

