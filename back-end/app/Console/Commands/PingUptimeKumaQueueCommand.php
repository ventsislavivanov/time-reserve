<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\Http;

class PingUptimeKumaQueueCommand extends Command
{
    protected $signature = 'app:ping-uptime-kuma-queue-command';
    protected $description = 'Dispatches a job to the queue to ping Uptime Kuma for queue health checking';


    public function handle()
    {
        if (!app()->isProduction()) {
            $this->info('Ping skipped: Not in production environment.');
            return self::SUCCESS;
        }

        dispatch(function () {
            $url = config('services.uptime_kuma.queue_url');

            if ($url && app()->isProduction()) {
                Http::get($url);
            }
        });

        $this->info('Ping job dispatched to queue.');
        return self::SUCCESS;
    }
}
