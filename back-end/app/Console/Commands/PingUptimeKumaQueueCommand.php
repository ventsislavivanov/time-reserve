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
        dispatch(function () {
            $url = env('UPTIME_KUMA_QUEUE_URL');
            
            if ($url && app()->isProduction()) {
                Http::get($url);
            }
        });
    }
}
