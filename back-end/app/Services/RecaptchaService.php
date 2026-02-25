<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class RecaptchaService
{
	public function validate(string $token): bool
	{
		if (app()->environment(['local', 'testing'])) {
			return true;
		}

		if (!$token) {
			return false;
		}

		$response = Http::asForm()->post(
			'https://www.google.com/recaptcha/api/siteverify',
			[
				'secret'   => config('services.recaptcha.secret'),
				'response' => $token,
			]
		);

		return $response->json('success') === true;
	}
}
