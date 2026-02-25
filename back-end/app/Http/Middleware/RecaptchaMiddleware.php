<?php

namespace App\Http\Middleware;

use App\Services\RecaptchaService;
use Closure;

class RecaptchaMiddleware
{
	protected RecaptchaService $recaptcha;

	public function __construct(RecaptchaService $recaptcha) {
		$this->recaptcha = $recaptcha;
	}
	public function handle($request, Closure $next)
	{
		if (!app()->environment('local')) {
			if (!$this->recaptcha->validate($request->input('recaptcha'))) {
				return response()->json(['error' => 'Invalid reCAPTCHA'], 422);
			}
		}

		return $next($request);
	}

}