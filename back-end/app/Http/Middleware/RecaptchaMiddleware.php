<?php

namespace App\Http\Middleware;

use App\Services\RecaptchaService;
use Closure;

class RecaptchaMiddleware
{
	public function handle($request, Closure $next, RecaptchaService $recaptcha)
	{
		if (!app()->environment('local')) {
			if (!$recaptcha->validate($request->input('recaptcha'))) {
				return response()->json(['error' => 'Invalid reCAPTCHA'], 422);
			}
		}

		return $next($request);
	}

}