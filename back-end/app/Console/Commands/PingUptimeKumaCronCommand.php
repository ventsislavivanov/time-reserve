<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class PingUptimeKumaCronCommand extends Command
{
    protected $signature = 'app:ping-uptime-kuma-cron-command';
    protected $description = 'Send a heartbeat ping to Uptime Kuma';

    public function handle()
    {
        if (!app()->isProduction()) {
            $this->info('Ping skipped: Not in production environment.');
            return self::SUCCESS;
        }


        $url = env('UPTIME_KUMA_CRON_URL');
        if ($url) {
            \Illuminate\Support\Facades\Http::get($url);
            $this->info('Uptime Kuma successfully pinged.');
        } else {
            $this->error('Uptime Kuma push URL is missing.');
            return self::FAILURE;
        }

        return self::SUCCESS;
    }
}
